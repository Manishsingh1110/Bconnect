import 'package:bconnect/components/constrant.dart';
import 'package:bconnect/pages/Side_Navigation_pages/setting_page.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    // double profile= size.height*0.1;
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
      body:Stack(
clipBehavior: Clip.none,
        children: [
        Image.network("https://cdn.wallpapersafari.com/8/94/KFJ2EB.jpg",
        width:double.infinity,
        height:220,
        ),
        const Positioned(
          top: 150,
          left: 30,
          child:CircleAvatar(
          radius:60,
          backgroundImage: NetworkImage("https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
        ),
         )
        )
      ]),
    );
  }
}
