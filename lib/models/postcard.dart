import 'dart:math';
import 'package:intl/intl.dart';

class Post {
  final String userName;
  final String userImage;
  final String postText;
  final List<String>? postImages;
  final String? timeAgo;
  final int likeCount;
  final int? commentCount;
  final String? id;

  Post({
    required this.userName,
    required this.userImage,
    required this.postText,
    this.postImages,
    this.id,
    this.timeAgo,
    required this.likeCount,
    this.commentCount,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    final random = Random();
    final int randomDays =
        random.nextInt(30); // Generate a random number of days (0 to 29)
    final DateTime createdAt = DateTime.now().subtract(Duration(
        days: randomDays)); // Subtract random number of days from current date
    final String formattedDate = DateFormat.yMMMMd().format(createdAt);
    return Post(
      id: json['_id'],
      postText: json['postText'],
      postImages: json['postImages'] != null
          ? List<String>.from(json['postImages'])
          : null,
      likeCount: json['likeCount'],
      userName: json['author']['username'],
      userImage: json['author']['avatar'],
      timeAgo:
          formattedDate, // You might need to parse this date into a human-readable format
      commentCount:
          json['comment']?.length ?? 0, // Assuming comment is an array
    );
  }
}
