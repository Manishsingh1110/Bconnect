// ignore_for_file: sized_box_for_whitespace

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
    Size size = MediaQuery.of(context).size;
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
        body: Column(children: [
          // ignore: avoid_unnecessary_containers
          Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                "assets/images/image_2.jpg",
                width: size.width,
                height: size.height * 0.17,
                fit: BoxFit.cover,
              )
            ],
          ),
          Stack(clipBehavior: Clip.none, children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.white,
                Colors.white60,
              ])),
              child: Stack(
                children: [
                  const Positioned(top: 20, right: 30, child: Text("Hello")),
                  Positioned(
                      top: 64,
                      left: 30,
                      child: Container(
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
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "The debugEmulateFlutterTesterEnvironment getter is deprecated and will be removed in a future release. Please usedebug Emulate Flutter Tester Environment` from `dart:ui_web` instead.",
                                    softWrap: true,
                                  ))
                            ],
                          ))),
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
                    )
                  ],
                )),
          ]),
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.white,
              Colors.white60,
            ])),
            child: const Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    // add the widgets here
                    Align(alignment: Alignment.topLeft, child: Text("About Us"))
                  ],
                )),
          ),
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.white,
              Colors.white60,
            ])),
            child: const Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    // add the widgets here
                    Align(alignment: Alignment.topLeft, child: Text("Activity"))
                  ],
                )),
          ),
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.white,
              Colors.white60,
            ])),
            child: const Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    // add the widgets here
                    Align(alignment: Alignment.topLeft, child: Text("Followers"))
                  ],
                )),
          ),
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.white,
              Colors.white60,
            ])),
            child: const Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    // add the widgets here
                    Align(alignment: Alignment.topLeft, child: Text("Recommended!!"))
                  ],
                )),
          )
        ]));
  }
}
