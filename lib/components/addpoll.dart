import 'package:bconnect/components/constrant.dart';
import 'package:flutter/material.dart';

class AddPoll extends StatefulWidget {
  const AddPoll({super.key});

  @override
  State<AddPoll> createState() => _AddPollState();
}

class _AddPollState extends State<AddPoll> {
  final TextEditingController _pollQuestionController = TextEditingController();
  final List<TextEditingController> _pollOptionControllers = [
    TextEditingController()
  ];
  int numberOfOptions = 1;

  void _createPoll() {
    // Logic to create and submit the poll
    final pollQuestion = _pollQuestionController.text;
    final List<String> pollOptions =
        _pollOptionControllers.map((controller) => controller.text).toList();

    // ignore: avoid_print
    print('Poll Question: $pollQuestion');
    // ignore: avoid_print
    print('Poll Options: $pollOptions');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Poll"),
        backgroundColor: navbar, // Change to your desired color
        // Set your desired color here
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Change to a cross icon
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check), // Icon for adding the post
            onPressed: () {
              _createPoll();
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
            const Text(
              "Poll Question:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey, // Choose your border color
                  width: 1.0, // Choose your border width
                ),
                borderRadius: BorderRadius.circular(
                    8.0), // Adjust border radius as needed
              ),
              child: TextField(
                controller: _pollQuestionController,
                decoration: const InputDecoration(
                  hintText: "Enter your poll question",
                  contentPadding: EdgeInsets.all(
                      10.0), // Add padding to the text field content
                  border:
                      InputBorder.none, // Remove the default TextField border
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Poll Options:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: numberOfOptions,
              itemBuilder: (BuildContext context, int index) {
                return Column(children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey, // Choose your border color
                        width: 1.0, // Choose your border width
                      ),
                      borderRadius: BorderRadius.circular(
                          8.0), // Adjust border radius as needed
                    ),
                    child: TextField(
                      controller: _pollOptionControllers[index],
                      decoration: InputDecoration(
                        hintText: "Option ${index + 1}",
                        contentPadding: const EdgeInsets.all(
                            10.0), // Add padding to the text field content
                        border: InputBorder
                            .none, // Remove the default TextField border
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                ]);
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // Increase the number of options
                  numberOfOptions++;
                  // Add a new TextEditingController for the new option
                  _pollOptionControllers.add(TextEditingController());
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: navbar, // Change to your desired button color
              ),
              child: const Text("Add Option"),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: AddPoll(),
  ));
}
