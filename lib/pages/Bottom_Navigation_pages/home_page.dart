import 'package:bconnect/components/socialmediapostcard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bconnect/state/state.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    // Initialize the data fetching when the widget is initialized
    if (Provider.of<PostNotifier>(context, listen: false).postData.isEmpty) {
      Provider.of<PostNotifier>(context, listen: false).initData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PostNotifier>(
        builder: (context, postNotifier, _) {
          if (postNotifier.postData.isEmpty) {
            return Container(
              color: Colors.black
                  .withOpacity(0.1), // Adjust opacity for blur effect
              child: Center(
                  child: Center(
                      child: Lottie.asset(
                'assets/images/lottie3.json', // replace 'assets/loading_animation.json' with the path to your Lottie animation file
                width: 400,
                height: 300,
                fit: BoxFit.fill,
              ))),
            );
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                // Call initData to fetch data when the user pulls to refresh
                await postNotifier.initData();
              },
              child: ListView.builder(
                itemCount: postNotifier.postData.length,
                itemBuilder: (context, index) {
                  final post = postNotifier.postData[index];
                  return SocialMediaPostCard(post: post);
                },
              ),
            );
          }
        },
      ),
    );
  }
}
