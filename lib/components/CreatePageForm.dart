// ignore: file_names
import 'dart:io';
import 'package:bconnect/pages/user_Authentication_pages/login_page.dart';
import 'package:bconnect/state/state.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class CreatePageForm extends StatefulWidget {
  final String userid;
  const CreatePageForm({Key? key, required this.userid}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _CreatePageFormState createState() => _CreatePageFormState();
}

class _CreatePageFormState extends State<CreatePageForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  File? _avatar;
  File? _backgroundImage;
  bool _isLoading = false;

  Future<void> _submitForm() async {
    setState(() {
      _isLoading = true;
    });

    if (_formKey.currentState!.validate()) {
      // Retrieve JWT token from shared preferences
      final Userlogin userLogin = Userlogin();
      final String? jwtToken = await userLogin.retrieveJwt();

      if (jwtToken == null) {
        // Handle the case where JWT token is not found
        setState(() {
          _isLoading = false;
        });
        throw Exception('JWT token not found');
      }

      // Send form data to server
      var url = Uri.parse(
          'https://bconnect-backend-main.onrender.com/app/createPage');
      var request = http.MultipartRequest('POST', url);
      request.headers['Content-Type'] = 'application/json';
      request.headers['auth-token'] = jwtToken;
      request.fields['name'] = _nameController.text;
      request.fields['description'] = _descriptionController.text;
      if (_avatar != null) {
        request.files
            .add(await http.MultipartFile.fromPath('avatar', _avatar!.path));
      }
      if (_backgroundImage != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'coverPhoto', _backgroundImage!.path));
      }
      var response = await request.send();

      if (response.statusCode == 201) {
        // Page created successfully
        // Delete stored user
        await userLogin.deleteUser();
        setState(() {
          _isLoading = false;
        });
        // Navigate to login page
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Login()));
      } else {
        // Handle error
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _pickImage(ImageSource source, Function(File?) setImage) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        setImage(File(pickedImage.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Page'),
      ),
      body: _isLoading
          ? Container(
              color: Colors.black
                  .withOpacity(0.7), // Adjust opacity for blur effect
              child: Center(
                  child: Center(
                      child: Lottie.asset(
                'assets/images/lottie2.json', // replace 'assets/loading_animation.json' with the path to your Lottie animation file
                width: 400,
                height: 300,
                fit: BoxFit.fill,
              ))),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _descriptionController,
                      decoration:
                          const InputDecoration(labelText: 'Description'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the description';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    if (_avatar != null)
                      Image.file(
                        _avatar!,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ElevatedButton(
                      onPressed: () => _pickImage(ImageSource.gallery, (image) {
                        _avatar = image;
                      }),
                      child: const Text('Pick Avatar'),
                    ),
                    const SizedBox(height: 20),
                    if (_backgroundImage != null)
                      Image.file(
                        _backgroundImage!,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ElevatedButton(
                      onPressed: () => _pickImage(ImageSource.gallery, (image) {
                        _backgroundImage = image;
                      }),
                      child: const Text('Pick Background Image'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
