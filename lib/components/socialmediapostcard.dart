// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:ui';
import 'package:bconnect/models/postcard.dart';

class SocialMediaPostCard extends StatefulWidget {
  final Post post;

  const SocialMediaPostCard({super.key, required this.post});

  @override
  // ignore: library_private_types_in_public_api
  _SocialMediaPostCard createState() => _SocialMediaPostCard();
}

class _SocialMediaPostCard extends State<SocialMediaPostCard> {
  @override
  Widget build(BuildContext context) {
    Widget postContent;
    bool isLiked = false;

    if (widget.post.postImages != null && widget.post.postImages!.isNotEmpty) {
      if (widget.post.postImages!.length == 1) {
        postContent = Hero(
          tag: widget.post.postImages![0], // Unique tag for the image
          child: GestureDetector(
            onTap: () {
              _showImageDialog(context, widget.post.postImages![0]);
            },
            child: Image.network(
              widget.post.postImages![0],
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        );
      } else if (widget.post.postImages!.length == 2) {
        postContent = Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Hero(
                tag: widget
                    .post.postImages![0], // Unique tag for the first image
                child: GestureDetector(
                  onTap: () {
                    _showImageDialog(context, widget.post.postImages![0]);
                  },
                  child: Image.network(
                    widget.post.postImages![0],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8.0), // Add spacing between images
            Expanded(
              flex: 1,
              child: Hero(
                tag: widget
                    .post.postImages![1], // Unique tag for the second image
                child: GestureDetector(
                  onTap: () {
                    _showImageDialog(context, widget.post.postImages![1]);
                  },
                  child: Image.network(
                    widget.post.postImages![1],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        );
      } else if (widget.post.postImages!.length == 3) {
        postContent = Column(
          children: <Widget>[
            Hero(
              tag: widget.post.postImages![0], // Unique tag for the first image
              child: GestureDetector(
                onTap: () {
                  _showImageDialog(context, widget.post.postImages![0]);
                },
                child: Image.network(
                  widget.post.postImages![0],
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
                    tag: widget
                        .post.postImages![1], // Unique tag for the second image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, widget.post.postImages![1]);
                      },
                      child: Image.network(
                        widget.post.postImages![1],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0), // Add spacing between images
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: widget
                        .post.postImages![2], // Unique tag for the third image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, widget.post.postImages![2]);
                      },
                      child: Image.network(
                        widget.post.postImages![2],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      } else if (widget.post.postImages!.length == 4) {
        postContent = Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: widget
                        .post.postImages![0], // Unique tag for the first image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, widget.post.postImages![0]);
                      },
                      child: Image.network(
                        widget.post.postImages![0],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0), // Add spacing between images
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: widget
                        .post.postImages![1], // Unique tag for the second image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, widget.post.postImages![1]);
                      },
                      child: Image.network(
                        widget.post.postImages![1],
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
                    tag: widget
                        .post.postImages![2], // Unique tag for the third image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, widget.post.postImages![2]);
                      },
                      child: Image.network(
                        widget.post.postImages![2],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0), // Add spacing between images
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: widget
                        .post.postImages![3], // Unique tag for the fourth image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, widget.post.postImages![3]);
                      },
                      child: Image.network(
                        widget.post.postImages![3],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      } else if (widget.post.postImages!.length == 5) {
        postContent = Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: widget
                        .post.postImages![0], // Unique tag for the first image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, widget.post.postImages![0]);
                      },
                      child: Image.network(
                        widget.post.postImages![0],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0), // Add spacing between images
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: widget
                        .post.postImages![1], // Unique tag for the second image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, widget.post.postImages![1]);
                      },
                      child: Image.network(
                        widget.post.postImages![1],
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
                    tag: widget
                        .post.postImages![2], // Unique tag for the third image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, widget.post.postImages![2]);
                      },
                      child: Image.network(
                        widget.post.postImages![2],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0), // Add spacing between images
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: widget
                        .post.postImages![3], // Unique tag for the fourth image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, widget.post.postImages![3]);
                      },
                      child: Image.network(
                        widget.post.postImages![3],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0), // Add spacing between images
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: widget
                        .post.postImages![4], // Unique tag for the fourth image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, widget.post.postImages![4]);
                      },
                      child: Image.network(
                        widget.post.postImages![4],
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
        List<Widget> imageWidgets = widget.post.postImages!.map((imagePath) {
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
                    tag: widget
                        .post.postImages![0], // Unique tag for the first image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, widget.post.postImages![0]);
                      },
                      child: Image.network(
                        widget.post.postImages![0],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0), // Add spacing between images
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: widget
                        .post.postImages![1], // Unique tag for the second image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, widget.post.postImages![1]);
                      },
                      child: Image.network(
                        widget.post.postImages![1],
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
                    tag: widget
                        .post.postImages![2], // Unique tag for the third image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, widget.post.postImages![2]);
                      },
                      child: Image.network(
                        widget.post.postImages![2],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0), // Add spacing between images
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: widget
                        .post.postImages![3], // Unique tag for the fourth image
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, widget.post.postImages![3]);
                      },
                      child: Image.network(
                        widget.post.postImages![3],
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
                        imageFilter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                        child: Image.network(
                          widget.post.postImages![
                              4], // Use an image as a background for the text
                          fit: BoxFit.cover,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _showMultiImageDialog(
                              context, widget.post.postImages!);
                          // Add your custom function here
                        },
                        child: const Text(
                          'Show More',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
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
    ThemeData theme = Theme.of(context);
    Color hintColor = theme.hintColor;

    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundImage: widget.post.userImage != null
                    ? NetworkImage(widget.post.userImage) as ImageProvider
                    : const AssetImage('fallback_image_path'),
              ),
              title: Text(widget.post.userName),
              subtitle: Text(widget.post.timeAgo ?? 'Unknown Time'),
              trailing: PopupMenuButton<String>(
                onSelected: (value) {
                  // Handle menu item selection here
                  if (value == 'edit') {
                    // Handle edit action
                  } else if (value == 'delete') {
                    // Handle delete action
                  }
                },
                itemBuilder: (BuildContext context) {
                  return <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'edit',
                      child: Text('Save'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'delete',
                      child: Text('Not Interested'),
                    ),
                  ];
                },
              ),
            ),
            const Divider(
              height: 1,
              color: Colors.grey,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Text(
                widget.post.postText,
                style: const TextStyle(fontSize: 16.0),
                // Show ellipsis for overflowed text
              ),
            ),
            postContent,
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.thumb_up),
                      onPressed: () {
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "${widget.post.likeCount} Likes",
                      style: TextStyle(
                          color: (hintColor == Colors.black)
                              ? Colors.white
                              : Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.comment),
                      onPressed: () {
                        // Implement comment functionality here
                      },
                    ),
                    const SizedBox(width: 4),
                    Text("${widget.post.likeCount} Comments",
                        style: TextStyle(
                            color: (hintColor == Colors.black)
                                ? Colors.white
                                : Colors.black)),
                  ],
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
            child: Image.network(
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
          backgroundColor:
              Colors.transparent, // Set the dialog background to transparent
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
                      Navigator.of(context)
                          .pop(); // Close the dialog when tapped
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0), // Add horizontal spacing
                      child: Image.network(
                        imagePath,
                        fit:
                            BoxFit.contain, // Show the image at its entire size
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
