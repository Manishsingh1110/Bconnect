import 'package:bconnect/pages/user_Authentication_pages/login_page.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(40),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight)),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Lottie.asset('assets/images/lottie.json', controller: _controller,
                onLoaded: (compos) {
              _controller
                ..duration = compos.duration
                ..forward().then((value) => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Login())));
            }),
            const SizedBox(height: 40),
            const Text("Let's Be connected ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white))
          ])),
    );
  }
}
