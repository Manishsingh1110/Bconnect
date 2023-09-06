import 'package:bconnect/components/constrant.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:navbar,
      ),
      body: 
        Container(
          alignment: Alignment.center,
          child: const Text("Settings")
        ),
    );
  }
}