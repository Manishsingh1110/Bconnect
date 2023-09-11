import 'package:bconnect/pages/user_Authentication_pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:bconnect/components/constrant.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  int _currentStep = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController usernameController;
  late TextEditingController companyNameController;
  late TextEditingController companyScaleController;
  late TextEditingController companyDescriptionController;
  late TextEditingController product1Controller;
  late TextEditingController product2Controller;
  late TextEditingController product3Controller;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    usernameController = TextEditingController();
    companyNameController = TextEditingController();
    companyScaleController = TextEditingController();
    companyDescriptionController = TextEditingController();
    product1Controller = TextEditingController();
    product2Controller = TextEditingController();
    product3Controller = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
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
    product1Controller.dispose();
    product2Controller.dispose();
    product3Controller.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
        body: Container(
            height: double.maxFinite,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [g1, g2])),
            child: SingleChildScrollView(
                padding: EdgeInsets.all(size.height * 0.03),
                child: OverflowBar(
                    overflowSpacing: size.height * 0.02,
                    overflowAlignment: OverflowBarAlignment.center,
                    children: [
                      SizedBox(height: size.height * 0.008),
                      Image.asset(image1),
                      const Text(
                        "Please , Sign In.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 34,
                          color: kWhiteColor,
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: _buildStep(),
                      ),
                      SvgPicture.asset("assets/icon/deisgn.svg"),
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
                                      color: Color.fromRGBO(120, 37, 137, 0.25),
                                      offset: Offset(0, 25))
                                ],
                                borderRadius: BorderRadius.circular(40),
                                color:const Color.fromRGBO(225, 225, 225, 0.25)),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  color: kWhiteColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                    ]))));
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
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.red, width: 1.2),
                  ),
                  errorStyle:
                      const TextStyle(fontSize: 16.0, color: Colors.white),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  filled: true,
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
            SizedBox(height: size.height * 0.008),
            TextFormField(
              style: const TextStyle(color: kInputColor),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.red, width: 1.2),
                  ),
                  errorStyle:
                      const TextStyle(fontSize: 16.0, color: Colors.white),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  filled: true,
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
            SizedBox(height: size.height * 0.008),
            TextFormField(
              style: const TextStyle(color: kInputColor),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.red, width: 1.2),
                  ),
                  errorStyle:
                      const TextStyle(fontSize: 16.0, color: Colors.white),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  filled: true,
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
            SizedBox(height: size.height * 0.008),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 250,
                  child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed:_nextStep,
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
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.red, width: 1.2),
                  ),
                  errorStyle:
                      const TextStyle(fontSize: 16.0, color: Colors.white),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  filled: true,
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
            SizedBox(height: size.height * 0.008),
            TextFormField(
              style: const TextStyle(color: kInputColor),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.red, width: 1.2),
                  ),
                  errorStyle:
                      const TextStyle(fontSize: 16.0, color: Colors.white),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  filled: true,
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
            SizedBox(height: size.height * 0.008),
            TextFormField(
              style: const TextStyle(color: kInputColor),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.red, width: 1.2),
                  ),
                  errorStyle:
                      const TextStyle(fontSize: 16.0, color: Colors.white),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  filled: true,
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
            SizedBox(height: size.height * 0.008),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 120,
                  child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed:_previousStep,
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
                      onPressed:_nextStep,
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
    return Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              style: const TextStyle(color: kInputColor),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.red, width: 1.2),
                  ),
                  errorStyle:
                      const TextStyle(fontSize: 16.0, color: Colors.white),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  filled: true,
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
            SizedBox(height: size.height * 0.008),
            TextFormField(
              style: const TextStyle(color: kInputColor),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.red, width: 1.2),
                  ),
                  errorStyle:
                      const TextStyle(fontSize: 16.0, color: Colors.white),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  filled: true,
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
            SizedBox(height: size.height * 0.008),
            TextFormField(
              style: const TextStyle(color: kInputColor),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.red, width: 1.2),
                  ),
                  errorStyle:
                      const TextStyle(fontSize: 16.0, color: Colors.white),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  filled: true,
                  hintText: "Confirm Password",
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(keyIcon),
                  ),
                  fillColor: kWhiteColor,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(40))),
              controller: confirmPasswordController,
              obscureText: true,
              validator: (value) {
                if (value == null || value != passwordController.text) {
                  return 'Passwords do not match.';
                }
                return null;
              },
            ),
            SizedBox(height: size.height * 0.008),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 120,
                  child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed:_previousStep,
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
                      padding: EdgeInsets.zero,onPressed: () {
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
                                  color: Color.fromRGBO(120, 37, 137, 0.25),
                                  offset: Offset(0, 25))
                            ],
                            borderRadius: BorderRadius.circular(40),
                            color: kButtonColor),
                        child: const Text(
                          "Sign In",
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
}
