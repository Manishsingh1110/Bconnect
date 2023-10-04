import 'package:bconnect/components/allfollowers.dart';
import 'package:bconnect/components/constrant.dart';
import 'package:bconnect/pages/Side_Navigation_pages/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:math';

class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => _ProfileState();
}

class LinkedInPost {
  final String userName;
  final String userImage;
  final String postText;
  final String postImage;
  final String timeAgo;
  final int likeCount;
  final int commentCount;

  LinkedInPost({
    required this.userName,
    required this.userImage,
    required this.postText,
    required this.postImage,
    required this.timeAgo,
    required this.likeCount,
    required this.commentCount,
  });
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

class _ProfileState extends State<Profile> {
  bool isExpanded = false;
  bool showAllFollowers = false;
  final List<LinkedInPost> posts = [
    LinkedInPost(
      userName: "John Doe",
      userImage: "assets/images/image_2.jpg",
      postText:
          "Excited to start a new project! 🚀 #Flutter #MobileAppDevelopment",
      postImage: "assets/images/image_1.png",
      timeAgo: "2 hours ago",
      likeCount: 45,
      commentCount: 12,
    ),
    LinkedInPost(
      userName: "John Doe",
      userImage: "assets/images/image_2.jpg",
      postText:
          "Excited to start a new project! 🚀 #Flutter #MobileAppDevelopment",
      postImage: "assets/images/image_1.png",
      timeAgo: "2 hours ago",
      likeCount: 45,
      commentCount: 12,
    ),
    LinkedInPost(
      userName: "John Doe",
      userImage: "assets/images/image_2.jpg",
      postText:
          "Excited to start a new project! 🚀 #Flutter #MobileAppDevelopment",
      postImage: "assets/images/image_1.png",
      timeAgo: "2 hours ago",
      likeCount: 45,
      commentCount: 12,
    ),
    LinkedInPost(
      userName: "John Doe",
      userImage: "assets/images/image_2.jpg",
      postText:
          "Excited to start a new project! 🚀 #Flutter #MobileAppDevelopment",
      postImage: "assets/images/image_1.png",
      timeAgo: "2 hours ago",
      likeCount: 45,
      commentCount: 12,
    ),
    LinkedInPost(
      userName: "John Doe",
      userImage: "assets/images/image_2.jpg",
      postText:
          "Excited to start a new project! 🚀 #Flutter #MobileAppDevelopment",
      postImage: "assets/images/image_1.png",
      timeAgo: "2 hours ago",
      likeCount: 45,
      commentCount: 12,
    ),
    // Add more posts as needed
  ];
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
    Size size = MediaQuery.of(context).size;
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10), // Add vertical padding
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the AllFollowersPage when the button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AllFollowersPage(),
                          ),
                        );
                      },
                      child: const Text("See All Followers"),
                    ),
                  ),
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
      appBar: AppBar(
        backgroundColor: navbar,
        title: const Text("My Profile Page"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Open Settings',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Setting()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  "assets/images/image_2.jpg",
                  width: size.width,
                  height: size.height * 0.25,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.white60],
                    ),
                  ),
                  child: Stack(
                    children: [
                      const Positioned(
                        top: 20,
                        right: 30,
                        child: Icon(Icons.edit),
                      ),
                      Positioned(
                        top: 64,
                        left: 30,
                        child: SizedBox(
                          width: size.width - 30,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 5),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Manish Singh",
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              SizedBox(height: 5),
                              Padding(
                                padding: EdgeInsets.only(right: 15),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "The debugEmulateFlutterTesterEnvironment getter is deprecated and will be removed in a future release. Please use debug Emulate Flutter Tester Environment` from `dart:ui_web` instead.",
                                    softWrap: true,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Positioned(
                  top: -60,
                  left: 15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Container(
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
                      "About Us",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10),
                    AnimatedCrossFade(
                      firstChild: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
                                  // Show a limited portion of text when not expanded.
                                  text:
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: "Read More",
                                  style: const TextStyle(
                                    color: Colors.blue,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      setState(() {
                                        isExpanded = true;
                                      });
                                    },
                                ),
                              ],
                            ),
                            maxLines: 3,
                          ),
                        ],
                      ),
                      secondChild: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
                                  // Show a limited portion of text when not expanded.
                                  text:
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: "Read Less",
                                  style: const TextStyle(
                                    color: Colors.blue,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      setState(() {
                                        isExpanded = false;
                                      });
                                    },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      crossFadeState: isExpanded
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 100),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
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
                      "Activities",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListView.builder(
                      physics:
                          const NeverScrollableScrollPhysics(), // Prevent activities section from scrolling
                      shrinkWrap: true,
                      itemCount: posts.length > 3 ? 3 : posts.length,
                      itemBuilder: (context, index) {
                        final post = posts[index];
                        return LinkedInPostWidget(post: post);
                      },
                    ),
                    if (posts.length >
                        3) // Show "See All Activity" button if there are more than 3 posts
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10), // Add vertical padding
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              // Navigate to the AllFollowersPage when the button is pressed
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const AllFollowersPage(),
                                ),
                              );
                            },
                            child: const Text("See All Activities"),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            followersSection(),
            const SizedBox(height: 15),
            buildRecommendedUsers(),
            const SizedBox(height: 15),
            buildRecommendedGroups()
          ],
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

class LinkedInPostWidget extends StatefulWidget {
  final LinkedInPost post;

  const LinkedInPostWidget({super.key, required this.post});

  @override
  // ignore: library_private_types_in_public_api
  _LinkedInPostWidgetState createState() => _LinkedInPostWidgetState();
}

class _LinkedInPostWidgetState extends State<LinkedInPostWidget> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
        child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(widget.post.userImage),
                radius: 24,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.post.userName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black, // Change text color
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.all(4)),
          Text(
            widget.post.postText,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black, // Change text color
            ),
          ),
          const SizedBox(height: 12),
          Image.asset(
            widget.post.postImage,
            height: size.height * 0.5,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      child: Icon(
                        Icons.thumb_up,
                        size: 32, // Adjust the size as needed
                        color: isLiked ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "${widget.post.likeCount} Likes",
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.comment,
                      color: Colors.black), // Change icon color
                  const SizedBox(width: 4),
                  Text(
                    "${widget.post.commentCount} Comments",
                    style: const TextStyle(
                      color: Colors.black, // Change text color
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
