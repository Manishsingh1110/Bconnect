import 'package:bconnect/pages/home_page.dart';
import "package:flutter/material.dart";
import 'package:bconnect/constrant.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
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
            overflowSpacing: size.height * 0.014,
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
              TextField(
                keyboardType: TextInputType.text,
                style: const TextStyle(color: kInputColor),
                decoration: InputDecoration(
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
              TextField(
                obscureText: true,
                keyboardType: TextInputType.text,
                style: const TextStyle(color: kInputColor),
                decoration: InputDecoration(
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
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Home()));
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
                  )
                  ),
              SizedBox(
                height: size.height * 0.014,
              ),
              SvgPicture.asset("assets/icon/deisgn.svg"),
              SizedBox(
                height: size.height * 0.014,
              ),
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
                  )
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
