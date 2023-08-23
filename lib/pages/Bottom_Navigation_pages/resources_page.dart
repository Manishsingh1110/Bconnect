import 'package:flutter/material.dart';


class Resources extends StatefulWidget {
  const Resources({super.key});

  @override
  State<Resources> createState() => _ResourcesState();
}

class _ResourcesState extends State<Resources> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Container(
          alignment: Alignment.center,
          child : const Text("Resources")
          )
    );
  }
}