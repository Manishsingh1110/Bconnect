import 'package:flutter/material.dart';

class AllFollowersPage extends StatelessWidget {
  const AllFollowersPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Add code to retrieve and display all followers in a 1x1 grid layout
    // You can use a similar approach as in the Profile class to create the grid
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Followers"),
      ),
      body: const Center(
        child: Text("Display all followers here in a 1x1 grid layout."),
      ),
    );
  }
}
