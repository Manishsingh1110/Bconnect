import 'package:flutter/material.dart';

class Addpost extends StatefulWidget {
  const Addpost({super.key});
  @override
  State<Addpost> createState() => _AddpostState();
}

class _AddpostState extends State<Addpost> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:
        Container(
          alignment: Alignment.center,
          child: const Text("Add Post"),
        )
    );
  }
}