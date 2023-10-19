import 'package:bconnect/Layout/landing.dart';
import 'package:bconnect/components/addpoll.dart';
import 'package:bconnect/pages/user_Authentication_pages/login_page.dart';
import 'package:bconnect/state/state.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Addpost extends StatefulWidget {
  const Addpost({Key? key}) : super(key: key);

  @override
  State<Addpost> createState() => _AddpostState();
}

class _AddpostState extends State<Addpost> {
  bool isLoading = false;
  final TextEditingController _postTextController = TextEditingController();
  List<String> selectedImagePaths = [];
  String storejwt = "";
  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    final userLogin = Userlogin();
    final user = await userLogin.retrieveJwt();
    if (user != null) {
      setState(() {
        storejwt = user;
      });
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Login()));
    }
  }

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

  Future<void> addpost() async {
    setState(() {
      isLoading = true;
    });
    const String url =
        'https://bconnect-backend-main.onrender.com/app/createpost/user';

    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers['Content-Type'] = 'multipart/form-data';
    request.headers['auth-token'] = storejwt;

    request.fields['postText'] = _postTextController.text;

    for (var imagePath in selectedImagePaths) {
      var file = await http.MultipartFile.fromPath(
        'postImages',
        imagePath,
      );
      request.files.add(file);
    }
    try {
      var response = await request.send();
      var responseData = await response.stream.toBytes();
      var responseString = utf8.decode(responseData);

      if (response.statusCode == 201) {
        setState(() {
          isLoading = false;
        });
        // Registration successful, return a success message or navigate to the login page
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Landing()),
        );
        return; // Exit the function if successful
      } else {
        setState(() {
          isLoading = false;
        });
        _postTextController.clear();
        throw Exception('Error: ${response.statusCode}, $responseString');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Color primaryColor = theme.primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Post"),
        backgroundColor: primaryColor, // Change to your desired color
        leading: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: addpost,
          ),
        ],
      ),
      body: Stack(children: [
        SingleChildScrollView(
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
        if (isLoading)
          Container(
            color:
                Colors.black.withOpacity(0.5), // Adjust opacity for blur effect
            child: Center(
              child: customLoadingIndicator(),
            ),
          )
      ]),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(
              backgroundColor: primaryColor,
              onPressed: () {
                _selectImages();
              },
              child: const Icon(Icons.image, color: Colors.white),
            ),
          ),
          const SizedBox(width: 16.0),
          Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(
              backgroundColor: primaryColor,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AddPoll()));
              },
              child: const Icon(Icons.poll, color: Colors.white),
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
}
