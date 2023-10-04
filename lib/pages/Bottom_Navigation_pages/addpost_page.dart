import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Addpost extends StatefulWidget {
  const Addpost({super.key});
  @override
  State<Addpost> createState() => _AddpostState();
}

class _AddpostState extends State<Addpost> {
  final TextEditingController _postTextController = TextEditingController();
  final List<File> _selectedImages = [];

  Future<void> _selectImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      setState(() {
        _selectedImages.add(File(pickedImage.path)); // Store image as a File
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Post"),
        actions: [
          IconButton(
            icon: const Icon(Icons.done),
            onPressed: () {
              // Implement the logic to save the post and images here
              // You can use _postTextController.text to get the post text
              // and _selectedImages for selected images.
              // Once saved, navigate back to the previous page.
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _postTextController,
              decoration: const InputDecoration(
                hintText: "What's on your mind?",
                border: OutlineInputBorder(),
              ),
              maxLines: 4, // Adjust the number of lines for the post text
            ),
            const SizedBox(height: 16.0),
            _selectedImages.isEmpty
                ? Container() // No images selected
                : SizedBox(
                    height: 100.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _selectedImages.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.memory(
                            _selectedImages[index].readAsBytesSync(),
                            fit: BoxFit.cover,
                          ), // Use Image.file() for file paths
                        );
                      },
                    ),
                  ),
            ElevatedButton(
              onPressed: () {
                _showImagePickerDialog(context);
              },
              child: const Text("Add Image"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showImagePickerDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Image Source"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.camera),
                  title: const Text("Camera"),
                  onTap: () {
                    Navigator.of(context).pop();
                    _selectImage(ImageSource.camera);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.image),
                  title: const Text("Gallery"),
                  onTap: () {
                    Navigator.of(context).pop();
                    _selectImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
