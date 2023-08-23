import 'package:bconnect/components/constrant.dart';
import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navbar,
      ),
      body: 
        Container(
          alignment: Alignment.center,
          child: const Text("Chat")
        ),
    );
  }
}