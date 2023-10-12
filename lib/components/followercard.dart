import 'package:bconnect/models/follower.dart';
import 'package:flutter/material.dart';

class FollowerCard extends StatelessWidget {
  final Follower follower;

  const FollowerCard({Key? key, required this.follower}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2, // Add elevation for a card-like appearance
      // Set a fixed height for the card (adjust as needed)
      // Add padding for spacing
      child: Center(
        // Center the content vertically
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Align everything in the middle
          children: [
            CircleAvatar(
              radius: 32, // Adjust the radius as needed
              backgroundImage: AssetImage(follower.profilePicture),
            ),
            const SizedBox(height: 4),
            Text(
              follower.name,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              follower.description,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              "${follower.totalFollowers} Followers",
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Handle follow button tap logic here
                // You can toggle the follow status and update the UI accordingly
              },
              child: const Text("Following"),
            ),
          ],
        ),
      ),
    );
  }
}
