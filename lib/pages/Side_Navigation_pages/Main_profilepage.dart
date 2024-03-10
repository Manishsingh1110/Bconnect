// ignore_for_file: avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers, file_names

import 'package:bconnect/components/ByProductCard.dart';
import 'package:flutter/material.dart';
import 'package:bconnect/components/socialmediapostcard.dart';
import 'package:bconnect/components/rawmaterial.dart';
import 'package:bconnect/state/state.dart';
import 'package:provider/provider.dart';
import 'package:bconnect/pages/user_Authentication_pages/login_page.dart';

class CompanyPage extends StatefulWidget {
  final String companyId;

  const CompanyPage({Key? key, required this.companyId}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  Map<String, dynamic>? storedUser;
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

  @override
  void initState() {
    super.initState();
    _fetchUserData();

    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final List<dynamic> pages = storedUser?['Page'] ?? [];
    final String userAvatarUrl =
        pages.isNotEmpty ? (pages[0]['avatar'] ?? '/') : '/';
    final String userCoverPhotoUrl =
        pages.isNotEmpty ? (pages[0]['coverPhoto'] ?? '/') : '/';

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Company Page'),
      ),
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                  child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Image.network(
                              userCoverPhotoUrl,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child; // Return the image once it's loaded
                                } else {
                                  // While the image is loading, return a placeholder or a loader
                                  return const Center(
                                    child:
                                        CircularProgressIndicator(), // Replace this with your loader widget
                                  ); // Replace this with your loader widget
                                }
                              },
                              width: size.width,
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            SizedBox(
                              width: double.infinity,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 40),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                              storedUser?['description'] ??
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
                        const SizedBox(height: 16.0),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TabBar(
                          controller: _tabController,
                          tabs: const [
                            Tab(
                              child: Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Center(
                                  child: Text(
                                    'Posts',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                            Tab(
                              child: Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Center(
                                  child: Text(
                                    'Raw Materials',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                            Tab(
                              child: Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Center(
                                  child: Text(
                                    'By Products',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                          ],
                          indicatorColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              _buildPosts(),
              _buildRawMaterials(),
              _buildByProducts(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPosts() {
    void _applyFilter(String filterOption) {
      // Implement your filter logic here based on the selected option
      // This is a placeholder, replace it with your actual filter logic
    }

    void _applySort(String sortOption) {
      // Implement your sorting logic here based on the selected option
      // This is a placeholder, replace it with your actual sorting logic
    }
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: Row(children: [
                    // Filter Options
                    Padding(
                      padding: const EdgeInsets.all(16.0), // Add padding here
                      child: PopupMenuButton<String>(
                        icon: const Icon(Icons.filter_list),
                        onSelected: _applyFilter,
                        itemBuilder: (BuildContext context) => [
                          const PopupMenuItem<String>(
                            value: 'filter1',
                            child: Text('Filter 1'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'filter2',
                            child: Text('Filter 2'),
                          ),
                          // Add more filter options as needed
                        ],
                      ),
                    ),

                    // Sort Options
                    Padding(
                      padding: const EdgeInsets.all(16.0), // Add padding here
                      child: PopupMenuButton<String>(
                        icon: const Icon(Icons.sort),
                        onSelected: _applySort,
                        itemBuilder: (BuildContext context) => [
                          const PopupMenuItem<String>(
                            value: 'sort1',
                            child: Text('Sort 1'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'sort2',
                            child: Text('Sort 2'),
                          ),
                          // Add more sort options as needed
                        ],
                      ),
                    ),
                  ])),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      // Handle add icon click
                      // Implement your logic here
                    },
                  ),
                ],
              ),
            ),
            Consumer<PostListModel>(
              builder: (context, postListModel, child) {
                final posts = postListModel.posts;
                final itemCount = posts.length;

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: itemCount,
                        itemBuilder: (context, index) {
                          final post = posts[index];
                          return Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8.0), // Add padding here
                            child: SocialMediaPostCard(post: post),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRawMaterials() {
    final List<dynamic> pages = storedUser?['Page'] ?? [];

    // Use only the first page if available, otherwise use an empty map
    final Map<String, dynamic> pageData = pages.isNotEmpty ? pages[0] : {};

    final List<dynamic> rawMaterials = pageData['rawMaterials'] ?? [];
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
          'supplier': storedUser?['companyname'] ?? 'No name available',
        };
      }).toList(),
      groupid: pageData["_id"], // Use the _id from the first page
    );
  }

  Widget _buildByProducts() {
    final List<dynamic> pages = storedUser?['Page'] ?? [];

    // Use only the first page if available, otherwise use an empty map
    final Map<String, dynamic> pageData = pages.isNotEmpty ? pages[0] : {};

    final List<dynamic> byProducts = pageData['byProducts'] ?? [];
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
          'supplier': storedUser?['companyname'] ?? 'No name available',
        };
      }).toList(),
      groupid: pageData["_id"], // Use the _id from the first page
    );
  }
}
