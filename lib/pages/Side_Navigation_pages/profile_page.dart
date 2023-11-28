import 'package:bconnect/components/allfollowers.dart';
import 'package:bconnect/components/allpost.dart';
import 'package:bconnect/components/followercard.dart';
import 'package:bconnect/components/recommendedgroupcard.dart';
import 'package:bconnect/components/recommendedusercard.dart';
import 'package:bconnect/components/socialmediapostcard.dart';
import 'package:bconnect/models/follower.dart';
import 'package:bconnect/models/recommendedgroup.dart';
import 'package:bconnect/models/recommendeduser.dart';
import 'package:bconnect/pages/Side_Navigation_pages/setting_page.dart';
import 'package:bconnect/pages/user_Authentication_pages/login_page.dart';
import 'package:bconnect/state/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:math';

import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isExpanded = false;
  bool showAllFollowers = false;
  Map<String, dynamic>? storedUser;
  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    final userLogin = Userlogin();
    final user = await userLogin.retrieveUser();
    if (user != null) {
      setState(() {
        storedUser = user;
      });
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Login()));
    }
  }

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
    ThemeData theme = Theme.of(context);
    Color primaryColor = theme.primaryColor;
    Color hintColor = theme.hintColor;
    final userAvatarUrl = storedUser?['avatar'] ?? '/';

    String displayName;

    if (storedUser?['profileType'] == 'company') {
      displayName = storedUser?['companyname'] ?? 'No name available';
    } else {
      if (storedUser?['firstname'] != null && storedUser?['lastname'] != null) {
        displayName = '${storedUser?['firstname']} ${storedUser?['lastname']}';
      } else {
        displayName = 'No name available';
      }
    }

    Widget followersSection() {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [hintColor, hintColor],
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [hintColor, hintColor],
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [hintColor, hintColor],
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
        backgroundColor: primaryColor,
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
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [hintColor, hintColor],
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(height: 5),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  displayName,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    storedUser?['description'] ??
                                        'No name available',
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
                Positioned(
                  top: -60,
                  left: 15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                          userAvatarUrl,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [hintColor, hintColor],
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
                                TextSpan(
                                  // Show a limited portion of text when not expanded.
                                  text: storedUser?['aboutus'] ??
                                      'No about data available',
                                  style: const TextStyle(),
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
                                TextSpan(
                                  // Show a limited portion of text when not expanded.
                                  text: storedUser?['aboutus'] ??
                                      'No about data available',
                                  style: const TextStyle(),
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
            const SizedBox(height: 2),
            const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Activities",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Consumer<PostListModel>(
                  builder: (context, postListModel, child) {
                    final posts = postListModel.posts;
                    final itemCount = posts.length > 3 ? 3 : posts.length;

                    return Column(
                      children: [
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: itemCount,
                          itemBuilder: (context, index) {
                            final post = posts[index];
                            return SocialMediaPostCard(post: post);
                          },
                        ),
                        if (posts.length > 3)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const AllPostsPage(),
                                    ),
                                  );
                                },
                                child: const Text("See All Activities"),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 2),
            followersSection(),
            const SizedBox(height: 2),
            buildRecommendedUsers(),
            const SizedBox(height: 2),
            buildRecommendedGroups()
          ],
        ),
      ),
    );
  }
}
