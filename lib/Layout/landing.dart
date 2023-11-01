import 'package:bconnect/components/constrant.dart';
import 'package:bconnect/pages/Bottom_Navigation_pages/addpost_page.dart';
import 'package:bconnect/pages/Side_Navigation_pages/chat_page.dart';
import 'package:bconnect/pages/Side_Navigation_pages/group_page.dart';
import 'package:bconnect/pages/Bottom_Navigation_pages/home_page.dart';
import 'package:bconnect/pages/user_Authentication_pages/login_page.dart';
import 'package:bconnect/pages/Bottom_Navigation_pages/notification_page.dart';
import 'package:bconnect/pages/Side_Navigation_pages/profile_page.dart';
import 'package:bconnect/pages/Bottom_Navigation_pages/resources_page.dart';
import 'package:bconnect/pages/Bottom_Navigation_pages/search_page.dart';
import 'package:bconnect/pages/Side_Navigation_pages/setting_page.dart';
import 'package:bconnect/state/state.dart';
import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int currentPageIndex = 0;
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

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Color primaryColor = theme.primaryColor;
    return Scaffold(
      drawer: NavDrawer(
        userName: storedUser?['username'] ?? 'No name available',
        userAvatarUrl: storedUser?['avatar'] ?? '/',
      ),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("B-Connect"),
        actions: [
          IconButton(
            icon: const Icon(Icons.chat),
            tooltip: 'Open Chat',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserListPage()));
            },
          ),
        ],
      ),
      body: <Widget>[
        Container(alignment: Alignment.center, child: const Home()),
        Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: const Search(),
        ),
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Addpost(),
        ),
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Notifications(),
        ),
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Resources(),
        ),
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          if (index == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Addpost()));
          } else {
            setState(() {
              currentPageIndex = index;
            });
          }
        },
        backgroundColor: primaryColor,
        indicatorColor: selectednav,
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.home,
                color: primaryColor,
              ),
            ),
            icon: const Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.search_off,
                color: primaryColor,
              ),
            ),
            icon: const Icon(Icons.search_off_outlined, color: Colors.white),
            label: 'Search',
          ),
          NavigationDestination(
            selectedIcon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.post_add,
                color: primaryColor,
              ),
            ),
            icon: const Icon(Icons.post_add_outlined, color: Colors.white),
            label: 'Add Post',
          ),
          NavigationDestination(
            selectedIcon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.notification_add,
                color: primaryColor,
              ),
            ),
            icon: const Icon(Icons.notification_add_outlined,
                color: Colors.white),
            label: 'Notification',
          ),
          NavigationDestination(
            selectedIcon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.factory,
                color: primaryColor,
              ),
            ),
            icon: const Icon(Icons.factory_outlined, color: Colors.white),
            label: 'Resources',
          ),
        ],
      ),
    );
  }
}

class NavDrawer extends StatelessWidget {
  final String userName;
  final String userAvatarUrl;
  
  const NavDrawer(
      {Key? key, required this.userName, required this.userAvatarUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(userAvatarUrl);
    ThemeData theme = Theme.of(context);
    Color primaryColor = theme.primaryColor;
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            color: primaryColor, // Set the desired header color here
            child: GestureDetector(
              onTap: () {
                // Navigate to the desired screen when the Drawer Header is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const Profile()), // Replace 'Profile' with the screen you want to navigate to
                );
              },
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: primaryColor, // You can remove this line now
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    CircleAvatar(
                      radius: 35, // Reduce the size of the avatar
                      backgroundImage: NetworkImage(
                          userAvatarUrl), // Use NetworkImage for online image
                    ),
                    const SizedBox(width: 15),
                    Text(
                      userName,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16), // Reduce the size of the name
                    ),
                    const SizedBox(
                        height:
                            15), // Add spacing between name and "View Profile"
                    const Text(
                      'View Profile',
                      style: TextStyle(
                        // Customize the color as desired
                        color: Colors.white60,
                        fontSize: 14, // Adjust the size of "View Profile" text
                        decoration: TextDecoration.underline, // Add underline
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.verified_user),
                  title: const Text('Profile'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Profile()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Setting()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.group),
                  title: const Text('Group'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GroupPage()));
                  },
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Login()));
            },
          ),
        ],
      ),
    );
  }
}
