import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:ui';
class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          children: const <Widget>[
            SocialMediaPostCard(
              userName: 'John Doe',
              timeAgo: '2 hours ago',
              postText:
                  'This is a sample social media post text with a single image. You can replace it with your own content.',
              postImages: ['assets/images/image_2.jpg'],
            ),
            SocialMediaPostCard(
              userName: 'Jane Smith',
              timeAgo: '1 hour ago',
              postText:
                  'This is another sample social media post text with multiple images. You can replace it with your own content.This is another sample social media post text with multiple images. You can replace it with your own content.This is another sample social media post text with multiple images. You can replace it with your own content.This is another sample social media post text with multiple images. You can replace it with your own content.',
              postImages: [
                'assets/images/image_2.jpg',
                'assets/images/image_2.jpg',
                'assets/images/image_2.jpg',
              ],
            ),
            SocialMediaPostCard(
              userName: 'Jane Smith',
              timeAgo: '1 hour ago',
              postText:
                  'This is another sample social media post text with multiple images. You can replace it with your own content.',
              postImages: [
                'assets/images/image_2.jpg',
                'assets/images/image_2.jpg',
              ],
            ),
            SocialMediaPostCard(
              userName: 'Jane Smith',
              timeAgo: '1 hour ago',
              postText:
                  'This is another sample social media post text with multiple images. You can replace it with your own content.',
              postImages: [
                'assets/images/image_2.jpg',
                'assets/images/image_2.jpg',
                'assets/images/image_2.jpg',
                'assets/images/image_2.jpg',
              ],
            ),
            SocialMediaPostCard(
              userName: 'Jane Smith',
              timeAgo: '1 hour ago',
              postText:
                  'This is another sample social media post text with multiple images. You can replace it with your own content.',
              postImages: [
                'assets/images/image_2.jpg',
                'assets/images/image_2.jpg',
                'assets/images/image_2.jpg',
                'assets/images/image_2.jpg',
                'assets/images/image_2.jpg',
              ],
            ),
            SocialMediaPostCard(
              userName: 'Jane Smith',
              timeAgo: '1 hour ago',
              postText:
                  'This is another sample social media post text with multiple images. You can replace it with your own content.',
              postImages: [
                'assets/images/image_2.jpg',
                'assets/images/image_2.jpg',
                'assets/images/image_2.jpg',
                'assets/images/image_2.jpg',
                'assets/images/image_2.jpg',
                'assets/images/image_2.jpg',
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SocialMediaPostCard extends StatelessWidget {
  final String userName;
  final String timeAgo;
  final String postText;
  final List<String>? postImages;

  const SocialMediaPostCard({
    super.key,
    required this.userName,
    required this.timeAgo,
    required this.postText,
    this.postImages,
  });

  @override
  Widget build(BuildContext context) {
    Widget postContent;

    if (postImages != null) {
      if (postImages!.length == 1) {
        postContent = Hero(
          tag: postImages![0], // Unique tag for the image
          child: GestureDetector(
            onTap: () {
              _showImageDialog(context, postImages![0]);
            },
            child: Image.asset(
              postImages![0],
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        );
      } else if (postImages!.length == 2) {
        postContent = Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Hero(
                tag: postImages![0], // Unique tag for the first image
                child: GestureDetector(
                  onTap: () {
                    _showImageDialog(context, postImages![0]);
                  },
                  child: Image.asset(
                    postImages![0],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8.0), // Add spacing between images
            Expanded(
              flex: 1,
              child: Hero(
                tag: postImages![1], // Unique tag for the second image
                child: GestureDetector(
                  onTap: () {
                    _showImageDialog(context, postImages![1]);
                  },
                  child: Image.asset(
                    postImages![1],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        );
      } else if (postImages!.length == 3) {
        postContent = Column(
          children: <Widget>[
            Hero(
              tag: postImages![0], // Unique tag for the first image
              child: GestureDetector(
                onTap: () {
                  _showImageDialog(context, postImages![0]);
                },
                child: Image.asset(
                  postImages![0],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 8.0), // Add spacing between images
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: postImages![1], // Unique tag for the second image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, postImages![1]);
                      },
                      child: Image.asset(
                        postImages![1],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0), // Add spacing between images
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: postImages![2], // Unique tag for the third image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, postImages![2]);
                      },
                      child: Image.asset(
                        postImages![2],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      } else if (postImages!.length == 4) {
        postContent = Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: postImages![0], // Unique tag for the first image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, postImages![0]);
                      },
                      child: Image.asset(
                        postImages![0],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0), // Add spacing between images
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: postImages![1], // Unique tag for the second image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, postImages![1]);
                      },
                      child: Image.asset(
                        postImages![1],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0), // Add spacing between rows
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: postImages![2], // Unique tag for the third image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, postImages![2]);
                      },
                      child: Image.asset(
                        postImages![2],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0), // Add spacing between images
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: postImages![3], // Unique tag for the fourth image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, postImages![3]);
                      },
                      child: Image.asset(
                        postImages![3],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      } else {
        // If there are more than 4 images, show a grid with "Show More" text
        // ignore: unused_local_variable
        List<Widget> imageWidgets = postImages!.map((imagePath) {
          return Image.asset(
            imagePath,
            fit: BoxFit.cover,
          );
        }).toList();
        postContent = Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: postImages![0], // Unique tag for the first image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, postImages![0]);
                      },
                      child: Image.asset(
                        postImages![0],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0), // Add spacing between images
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: postImages![1], // Unique tag for the second image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, postImages![1]);
                      },
                      child: Image.asset(
                        postImages![1],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0), // Add spacing between rows
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: postImages![2], // Unique tag for the third image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, postImages![2]);
                      },
                      child: Image.asset(
                        postImages![2],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0), // Add spacing between images
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: postImages![3], // Unique tag for the fourth image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, postImages![3]);
                      },
                      child: Image.asset(
                        postImages![3],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0), // Add spacing between images
                Expanded(
                  flex: 1,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: Image.asset(
                          postImages![4], // Use an image as a background for the text
                          fit: BoxFit.cover,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _showMultiImageDialog(context, postImages!);
                          // Add your custom function here
                        },
                        child: const Text(
                          'Show More',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      }
    } else {
      // Handle the case when there are no images
      postContent = const SizedBox.shrink();
    }

    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/image_2.jpg'),
              ),
              title: Text(userName),
              subtitle: Text(timeAgo),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                postText,
                style: const TextStyle(fontSize: 16.0),
                maxLines: 3, // Limit the number of lines displayed
                overflow: TextOverflow.ellipsis, // Show ellipsis for overflowed text
              ),
            ),
            postContent,
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.thumb_up),
                  onPressed: () {
                    // Implement like functionality here
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.comment),
                  onPressed: () {
                    // Implement comment functionality here
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {
                    // Implement share functionality here
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Function to show the image in a dialog
  void _showImageDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop(); // Close the dialog when tapped
            },
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  // Function to show multiple images in a dialog with spacing and larger size
  void _showMultiImageDialog(BuildContext context, List<String> imagePaths) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent, // Set the dialog background to transparent
          child: CarouselSlider(
            options: CarouselOptions(
              enableInfiniteScroll: false,
              initialPage: 0,
              enlargeCenterPage: false,
              viewportFraction: 0.8,
            ),
            items: imagePaths.map((imagePath) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(); // Close the dialog when tapped
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0), // Add horizontal spacing
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.contain, // Show the image at its entire size
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
