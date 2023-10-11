import 'package:bconnect/components/addpoll.dart';
import 'package:bconnect/components/constrant.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Addpost extends StatefulWidget {
  const Addpost({Key? key}) : super(key: key);

  @override
  State<Addpost> createState() => _AddpostState();
}

class _AddpostState extends State<Addpost> {
  final TextEditingController _postTextController = TextEditingController();
  List<String> selectedImagePaths = [];

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
                      child: Image.file(
                        // Use Image.file instead of Image.network
                        File(
                            imagePath), // Assuming imagePath is a local file path
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AddPoll()));
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
