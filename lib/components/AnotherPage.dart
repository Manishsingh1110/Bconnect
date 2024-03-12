import 'package:bconnect/components/ByProductCard.dart';
import 'package:bconnect/components/rawmaterial.dart';
import 'package:bconnect/components/recommendedgroupcard.dart';
import 'package:bconnect/components/recommendedusercard.dart';
import 'package:bconnect/models/recommendedgroup.dart';
import 'package:bconnect/models/recommendeduser.dart';
import 'package:bconnect/state/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:ui';
import 'package:bconnect/models/postcard.dart';

class AnotherPage extends StatefulWidget {
  final Map<String, dynamic> userData;

  const AnotherPage({Key? key, required this.userData}) : super(key: key);
  @override
  State<AnotherPage> createState() => _ProfileState();
}

class _ProfileState extends State<AnotherPage> {
  bool isExpanded = false;
  bool showAllFollowers = false;

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
    final userAvatarUrl = widget.userData['avatar'] ?? '/';

    String displayName;

    if (widget.userData['profileType'] == 'company') {
      displayName = widget.userData['companyname'] ?? 'No name available';
    } else {
      if (widget.userData['firstname'] != null &&
          widget.userData['lastname'] != null) {
        displayName =
            '${widget.userData['firstname']} ${widget.userData['lastname']}';
      } else {
        displayName = 'No name available';
      }
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
        title: Text('${widget.userData['username']} Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.network(
                  widget.userData['coverPhoto'],
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
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                            width: size.width - 30,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 40),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      displayName,
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            20, // Adjust the size as needed
                                      ),
                                    ),
                                    const Icon(Icons.edit),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  widget.userData['description'] ??
                                      'No name available',
                                  softWrap: true,
                                ),
                                const SizedBox(height: 0),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
                      firstChild: buildCollapsed(),
                      secondChild: buildExpanded(),
                      crossFadeState: isExpanded
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 300),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 2),
            Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Raw Materials",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildRawMaterials(),
                    ])),
            Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        "ByProducts",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildByProducts(),
                    ])),
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
              ),
            ),
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
                            return SocialMediaPostCard2(
                                post: post, avatar: widget.userData['avatar']);
                          },
                        ),
                        if (posts.length > 3)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Center(
                              child: ElevatedButton(
                                onPressed: () {},
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
            buildRecommendedUsers(),
            const SizedBox(height: 2),
            buildRecommendedGroups()
          ],
        ),
      ),
    );
  }

  Widget buildCollapsed() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: getLimitedText(),
                style: const TextStyle(),
              ),
              TextSpan(
                text: " ... Read More",
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
        ),
      ],
    );
  }

  Widget buildExpanded() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: widget.userData['aboutus'] ?? 'No about data available',
                style: const TextStyle(),
              ),
              TextSpan(
                text: " Read Less",
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
    );
  }

  Widget _buildRawMaterials() {
    final List<dynamic> pages = widget.userData['Page'] ?? [];

    // Use only the first page if available, otherwise use an empty map
    final Map<String, dynamic> pageData = pages.isNotEmpty ? pages[0] : {};

    final List<dynamic> rawMaterials = pageData['rawMaterials'] ?? [];

    if (rawMaterials.isEmpty) {
      return const Center(
        child: Text(
          'No Raw Materials available',
          style: TextStyle(fontSize: 16.0),
        ),
      );
    }

    return RawMaterialsList(
      rawMaterials: rawMaterials.map((material) {
        return {
          'name': material['name'] ?? '',
          'description': material['description'] ?? '',
          'image': material['image'] ?? '',
          'price': material['price'] != null
              ? (material['price'] is int
                  ? (material['price'] as int).toDouble()
                  : material['price'])
              : 0.0,
          // Adjust type as needed
          'supplier': widget.userData['username'] ?? 'No name available',
        };
      }).toList(),
      groupid: pageData["_id"], // Use the _id from the first page
    );
  }

  Widget _buildByProducts() {
    final List<dynamic> pages = widget.userData['Page'] ?? [];

    // Use only the first page if available, otherwise use an empty map
    final Map<String, dynamic> pageData = pages.isNotEmpty ? pages[0] : {};

    final List<dynamic> byProducts = pageData['byProducts'] ?? [];

    if (byProducts.isEmpty) {
      return const Center(
        child: Text(
          'No Raw Materials available',
          style: TextStyle(fontSize: 16.0),
        ),
      );
    }
    return ByProductsList(
      byProducts: byProducts.map((material) {
        return {
          'name': material['name'] ?? '',
          'description': material['description'] ?? '',
          'image': material['image'] ?? '',
          'price': material['price'] != null
              ? (material['price'] is int
                  ? (material['price'] as int).toDouble()
                  : material['price'])
              : 0.0,
          // Adjust type as needed
          'supplier': widget.userData['username'] ?? 'No name available',
        };
      }).toList(),
      groupid: pageData["_id"], // Use the _id from the first page
    );
  }

  String getLimitedText() {
    String originalText =
        widget.userData['aboutus'] ?? 'No about data available';
    List<String> words = originalText.split(' ');
    int maxWords = 20; // Set your desired word limit
    return words.take(maxWords).join(' ');
  }
}

class SocialMediaPostCard2 extends StatefulWidget {
  final Post post;
  final String avatar;

  const SocialMediaPostCard2(
      {super.key, required this.post, required this.avatar});

  @override
  // ignore: library_private_types_in_public_api
  _SocialMediaPostCard createState() => _SocialMediaPostCard();
}

class _SocialMediaPostCard extends State<SocialMediaPostCard2> {
  @override
  Widget build(BuildContext context) {
    Widget postContent;
    bool isLiked = false;

    if (widget.post.postImages != null && widget.post.postImages!.isNotEmpty) {
      if (widget.post.postImages!.length == 1) {
        postContent = Hero(
          tag: widget.post.postImages![0], // Unique tag for the image
          child: GestureDetector(
            onTap: () {
              _showImageDialog(context, widget.post.postImages![0]);
            },
            child: Image.network(
              widget.post.postImages![0],
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        );
      } else if (widget.post.postImages!.length == 2) {
        postContent = Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Hero(
                tag: widget
                    .post.postImages![0], // Unique tag for the first image
                child: GestureDetector(
                  onTap: () {
                    _showImageDialog(context, widget.post.postImages![0]);
                  },
                  child: Image.network(
                    widget.post.postImages![0],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8.0), // Add spacing between images
            Expanded(
              flex: 1,
              child: Hero(
                tag: widget
                    .post.postImages![1], // Unique tag for the second image
                child: GestureDetector(
                  onTap: () {
                    _showImageDialog(context, widget.post.postImages![1]);
                  },
                  child: Image.network(
                    widget.post.postImages![1],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        );
      } else if (widget.post.postImages!.length == 3) {
        postContent = Column(
          children: <Widget>[
            Hero(
              tag: widget.post.postImages![0], // Unique tag for the first image
              child: GestureDetector(
                onTap: () {
                  _showImageDialog(context, widget.post.postImages![0]);
                },
                child: Image.network(
                  widget.post.postImages![0],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 8.0), // Add spacing between images
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: widget
                        .post.postImages![1], // Unique tag for the second image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, widget.post.postImages![1]);
                      },
                      child: Image.network(
                        widget.post.postImages![1],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0), // Add spacing between images
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: widget
                        .post.postImages![2], // Unique tag for the third image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, widget.post.postImages![2]);
                      },
                      child: Image.network(
                        widget.post.postImages![2],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      } else if (widget.post.postImages!.length == 4) {
        postContent = Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: widget
                        .post.postImages![0], // Unique tag for the first image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, widget.post.postImages![0]);
                      },
                      child: Image.network(
                        widget.post.postImages![0],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0), // Add spacing between images
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: widget
                        .post.postImages![1], // Unique tag for the second image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, widget.post.postImages![1]);
                      },
                      child: Image.network(
                        widget.post.postImages![1],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0), // Add spacing between rows
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: widget
                        .post.postImages![2], // Unique tag for the third image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, widget.post.postImages![2]);
                      },
                      child: Image.network(
                        widget.post.postImages![2],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0), // Add spacing between images
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: widget
                        .post.postImages![3], // Unique tag for the fourth image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, widget.post.postImages![3]);
                      },
                      child: Image.network(
                        widget.post.postImages![3],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      } else if (widget.post.postImages!.length == 5) {
        postContent = Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: widget
                        .post.postImages![0], // Unique tag for the first image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, widget.post.postImages![0]);
                      },
                      child: Image.network(
                        widget.post.postImages![0],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0), // Add spacing between images
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: widget
                        .post.postImages![1], // Unique tag for the second image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, widget.post.postImages![1]);
                      },
                      child: Image.network(
                        widget.post.postImages![1],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0), // Add spacing between rows
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: widget
                        .post.postImages![2], // Unique tag for the third image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, widget.post.postImages![2]);
                      },
                      child: Image.network(
                        widget.post.postImages![2],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0), // Add spacing between images
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: widget
                        .post.postImages![3], // Unique tag for the fourth image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, widget.post.postImages![3]);
                      },
                      child: Image.network(
                        widget.post.postImages![3],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0), // Add spacing between images
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: widget
                        .post.postImages![4], // Unique tag for the fourth image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, widget.post.postImages![4]);
                      },
                      child: Image.network(
                        widget.post.postImages![4],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      } else {
        // If there are more than 4 images, show a grid with "Show More" text
        // ignore: unused_local_variable
        List<Widget> imageWidgets = widget.post.postImages!.map((imagePath) {
          return Image.asset(
            imagePath,
            fit: BoxFit.cover,
          );
        }).toList();
        postContent = Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: widget
                        .post.postImages![0], // Unique tag for the first image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, widget.post.postImages![0]);
                      },
                      child: Image.network(
                        widget.post.postImages![0],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0), // Add spacing between images
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: widget
                        .post.postImages![1], // Unique tag for the second image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, widget.post.postImages![1]);
                      },
                      child: Image.network(
                        widget.post.postImages![1],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0), // Add spacing between rows
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: widget
                        .post.postImages![2], // Unique tag for the third image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, widget.post.postImages![2]);
                      },
                      child: Image.network(
                        widget.post.postImages![2],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0), // Add spacing between images
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: widget
                        .post.postImages![3], // Unique tag for the fourth image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, widget.post.postImages![3]);
                      },
                      child: Image.network(
                        widget.post.postImages![3],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0), // Add spacing between images
                Expanded(
                  flex: 1,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                        child: Image.network(
                          widget.post.postImages![
                              4], // Use an image as a background for the text
                          fit: BoxFit.cover,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _showMultiImageDialog(
                              context, widget.post.postImages!);
                          // Add your custom function here
                        },
                        child: const Text(
                          'Show More',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      }
    } else {
      // Handle the case when there are no images
      postContent = const SizedBox.shrink();
    }
    ThemeData theme = Theme.of(context);
    Color hintColor = theme.hintColor;

    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                // ignore: unnecessary_null_comparison
                backgroundImage: widget.avatar != null
                    ? NetworkImage(widget.avatar) as ImageProvider
                    : const AssetImage('fallback_image_path'),
              ),
              title: Text(widget.post.userName),
              subtitle: Text(widget.post.timeAgo ?? 'Unknown Time'),
              trailing: PopupMenuButton<String>(
                onSelected: (value) {
                  // Handle menu item selection here
                  if (value == 'edit') {
                    // Handle edit action
                  } else if (value == 'delete') {
                    // Handle delete action
                  }
                },
                itemBuilder: (BuildContext context) {
                  return <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'edit',
                      child: Text('Save'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'delete',
                      child: Text('Not Interested'),
                    ),
                  ];
                },
              ),
            ),
            const Divider(
              height: 1,
              color: Colors.grey,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Text(
                widget.post.postText,
                style: const TextStyle(fontSize: 16.0),
                // Show ellipsis for overflowed text
              ),
            ),
            postContent,
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.thumb_up),
                      onPressed: () {
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "${widget.post.likeCount} Likes",
                      style: TextStyle(
                          color: (hintColor == Colors.black)
                              ? Colors.white
                              : Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.comment),
                      onPressed: () {
                        // Implement comment functionality here
                      },
                    ),
                    const SizedBox(width: 4),
                    Text("${widget.post.likeCount} Comments",
                        style: TextStyle(
                            color: (hintColor == Colors.black)
                                ? Colors.white
                                : Colors.black)),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {
                    // Implement share functionality here
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Function to show the image in a dialog
  void _showImageDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop(); // Close the dialog when tapped
            },
            child: Image.network(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  // Function to show multiple images in a dialog with spacing and larger size
  void _showMultiImageDialog(BuildContext context, List<String> imagePaths) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor:
              Colors.transparent, // Set the dialog background to transparent
          child: CarouselSlider(
            options: CarouselOptions(
              enableInfiniteScroll: false,
              initialPage: 0,
              enlargeCenterPage: false,
              viewportFraction: 0.8,
            ),
            items: imagePaths.map((imagePath) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the dialog when tapped
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0), // Add horizontal spacing
                      child: Image.network(
                        imagePath,
                        fit:
                            BoxFit.contain, // Show the image at its entire size
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
