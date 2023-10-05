import 'package:bconnect/components/constrant.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Addpost extends StatefulWidget {
  const Addpost({Key? key}) : super(key: key);

  @override
  State<Addpost> createState() => _AddpostState();
}

class _AddpostState extends State<Addpost> {
  final TextEditingController _postTextController = TextEditingController();
  List<String> selectedImagePaths = [];
  bool isPollActive = false;
  final TextEditingController _pollQuestionController = TextEditingController();
  final TextEditingController _pollOption1Controller = TextEditingController();
  final TextEditingController _pollOption2Controller = TextEditingController();

  Future<void> _selectImages() async {
    List<XFile>? pickedImages;

    try {
      final picker = ImagePicker();
      pickedImages = await picker.pickMultiImage();
      // ignore: empty_catches
    } on Exception {}

    setState(() {
      selectedImagePaths =
          (pickedImages ?? []).map((image) => image.path).toList();
    });
  }

  void _removeImage(int index) {
    setState(() {
      selectedImagePaths.removeAt(index);
    });
  }

  void _togglePoll() {
    setState(() {
      isPollActive = !isPollActive;
    });
  }

  void _createPoll() {
    // Logic to create and submit the poll
    final pollQuestion = _pollQuestionController.text;
    final pollOption1 = _pollOption1Controller.text;
    final pollOption2 = _pollOption2Controller.text;

    // Implement your logic to submit the poll data

    // For demonstration, we'll print the poll data
    print('Poll Question: $pollQuestion');
    print('Poll Option 1: $pollOption1');
    print('Poll Option 2: $pollOption2');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Post"),
        backgroundColor: navbar, // Change to your desired color
        leading: IconButton(
          icon: const Icon(Icons.clear), // Change to a cross icon
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check), // Icon for adding the post
            onPressed: () {
              // Implement your logic to add the post here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color:
                        Colors.transparent), // Set border color to transparent
                borderRadius:
                    BorderRadius.circular(8.0), // Add border radius if needed
              ),
              child: TextField(
                controller: _postTextController,
                decoration: const InputDecoration(
                  hintText: "What do you want to talk about?",
                  contentPadding:
                      EdgeInsets.all(16.0), // Adjust padding as needed
                  border: InputBorder.none, // Remove border
                ),
                maxLines: null, // Allows dynamic height
              ),
            ),
            const SizedBox(height: 16.0),
            // Display selected images in a grid
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of columns in the grid
                crossAxisSpacing: 8.0, // Spacing between columns
                mainAxisSpacing: 8.0, // Spacing between rows
              ),
              itemCount: selectedImagePaths.length,
              shrinkWrap: true, // Wrap the grid in a SingleChildScrollView
              physics:
                  const NeverScrollableScrollPhysics(), // Disable scrolling in the grid
              itemBuilder: (BuildContext context, int index) {
                final imagePath = selectedImagePaths[index];
                return Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _showImageDialog(context, imagePath);
                      },
                      child: Image.network(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(Icons.cancel),
                        onPressed: () {
                          _removeImage(index);
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 16.0),
            // Poll creation fields
            if (isPollActive) ...[
              const SizedBox(height: 16.0),
              const Text(
                "Poll Question:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _pollQuestionController,
                decoration: const InputDecoration(
                  hintText: "Enter your poll question",
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                "Poll Options:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _pollOption1Controller,
                decoration: const InputDecoration(
                  hintText: "Option 1",
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _pollOption2Controller,
                decoration: const InputDecoration(
                  hintText: "Option 2",
                ),
              ),
            ],
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(
              backgroundColor: navbar,
              onPressed: () {
                _selectImages();
              },
              child: const Icon(Icons.image),
            ),
          ),
          const SizedBox(width: 16.0), // Add spacing between the buttons
          Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(
              backgroundColor: navbar,
              onPressed: () {
                _togglePoll();
              },
              child: const Icon(Icons.poll),
            ),
          ),
        ],
      ),
    );
  }

  // Function to show the image in a dialog
  void _showImageDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop(); // Close the dialog when tapped
            },
            child: Image.network(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
