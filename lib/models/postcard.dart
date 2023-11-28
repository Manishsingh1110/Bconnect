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
    return Post(
      id: json['_id'],
      postText: json['postText'],
      postImages: json['postImages'] != null
          ? List<String>.from(json['postImages'])
          : null,
      likeCount: json['likeCount'],
      userName: json['author']['username'],
      userImage: json['author']['avatar'],
      timeAgo: json[
          'createdAt'], // You might need to parse this date into a human-readable format
      commentCount:
          json['comment']?.length ?? 0, // Assuming comment is an array
    );
  }
}
