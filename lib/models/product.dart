import 'dart:math';
import 'package:intl/intl.dart';

class Byproduct {
  final String name;
  final String image;
  final String description;
  final double price;
  final String supplier;
  final String userImage;
  final String timeAgo;
  Byproduct({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.supplier,
    required this.userImage,
    required this.timeAgo,
  });

  factory Byproduct.fromJson(Map<String, dynamic> json) {
    final random = Random();
    final int randomDays =
        random.nextInt(30); // Generate a random number of days (0 to 29)
    final DateTime createdAt = DateTime.now().subtract(Duration(
        days: randomDays)); // Subtract random number of days from current date
    final String formattedDate =
        DateFormat.yMMMMd().format(createdAt); // Format the date

    return Byproduct(
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] != null ? json['price'].toDouble() : 0.0,
      supplier: json['supplier']['name'] ?? '',
      timeAgo: formattedDate,
      userImage: json['supplier']['avatar'],
    );
  }
}
