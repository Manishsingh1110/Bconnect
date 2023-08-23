import 'package:bconnect/components/splashscreen.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'B-Connect',
      theme: ThemeData(primarySwatch: Colors.blue,fontFamily:"sf-pro-Text"),
      home: const SplashScreen(),
    );
  }
}


