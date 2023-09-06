import 'package:bconnect/Layout/landing.dart';
import "package:flutter/material.dart";
import 'package:bconnect/components/constrant.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  final formkey = GlobalKey<FormState>();
  var email = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
            overflowSpacing: size.height * 0.024,
            overflowAlignment: OverflowBarAlignment.center,
            children: [
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
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          const BorderSide(color: Colors.red, width: 1.2),
                    ),
                    errorStyle: const TextStyle(
                        fontSize: 16.0, color: Colors.white),
                    contentPadding: const EdgeInsets.symmetric(vertical: 25),
                    filled: true,
                    hintText: "E-mail",
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
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ), errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          const BorderSide(color: Colors.red, width: 1.2),
                    ),
                    errorStyle: const TextStyle(
                        fontSize: 16.0, color: Colors.white),
                    contentPadding: const EdgeInsets.symmetric(vertical: 25),
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
              ),
              CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    final form = formkey.currentState!;
                    if (form.validate()) {
                      if (email.text == "Manish@gmail.com" ||
                          password.text == "123456") {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Landing()));
                      }
                    } else {
                      // ignore: avoid_print
                      print(email.text);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: size.height * 0.08,
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
                  onPressed: () {},
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: size.height * 0.08,
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
