import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class AddResources extends StatefulWidget {
  const AddResources({Key? key}) : super(key: key);

  @override
  State<AddResources> createState() => _AddResourcesState();
}

class _AddResourcesState extends State<AddResources> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? selectedImagePath; // Holds the selected image path
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
                      selectedImagePath == null
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
                          : Image.network(
                              selectedImagePath!,
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
        selectedImagePath = pickedImage.path;
      });
    }
  }

  void _submitForm() async {
    String name = _nameController.text;
    String description = _descriptionController.text;
    String image = selectedImagePath ?? ''; // Use selected image path
    double price = double.tryParse(_priceController.text) ?? 0.0;
    String supplier = _supplierController.text;
    setState(() {
      isLoading = true;
    });

    try {
      // Define the API endpoint for creating a new resource
      const apiUrl =
          'https://bconnect-backend-main.onrender.com/app/createrawmaterial';

      // Create a FormData object for sending multipart/form-data
      final formData = http.MultipartRequest('POST', Uri.parse(apiUrl));

      // Add fields to the FormData
      formData.fields.addAll({
        'name': name,
        'description': description,
        'image': image,
        'price': price.toString(),
        'supplier': supplier,
      });

      final response = await http.Response.fromStream(await formData.send());

      // Check if the request was successful (status code 2xx)
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // Handle success
        // Clear the form
        setState(() {
          isLoading = false;
        });
        // Pop the current screen and navigate back to the previous screen
        Navigator.pop(context);
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
