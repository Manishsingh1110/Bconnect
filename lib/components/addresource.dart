import 'dart:io';
import 'package:bconnect/pages/Side_Navigation_pages/profile_page.dart';
import 'package:bconnect/state/state.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AddResources extends StatefulWidget {
  const AddResources({Key? key}) : super(key: key);

  @override
  State<AddResources> createState() => _AddResourcesState();
}

class _AddResourcesState extends State<AddResources> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  File? selectedImageFile; // Holds the selected image file
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _supplierController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Color primaryColor = theme.primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Resources"),
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                ),
                const SizedBox(height: 16.0),
                GestureDetector(
                  onTap: _pickImage, // Trigger image picking
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      selectedImageFile == null
                          ? Container(
                              width: double.infinity,
                              height: 200,
                              color: Colors.grey[200],
                              child: const Icon(
                                Icons.camera_alt,
                                size: 40,
                                color: Colors.grey,
                              ),
                            )
                          : Image.file(
                              selectedImageFile!, // Use the picked image file directly
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _priceController,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _supplierController,
                  decoration: const InputDecoration(
                    labelText: 'Supplier',
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    _submitForm();
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.7),
              child: Center(
                child: Lottie.asset(
                  'assets/images/lottie2.json',
                  width: 400,
                  height: 300,
                  fit: BoxFit.fill,
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        selectedImageFile = File(pickedImage.path); // Store picked image file
      });
    }
  }

  void _submitForm() async {
    String name = _nameController.text;
    String description = _descriptionController.text;
    String image = selectedImageFile?.path ?? ''; // Use selected image path
    double price = double.tryParse(_priceController.text) ?? 0.0;
    String supplier = _supplierController.text;
    setState(() {
      isLoading = true;
    });
    final Userlogin userLogin = Userlogin();
    try {
      const apiUrl =
          'https://bconnect-backend-main.onrender.com/app/createrawmaterial';
      final String? jwtToken = await userLogin.retrieveJwt();
      final formData = http.MultipartRequest('POST', Uri.parse(apiUrl));
      formData.fields.addAll({
        'name': name,
        'description': description,
        'image': image,
        'price': price.toString(),
        'supplier': supplier,
      });
      formData.headers.addAll({
        'Content-Type': 'application/json',
        'auth-token': jwtToken!,
      });

      final response = await http.Response.fromStream(await formData.send());
      if (response.statusCode >= 200 && response.statusCode < 300) {
        setState(() {
          isLoading = false;
        });

        await userLogin.deleteUser();
        final customerData = jsonDecode(response.body)['customer'];
        try {
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('customerData', jsonEncode(customerData));
          // ignore: empty_catches
        } catch (e) {}
        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Profile()));
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }
}
