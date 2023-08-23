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
import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        backgroundColor: navbar,
        title: const Text("B-Connect"),
        actions: [
          IconButton(
            icon: const Icon(Icons.chat),
            tooltip: 'Open Chat',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Chats()));
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
          setState(() {
            currentPageIndex = index;
          });
        },
        backgroundColor: navbar,
        indicatorColor: selectednav,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            
            selectedIcon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.home,
                color: Colors.purple,
              ),
            ),
            icon: Icon(
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
                color: Colors.purple,
              ),
            ),
            icon: Icon(Icons.search_off_outlined,color: Colors.white),
            label: 'Search',
          ),
          NavigationDestination(
            selectedIcon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.post_add,
                color: Colors.purple,
              ),
            ),
            icon: Icon(Icons.post_add_outlined,color: Colors.white),
            label: 'Add Post',
          ),
          NavigationDestination(
            selectedIcon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.notification_add,
                color: Colors.purple,
              ),
            ),
            icon: Icon(Icons.notification_add_outlined,color: Colors.white),
            label: 'Notification',
          ),
          NavigationDestination(
            selectedIcon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.factory,
                color: Colors.purple,
              ),
            ),
            icon: Icon(Icons.factory_outlined,color: Colors.white),
            label: 'Resources',
          ),
        ],
      ),
    );
  }
}

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: navbar,
            ),
            child: Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('Profile'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Profile()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Setting()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.group),
            title: const Text('Group'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Group()));
            },
          ),
          SizedBox(
            height: size.height * 0.448,
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
