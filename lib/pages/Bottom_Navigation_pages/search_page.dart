import 'package:flutter/material.dart';
import 'dart:math';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SearchState createState() => _SearchState();
}

class Follower {
  final String name;
  final String profilePicture;
  final String description;
  final int totalFollowers;

  Follower({
    required this.name,
    required this.profilePicture,
    required this.description,
    required this.totalFollowers,
  });
}

class RecommendedUser {
  final String name;
  final String profilePicture;
  final String description;
  final int totalFollowers;

  RecommendedUser({
    required this.name,
    required this.profilePicture,
    required this.description,
    required this.totalFollowers,
  });
}

class RecommendedGroup {
  final String name;
  final String groupImage;
  final String description;
  final int totalMembers;

  RecommendedGroup({
    required this.name,
    required this.groupImage,
    required this.description,
    required this.totalMembers,
  });
}

class _SearchState extends State<Search> {
  bool isExpanded = false;
  bool showAllFollowers = false;
  String searchText = "";
  List<String> users = [];
  List<String> groups = [];
  List<String> posts = [];
  void performSearch() {}

  final List<Follower> followers = [
    Follower(
      name: "Follower 1",
      profilePicture: "assets/images/image_2.jpg",
      description: "Flutter enthusiast",
      totalFollowers: 100,
    ),
    Follower(
      name: "Follower 1",
      profilePicture: "assets/images/image_2.jpg",
      description: "Flutter enthusiast",
      totalFollowers: 100,
    ),
    Follower(
      name: "Follower 1",
      profilePicture: "assets/images/image_2.jpg",
      description: "Flutter enthusiast",
      totalFollowers: 100,
    ),
    Follower(
      name: "Follower 1",
      profilePicture: "assets/images/image_2.jpg",
      description: "Flutter enthusiast",
      totalFollowers: 100,
    ),
    Follower(
      name: "Follower 1",
      profilePicture: "assets/images/image_2.jpg",
      description: "Flutter enthusiast",
      totalFollowers: 100,
    ),
    Follower(
      name: "Follower 1",
      profilePicture: "assets/images/image_2.jpg",
      description: "Flutter enthusiast",
      totalFollowers: 100,
    ),
    Follower(
      name: "Follower 1",
      profilePicture: "assets/images/image_2.jpg",
      description: "Flutter enthusiast",
      totalFollowers: 100,
    ),
    Follower(
      name: "Follower 1",
      profilePicture: "assets/images/image_2.jpg",
      description: "Flutter enthusiast",
      totalFollowers: 100,
    ),
    // Add more followers as needed
  ];
  final List<RecommendedUser> recommendedUsers = [
    RecommendedUser(
      name: "Recommended User 1",
      profilePicture: "assets/images/image_2.jpg",
      description: "Flutter developer",
      totalFollowers: 500,
    ),
    RecommendedUser(
      name: "Recommended User 1",
      profilePicture: "assets/images/image_2.jpg",
      description: "Flutter developer",
      totalFollowers: 500,
    ),
    RecommendedUser(
      name: "Recommended User 1",
      profilePicture: "assets/images/image_2.jpg",
      description: "Flutter developer",
      totalFollowers: 500,
    ),
    RecommendedUser(
      name: "Recommended User 1",
      profilePicture: "assets/images/image_2.jpg",
      description: "Flutter developer",
      totalFollowers: 500,
    ),
    // Add more recommended users as needed
  ];
  final List<RecommendedGroup> recommendedGroups = [
    RecommendedGroup(
      name: "Recommended Group 1",
      groupImage: "assets/images/image_2.jpg",
      description: "Flutter enthusiasts",
      totalMembers: 1000,
    ),
    // Add more recommended groups as needed
  ];

  @override
  Widget build(BuildContext context) {
    Widget followersSection() {
      return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white60],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Followers",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              followers.isEmpty
                  ? const Text("No followers yet.")
                  : GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: showAllFollowers
                          ? followers.length
                          : min(4, followers.length),
                      itemBuilder: (context, index) {
                        final follower = followers[index];
                        return FollowerCard(follower: follower);
                      },
                    ),
              if (followers.length > 4 && !showAllFollowers)
                const Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 10), // Add vertical padding
                ),
            ],
          ),
        ),
      );
    }

    Widget buildRecommendedUsers() {
      return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white60],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Recommended Users",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                ),
                itemCount: recommendedUsers.length,
                itemBuilder: (context, index) {
                  final user = recommendedUsers[index];
                  return RecommendedUserCard(user: user);
                },
              ),
            ],
          ),
        ),
      );
    }

    Widget buildRecommendedGroups() {
      return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white60],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Recommended Groups",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                ),
                itemCount: recommendedGroups.length,
                itemBuilder: (context, index) {
                  final group = recommendedGroups[index];
                  return RecommendedGroupCard(group: group);
                },
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    searchText = value; // Update searchText as the user types
                  });
                },
                onSubmitted: (value) {
                  performSearch(); // Trigger the search when the user submits the query
                },
                decoration: InputDecoration(
                  hintText: "Search...",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              SingleChildScrollView(
                child: Column(
                  children: [
                    // Display search results for users
                    if (users.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Users",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          followersSection(),
                        ],
                      ),
                    // Display search results for groups
                    if (groups.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Groups",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          buildRecommendedGroups()
                        ],
                      ),
                    // Display search results for posts
                    if (posts.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Posts",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          for (String post in posts)
                            ListTile(
                              title: Text(post),
                              onTap: () {
                                // Handle post selection
                              },
                            ),
                        ],
                      ),
                    // Display a message when there are no results
                    if (users.isEmpty && groups.isEmpty && posts.isEmpty)
                      const Text(
                        "No results found.",
                        style: TextStyle(fontSize: 16),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              buildRecommendedUsers(),
              const SizedBox(height: 15),
              buildRecommendedGroups(),
            ],
          ),
        ),
      ),
    );
  }
}

class FollowerCard extends StatelessWidget {
  final Follower follower;

  const FollowerCard({Key? key, required this.follower}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2, // Add elevation for a card-like appearance
      child: Container(
        height: 200, // Set a fixed height for the card (adjust as needed)
        padding: const EdgeInsets.all(8), // Add padding for spacing
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
      ),
    );
  }
}

class RecommendedUserCard extends StatelessWidget {
  final RecommendedUser user;

  const RecommendedUserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2, // Add elevation for a card-like appearance
      child: Container(
        height: 200, // Set a fixed height for the card (adjust as needed)
        padding: const EdgeInsets.all(8), // Add padding for spacing
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
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}

class RecommendedGroupCard extends StatelessWidget {
  final RecommendedGroup group;

  const RecommendedGroupCard({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2, // Add elevation for a card-like appearance
      child: Container(
        height: 200, // Set a fixed height for the card (adjust as needed)
        padding: const EdgeInsets.all(8), // Add padding for spacing
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
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
