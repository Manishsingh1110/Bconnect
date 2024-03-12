class Follower {
  final String name;
  final String profilePicture;
  final String description;
  final int totalFollowers;
  final Map<String, dynamic>? userData; // Make userData optional

  Follower({
    required this.name,
    required this.profilePicture,
    required this.description,
    required this.totalFollowers,
    this.userData, // Mark userData as optional
  });
}
