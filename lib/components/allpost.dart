import 'package:bconnect/components/socialmediapostcard.dart';
import 'package:bconnect/models/postcard.dart';
import 'package:bconnect/state/state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllPostsPage extends StatelessWidget {
  const AllPostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Add code to retrieve and display all followers in a 1x1 grid layout
    // You can use a similar approach as in the Profile class to create the grid
    List<Post> postData =
        Provider.of<PostListModel>(context, listen: false).posts;
    Provider.of<PostListModel>(context, listen: false).initData();
    return Scaffold(
      appBar: AppBar(
        title: const Text("All POSTS"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Call initData to fetch data when the user pulls to refresh
          await Provider.of<PostNotifier>(context, listen: false).initData();
        },
        child: Center(
          child: postData.isEmpty
              ? const Text('No data available. Data is being fetched...')
              : ListView.builder(
                  itemCount: postData.length,
                  itemBuilder: (context, index) {
                    final post = postData[index];
                    // Make sure SocialMediaPostCard expects a Post
                    return SocialMediaPostCard(post: post);
                  },
                ),
        ),
      ),
    );
  }
}
