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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello'),
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
                                                  style: TextStyle(
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
    final rawMaterials = [
      {
        'name': 'Iron Ore',
        'description': 'High-quality iron ore suitable for steel production.',
        'image':
            'https://worldsteel.org/wp-content/uploads/iStock-545354738-690x360.jpg',
        'price': 35.50,
        'supplier': 'Ore Mining Company A',
      },
      {
        'name': 'Copper Ingot',
        'description': 'Pure copper ingots for electrical applications.',
        'image':
            'https://worldsteel.org/wp-content/uploads/iStock-545354738-690x360.jpg',
        'price': 42.75,
        'supplier': 'Metal Works Inc.',
      },
      {
        'name': 'Lumber',
        'description': 'Quality lumber sourced from sustainable forests.',
        'image':
            'https://worldsteel.org/wp-content/uploads/iStock-545354738-690x360.jpg',
        'price': 20.00,
        'supplier': 'Green Woods Co.',
      },
      {
        'name': 'Aluminum Sheet',
        'description': 'Lightweight aluminum sheets for construction.',
        'image':
            'https://worldsteel.org/wp-content/uploads/iStock-545354738-690x360.jpg',
        'price': 30.80,
        'supplier': 'Aluminum Industries Ltd.',
      },
      {
        'name': 'Plastic Pellets',
        'description':
            'Recycled plastic pellets for various manufacturing purposes.',
        'image':
            'https://worldsteel.org/wp-content/uploads/iStock-545354738-690x360.jpg',
        'price': 15.25,
        'supplier': 'Eco Plastics Corp.',
      },
      {
        'name': 'Steel Beam',
        'description':
            'Durable steel beams for structural engineering projects.',
        'image':
            'https://worldsteel.org/wp-content/uploads/iStock-545354738-690x360.jpg',
        'price': 55.00,
        'supplier': 'Steel Dynamics Co.',
      },
      {
        'name': 'Rubber Sheet',
        'description':
            'Flexible rubber sheets used in automotive applications.',
        'image':
            'https://worldsteel.org/wp-content/uploads/iStock-545354738-690x360.jpg',
        'price': 12.50,
        'supplier': 'RubberTech Inc.',
      },
      {
        'name': 'Glass Panel',
        'description': 'Clear glass panels for architectural design.',
        'image':
            'https://worldsteel.org/wp-content/uploads/iStock-545354738-690x360.jpg',
        'price': 18.90,
        'supplier': 'Crystal Glassworks Ltd.',
      },
      {
        'name': 'Cement Bag',
        'description': 'High-quality cement bags for construction projects.',
        'image':
            'https://worldsteel.org/wp-content/uploads/iStock-545354738-690x360.jpg',
        'price': 25.50,
        'supplier': 'Builders Supply Co.',
      },
      {
        'name': 'Circuit Board',
        'description': 'Advanced circuit boards for electronic devices.',
        'image':
            'https://worldsteel.org/wp-content/uploads/iStock-545354738-690x360.jpg',
        'price': 40.00,
        'supplier': 'Tech Components Ltd.',
      },
    ];

    return RawMaterialsList(rawMaterials: rawMaterials);
  }

  Widget _buildByProducts() {
    final byProducts = [
      {
        'name': 'Product 1',
        'description': 'Description 1',
        'image':
            'https://worldsteel.org/wp-content/uploads/iStock-545354738-690x360.jpg',
        'price': 25.50,
        'supplier': 'Supplier A'
      },
      {
        'name': 'Product 2',
        'description': 'Description 2',
        'image':
            'https://worldsteel.org/wp-content/uploads/iStock-545354738-690x360.jpg',
        'price': 35.75,
        'supplier': 'Supplier B'
      },
      // Add more by-products as needed
    ];

    return ByProductsList(byProducts: byProducts);
  }
}
