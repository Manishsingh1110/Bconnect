import 'package:bconnect/components/socialmediapostcard.dart';
import 'package:bconnect/state/state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Consumer<PostListModel>(
          builder: (context, postListModel, child) {
            final posts = postListModel.posts;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return SocialMediaPostCard(post: post);
              },
            );
          },
        ),
      ),
    );
  }
}
