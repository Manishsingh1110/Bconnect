import 'package:bconnect/components/socialmediapostcard.dart';
import 'package:bconnect/models/postcard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bconnect/state/state.dart';

class Home extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    // Ensure that PostNotifier provides a List<Post>
    List<Post> postData =
        Provider.of<PostNotifier>(context, listen: false).postData;
    Provider.of<PostNotifier>(context, listen: false).initData();

    return Scaffold(
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
