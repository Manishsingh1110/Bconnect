class Group {
  final String name;
  final String id;
  final String description;
  final String imageUrl;
  final String? backgroundimageUrl;
  final String? location;
  final int numberOfPeople;
  final String createdAt;
  final List<dynamic>? industriesproduct;

  Group({
    this.industriesproduct,
    required this.name,
    required this.id,
    this.backgroundimageUrl,
    this.location,
    required this.description,
    required this.imageUrl,
    required this.numberOfPeople,
    required this.createdAt,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
        id: json['_id'],
        industriesproduct: json['industriesproduct'],
        name: json['name'],
        backgroundimageUrl: json['backgroundimageUrl'],
        location: json['location'],
        description: json['description'],
        imageUrl: json['imageUrl'],
        createdAt: json['createdAt'],
        numberOfPeople: json['members'].length ?? 0);
  }
}
