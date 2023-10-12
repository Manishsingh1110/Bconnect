class Post {
  final String userName;
  final String userImage;
  final String postText;
  final List<String>? postImages;
  final String timeAgo;
  final int likeCount;
  final int commentCount;

  Post({
    required this.userName,
    required this.userImage,
    required this.postText,
    this.postImages,
    required this.timeAgo,
    required this.likeCount,
    required this.commentCount,
  });
}
