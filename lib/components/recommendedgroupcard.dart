import 'package:bconnect/models/recommendedgroup.dart';
import 'package:flutter/material.dart';

class RecommendedGroupCard extends StatelessWidget {
  final RecommendedGroup group;

  const RecommendedGroupCard({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2, // Add elevation for a card-like appearance
      child: Center(
        // Center the content vertically
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Align everything in the middle
          children: [
            CircleAvatar(
              radius: 32,
              backgroundImage: AssetImage(group.groupImage),
            ),
            const SizedBox(height: 4),
            Text(
              group.name,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              group.description,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              "${group.totalMembers} Members",
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Handle follow button tap logic here
                // You can toggle the follow status and update the UI accordingly
              },
              child: const Text("Follow"),
            ),
          ],
        ),
      ),
    );
  }
}
