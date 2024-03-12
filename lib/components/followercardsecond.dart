import 'package:bconnect/models/follower.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class FollowerCardsecond extends StatelessWidget {
  final Follower follower;
  final VoidCallback? onTap;

  const FollowerCardsecond({Key? key, required this.follower, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage(follower.profilePicture),
              ),
              const SizedBox(height: 4),
              Text(
                follower.name,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                follower.description,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                "${_generateRandomFollowers()} Followers",
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
      ),
    );
  }

  int _generateRandomFollowers() {
    return 100 + _getRandom().nextInt(101);
  }

// Helper method to get a random number generator
  Random _getRandom() {
    return Random();
  }
}
