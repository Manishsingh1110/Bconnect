import 'dart:convert';

import 'package:bconnect/Layout/landing.dart';
import 'package:bconnect/pages/user_Authentication_pages/signup_page.dart';
import "package:flutter/material.dart";
import 'package:bconnect/components/constrant.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  final formkey = GlobalKey<FormState>();
  var email = TextEditingController();
  var password = TextEditingController();
  bool isLoading = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> login() async {
    setState(() {
      isLoading = true;
    });

    const String url = 'https://bconnect-backend-main.onrender.com/app/getuser';

    final data = {
      'email': email.text,
      'password': password.text,
    };

    final jsonData = jsonEncode(data);

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonData,
    );

    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });

      final jwtToken = jsonDecode(response.body)['jwttoken'];
      final customerData = jsonDecode(response.body)['customer'];
      try {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('jwtToken', jwtToken);
        prefs.setString('customerData', jsonEncode(customerData));
        // ignore: empty_catches
      } catch (e) {}
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Landing()));
    } else {
      setState(() {
        isLoading = false;
      });

      email.clear();
      password.clear();
      throw Exception('Error: ${response.statusCode}, ${response.body}');
    }
  }

  Widget customLoadingIndicator() {
    return const Center(
      child: SpinKitFadingCircle(
        color: Colors.blue, // Customize the color to match your design
        size: 50.0, // Customize the size
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        key: scaffoldKey,
        body: Form(
          key: formkey,
          child: Container(
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
                  isLoading
                      ? const Center(
                          child: SpinKitFadingCircle(
                            color: Colors.blue,
                            size: 50.0,
                          ),
                        )
                      : const SizedBox(),
                  SizedBox(height: size.height * 0.04),
                  Image.asset(image1),
                  Text(
                    "Welcome Back!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: kWhiteColor.withOpacity(0.7),
                    ),
                  ),
                  const Text(
                    "Please , Log In.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                      color: kWhiteColor,
                    ),
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter a Email";
                      }
                      bool val = RegExp(
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                          .hasMatch(value);
                      if (!val) {
                        return "Enter a valid Email";
                      }
                      return null;
                    },
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: kInputColor),
                    decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1.2),
                        ),
                        errorStyle: const TextStyle(
                            fontSize: 16.0, color: Colors.white),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 20),
                        filled: true,
                        hintText: "E-mail",
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(userIcon),
                        ),
                        fillColor: kWhiteColor,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(40))),
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter a Password";
                      }
                      if (value.length <= 5) {
                        return "Minimum Length of the password is 5";
                      }
                      return null;
                    },
                    controller: password,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(color: kInputColor),
                    decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1.2),
                        ),
                        errorStyle: const TextStyle(
                            fontSize: 16.0, color: Colors.white),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 20),
                        filled: true,
                        hintText: "Password",
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(keyIcon),
                        ),
                        fillColor: kWhiteColor,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(40))),
                  ),
                  CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: login,
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: size.height * 0.07,
                        decoration: BoxDecoration(
                            color: kButtonColor,
                            borderRadius: BorderRadius.circular(40)),
                        child: const Text(
                          "Continue",
                          style: TextStyle(
                              color: kWhiteColor, fontWeight: FontWeight.w600),
                        ),
                      )),
                  SvgPicture.asset("assets/icon/deisgn.svg"),
                  CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupPage()));
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
                            color: const Color.fromRGBO(225, 225, 225, 0.25)),
                        child: const Text(
                          "Signup",
                          style: TextStyle(
                              color: kWhiteColor, fontWeight: FontWeight.w600),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
