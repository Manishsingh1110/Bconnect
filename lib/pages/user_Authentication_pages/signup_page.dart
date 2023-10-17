// ignore_for_file: avoid_print

import 'package:bconnect/pages/user_Authentication_pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:bconnect/components/constrant.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  int _currentStep = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? selectedImagePath;
  List<String> userProducts = [];
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController usernameController;
  late TextEditingController companyNameController;
  late TextEditingController companyScaleController;
  late TextEditingController companyDescriptionController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController productController;
  late TextEditingController aboutUsController;
  List<String> profileTypes = ['user', 'company'];
  String selectedProfileType = 'user';

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    usernameController = TextEditingController();
    companyNameController = TextEditingController();
    companyScaleController = TextEditingController();
    companyDescriptionController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    productController = TextEditingController();
    aboutUsController = TextEditingController();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        selectedImagePath = pickedImage.path;
      });
    }
  }

  @override
  void dispose() {
    // Dispose of the controllers when they are no longer needed
    firstNameController.dispose();
    lastNameController.dispose();
    usernameController.dispose();
    companyNameController.dispose();
    companyScaleController.dispose();
    companyDescriptionController.dispose();
    emailController.dispose();
    passwordController.dispose();
    productController.dispose();
    aboutUsController.dispose();
    super.dispose();
  }

  void _nextStep() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      if (_currentStep < 2) {
        setState(() {
          _currentStep++;
        });
      }
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
            child: Container(
                height: double.maxFinite,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [g1, g2])),
                child: SingleChildScrollView(
                    padding: EdgeInsets.all(size.height * 0.03),
                    child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Center vertically
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: size.height * 0.05),
                          GestureDetector(
                            onTap: _pickImage,
                            child: selectedImagePath == null
                                ? CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.grey[200],
                                    child: const Icon(
                                      Icons.camera_alt,
                                      size: 40,
                                      color: Colors.grey,
                                    ),
                                  )
                                : ClipOval(
                                    child: Image.file(
                                      File(selectedImagePath!),
                                      width: 150,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          const Text(
                            "Please , Sign In.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 34,
                              color: kWhiteColor,
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Form(
                            key: _formKey,
                            child: _buildStep(),
                          ),
                          SizedBox(height: size.height * 0.02),
                          SvgPicture.asset("assets/icon/deisgn.svg"),
                          SizedBox(height: size.height * 0.02),
                          CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Login()));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                height: size.height * 0.07,
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          blurRadius: 45,
                                          spreadRadius: 0,
                                          color: Color.fromRGBO(
                                              120, 37, 137, 0.25),
                                          offset: Offset(0, 25))
                                    ],
                                    borderRadius: BorderRadius.circular(40),
                                    color: const Color.fromRGBO(
                                        225, 225, 225, 0.25)),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              )),
                        ])))));
  }

  Widget _buildStep() {
    switch (_currentStep) {
      case 0:
        return _buildPersonalInfoCard();
      case 1:
        return _buildCompanyInfoCard();
      case 2:
        return _buildEmailPasswordCard();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildPersonalInfoCard() {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            style: const TextStyle(color: kInputColor),
            decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.red, width: 1.2),
                ),
                errorStyle:
                    const TextStyle(fontSize: 16.0, color: Colors.white),
                contentPadding: const EdgeInsets.symmetric(vertical: 20),
                filled: true,
                hintStyle: const TextStyle(color: Colors.grey),
                hintText: "First Name",
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(userIcon),
                ),
                fillColor: kWhiteColor,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(40))),
            controller: firstNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your first name.';
              }
              return null;
            },
          ),
          SizedBox(height: size.height * 0.02),
          TextFormField(
            style: const TextStyle(color: kInputColor),
            decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.red, width: 1.2),
                ),
                errorStyle:
                    const TextStyle(fontSize: 16.0, color: Colors.white),
                contentPadding: const EdgeInsets.symmetric(vertical: 20),
                filled: true,
                hintStyle: const TextStyle(color: Colors.grey),
                hintText: "Last Name",
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(userIcon),
                ),
                fillColor: kWhiteColor,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(40))),
            controller: lastNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your last name.';
              }
              return null;
            },
          ),
          SizedBox(height: size.height * 0.02),
          TextFormField(
            style: const TextStyle(color: kInputColor),
            decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.red, width: 1.2),
                ),
                errorStyle:
                    const TextStyle(fontSize: 16.0, color: Colors.white),
                contentPadding: const EdgeInsets.symmetric(vertical: 20),
                filled: true,
                hintStyle: const TextStyle(color: Colors.grey),
                hintText: "Username",
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(userIcon),
                ),
                fillColor: kWhiteColor,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(40))),
            controller: usernameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a username.';
              }
              return null;
            },
          ),
          SizedBox(height: size.height * 0.02),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              filled: true,
              hintStyle: const TextStyle(color: Colors.grey),
              fillColor: kWhiteColor,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            value: selectedProfileType,
            onChanged: (String? newValue) {
              // Specify the type as 'String?' or 'String'
              if (newValue != null) {
                // Check for null value
                setState(() {
                  selectedProfileType = newValue;
                });
              }
            },
            items: profileTypes.map((type) {
              return DropdownMenuItem<String>(
                value: type,
                child: Text(type),
              );
            }).toList(),
          ),

          SizedBox(height: size.height * 0.02),

          // About Us Text Field
          TextFormField(
            style: const TextStyle(color: kInputColor),
            maxLines: 4, // Multiline text box
            decoration: InputDecoration(
              filled: true,
              hintStyle: const TextStyle(color: Colors.grey),
              hintText: "About Us",
              fillColor: kWhiteColor,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            controller: aboutUsController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please provide information about your company or yourself.';
              }
              return null;
            },
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 250,
                child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: _nextStep,
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: size.height * 0.07,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 45,
                                spreadRadius: 0,
                                color: Color.fromRGBO(120, 37, 137, 0.25),
                                offset: Offset(0, 25))
                          ],
                          borderRadius: BorderRadius.circular(40),
                          color: kButtonColor),
                      child: const Text(
                        "Next",
                        style: TextStyle(
                            color: kWhiteColor, fontWeight: FontWeight.w600),
                      ),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyInfoCard() {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            style: const TextStyle(color: kInputColor),
            decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.red, width: 1.2),
                ),
                errorStyle:
                    const TextStyle(fontSize: 16.0, color: Colors.white),
                contentPadding: const EdgeInsets.symmetric(vertical: 20),
                filled: true,
                hintStyle: const TextStyle(color: Colors.grey),
                hintText: "Company Name",
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(userIcon),
                ),
                fillColor: kWhiteColor,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(40))),
            controller: companyNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your company name.';
              }
              return null;
            },
          ),
          SizedBox(height: size.height * 0.02),
          TextFormField(
            style: const TextStyle(color: kInputColor),
            decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.red, width: 1.2),
                ),
                errorStyle:
                    const TextStyle(fontSize: 16.0, color: Colors.white),
                contentPadding: const EdgeInsets.symmetric(vertical: 20),
                filled: true,
                hintStyle: const TextStyle(color: Colors.grey),
                hintText: "Company Scale",
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(userIcon),
                ),
                fillColor: kWhiteColor,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(40))),
            controller: companyScaleController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your company Scale.';
              }
              return null;
            },
          ),
          SizedBox(height: size.height * 0.02),
          TextFormField(
            style: const TextStyle(color: kInputColor),
            decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.red, width: 1.2),
                ),
                errorStyle:
                    const TextStyle(fontSize: 16.0, color: Colors.white),
                contentPadding: const EdgeInsets.symmetric(vertical: 20),
                filled: true,
                hintStyle: const TextStyle(color: Colors.grey),
                hintText: "Description",
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(userIcon),
                ),
                fillColor: kWhiteColor,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(40))),
            controller: companyDescriptionController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your company Description.';
              }
              return null;
            },
          ),
          SizedBox(height: size.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 120,
                child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: _previousStep,
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: size.height * 0.07,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 45,
                                spreadRadius: 0,
                                color: Color.fromRGBO(120, 37, 137, 0.25),
                                offset: Offset(0, 25))
                          ],
                          borderRadius: BorderRadius.circular(40),
                          color: kButtonColor),
                      child: const Text(
                        "Previous",
                        style: TextStyle(
                            color: kWhiteColor, fontWeight: FontWeight.w600),
                      ),
                    )),
              ),
              SizedBox(
                width: 120,
                child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: _nextStep,
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: size.height * 0.07,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 45,
                                spreadRadius: 0,
                                color: Color.fromRGBO(120, 37, 137, 0.25),
                                offset: Offset(0, 25))
                          ],
                          borderRadius: BorderRadius.circular(40),
                          color: kButtonColor),
                      child: const Text(
                        "Next",
                        style: TextStyle(
                            color: kWhiteColor, fontWeight: FontWeight.w600),
                      ),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmailPasswordCard() {
    Size size = MediaQuery.of(context).size;

    Future<void> signUp() async {
      const String url =
          'https://bconnect-backend-main.onrender.com/app/createuser'; // Replace with your backend URL

      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers['Content-Type'] = 'multipart/form-data';

      request.fields['email'] = emailController.text;
      request.fields['password'] = passwordController.text;
      request.fields['username'] = usernameController.text;
      request.fields['companyname'] = companyNameController.text;
      request.fields['companyscale'] = companyScaleController.text;
      request.fields['Products'] = jsonEncode(userProducts);
      request.fields['firstname'] = firstNameController.text;
      request.fields['lastname'] = lastNameController.text;
      request.fields['description'] = companyDescriptionController.text;
      request.fields['aboutus'] = aboutUsController.text;
      request.fields['profileType'] = selectedProfileType;

      // Attach the image file (if selected)
      if (selectedImagePath != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'avatar', // Replace with the field name expected by your backend
          selectedImagePath!,
        ));
      }
      print(request.files);
      var response = await request.send();
      var responseData = await response.stream.toBytes();
      var responseString = utf8.decode(responseData);

      if (response.statusCode == 201) {
        // Registration successful, return a success message or navigate to the login page
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Login()));
      } else {
        emailController.clear();
        passwordController.clear();
        productController.clear();
        userProducts.clear();
        setState(() {
          _currentStep = 0;
        });
        throw Exception('Error: ${response.statusCode}, $responseString');
      }
    }

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            style: const TextStyle(color: kInputColor),
            decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.red, width: 1.2),
                ),
                errorStyle:
                    const TextStyle(fontSize: 16.0, color: Colors.white),
                contentPadding: const EdgeInsets.symmetric(vertical: 20),
                filled: true,
                hintStyle: const TextStyle(color: Colors.grey),
                hintText: "Email",
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(userIcon),
                ),
                fillColor: kWhiteColor,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(40))),
            controller: emailController,
            validator: (value) {
              if (value == null || value.isEmpty || !value.contains('@')) {
                return 'Please enter a valid email address.';
              }
              return null;
            },
          ),
          SizedBox(height: size.height * 0.02),
          TextFormField(
            style: const TextStyle(color: kInputColor),
            decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.red, width: 1.2),
                ),
                errorStyle:
                    const TextStyle(fontSize: 16.0, color: Colors.white),
                contentPadding: const EdgeInsets.symmetric(vertical: 20),
                filled: true,
                hintStyle: const TextStyle(color: Colors.grey),
                hintText: "Password",
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(keyIcon),
                ),
                fillColor: kWhiteColor,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(40))),
            controller: passwordController,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 6) {
                return 'Password must be at least 6 characters.';
              }
              return null;
            },
          ),
          SizedBox(height: size.height * 0.02),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  style: const TextStyle(color: kInputColor),
                  decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1.2),
                      ),
                      errorStyle:
                          const TextStyle(fontSize: 16.0, color: Colors.white),
                      contentPadding: const EdgeInsets.symmetric(vertical: 20),
                      filled: true,
                      hintStyle: const TextStyle(color: Colors.grey),
                      hintText: "Add your products",
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(userIcon),
                      ),
                      fillColor: kWhiteColor,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(40))),
                  controller: productController,
                  onFieldSubmitted: (value) {
                    setState(() {
                      userProducts.add(value);
                      productController.clear();
                    });
                  },
                ),
              ),
              SizedBox(width: size.width * 0.008),
              GestureDetector(
                onTap: () {
                  setState(() {
                    userProducts.add(productController.text);
                    productController.clear();
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(
                      5), // Adjust the padding to make it smaller
                  decoration: BoxDecoration(
                    color: kButtonColor, // Customize the button color
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20, // Adjust the size of the Icon
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.02),
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 8.0, // Adjust the spacing between input fields
            children: [
              for (int i = 0; i < userProducts.length; i++)
                Chip(
                  label: Text(
                    userProducts[i],
                    style: const TextStyle(
                        color: Colors.purple), // Set text color to purple
                  ),
                  onDeleted: () {
                    setState(() {
                      userProducts.removeAt(i);
                    });
                  },
                  backgroundColor:
                      Colors.white, // Set the background color to white
                ),
            ],
          ),
          SizedBox(height: size.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 120,
                child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: _previousStep,
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: size.height * 0.07,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 45,
                                spreadRadius: 0,
                                color: Color.fromRGBO(120, 37, 137, 0.25),
                                offset: Offset(0, 25))
                          ],
                          borderRadius: BorderRadius.circular(40),
                          color: kButtonColor),
                      child: const Text(
                        "Previous",
                        style: TextStyle(
                            color: kWhiteColor, fontWeight: FontWeight.w600),
                      ),
                    )),
              ),
              SizedBox(
                  width: 120,
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed:
                        signUp, // Call the signUp function when the button is pressed
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: size.height * 0.07,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 45,
                            spreadRadius: 0,
                            color: Color.fromRGBO(120, 37, 137, 0.25),
                            offset: Offset(0, 25),
                          )
                        ],
                        borderRadius: BorderRadius.circular(40),
                        color: kButtonColor,
                      ),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: kWhiteColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
