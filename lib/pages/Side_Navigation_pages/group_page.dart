import 'package:bconnect/components/constrant.dart';
import 'package:flutter/material.dart';

class Group extends StatefulWidget {
  const Group({super.key});

  @override
  State<Group> createState() => _GroupState();
}

class _GroupState extends State<Group> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navbar,
      ),
      body: 
        Container(
          alignment: Alignment.center,
          child: const Text("Groups")
        ),
    );
  }
}