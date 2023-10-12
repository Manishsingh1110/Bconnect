import 'package:bconnect/models/recommendeduser.dart';
import 'package:flutter/material.dart';

class RecommendedUserCard extends StatelessWidget {
  final RecommendedUser user;

  const RecommendedUserCard({Key? key, required this.user}) : super(key: key);

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
              backgroundImage: AssetImage(user.profilePicture),
            ),
            const SizedBox(height: 4),
            Text(
              user.name,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              user.description,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              "${user.totalFollowers} Followers",
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Follow"),
            ),
          ],
        ),
      ),
    );
  }
}
