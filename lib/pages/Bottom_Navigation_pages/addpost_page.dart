import 'package:bconnect/components/addpoll.dart';
import 'package:bconnect/components/constrant.dart';
import 'package:bconnect/models/postcard.dart';
import 'package:bconnect/state/state.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:provider/provider.dart';

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
    } catch (e) {
      // Handle any errors that may occur when picking images
    }

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
          icon: const Icon(Icons.clear),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              // Handle the action when the user taps the checkmark icon to add a post
              _addPost();
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
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                controller: _postTextController,
                decoration: const InputDecoration(
                  hintText: "What do you want to talk about?",
                  contentPadding: EdgeInsets.all(16.0),
                  border: InputBorder.none,
                ),
                maxLines: null,
              ),
            ),
            const SizedBox(height: 16.0),
            // Display selected images in a grid
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: selectedImagePaths.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final imagePath = selectedImagePaths[index];
                return Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _showImageDialog(context, imagePath);
                      },
                      child: Image.file(
                        File(imagePath),
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
            // Other components or widgets can be added here for poll creation, etc.
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
          const SizedBox(width: 16.0),
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

  void _showImageDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Image.file(
              File(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  void _addPost() {
    // Handle the logic for adding a post, including text and images
    // Once the post is added, you can notify listeners or perform other actions
    // For example:
    final post = Post(
      userName: 'John Doe',
      userImage: "assets/images/cool-profile-picture-natural-light.webp",
      timeAgo: '2 hours ago',
      likeCount: 45,
      commentCount: 12,
      postText:
          'This is a sample social media post text with a single image. You can replace it with your own content.',
      postImages: ['assets/images/image_2.jpg'],
    );
    PostListModel postListModel =
        Provider.of<PostListModel>(context, listen: false);
    postListModel.addPost(post);
    Navigator.of(context).pop();
  }
}
