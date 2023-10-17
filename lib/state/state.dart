import 'dart:convert';

import 'package:bconnect/models/group.dart';
import 'package:bconnect/models/postcard.dart';
import 'package:bconnect/models/user.dart';
import 'package:bconnect/state/darktheme.dart';
import 'package:bconnect/state/lighttheme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _useManualTheme = false;
  final ThemeData _lightTheme = lightTheme;
  final ThemeData _darkTheme = darkTheme;

  ThemeData get theme => _useManualTheme ? _darkTheme : _lightTheme;

  bool get useManualTheme => _useManualTheme;

  void toggleTheme() {
    _useManualTheme = !_useManualTheme;
    notifyListeners();
  }
}

class PostListModel extends ChangeNotifier {
  List<Post> posts = [];

  PostListModel() {
    posts = [
      Post(
        userName: 'Priyo Vommb',
        userImage: "assets/images/cool-profile-picture-natural-light.webp",
        timeAgo: '2 hours ago',
        likeCount: 45,
        commentCount: 12,
        postText:
            'This is a sample social media post text with a single image. You can replace it with your own content.',
        postImages: ['assets/images/image_2.jpg'],
      ),
      Post(
        userName: 'Priyo Vommb',
        userImage: "assets/images/cool-profile-picture-natural-light.webp",
        timeAgo: '2 hours ago',
        likeCount: 45,
        commentCount: 12,
        postText:
            'This is another sample social media post text with multiple images. You can replace it with your own content.This is another sample social media post text with multiple images. You can replace it with your own content.This is another sample social media post text with multiple images. You can replace it with your own content.This is another sample social media post text with multiple images. You can replace it with your own content.',
        postImages: [
          'assets/images/image_2.jpg',
          'assets/images/image_2.jpg',
          'assets/images/image_2.jpg',
        ],
      ),
      Post(
        userName: 'Priyo Vommb',
        userImage: "assets/images/cool-profile-picture-natural-light.webp",
        timeAgo: '2 hours ago',
        likeCount: 45,
        commentCount: 12,
        postText:
            'This is another sample social media post text with multiple images. You can replace it with your own content.',
        postImages: [
          'assets/images/image_2.jpg',
          'assets/images/image_2.jpg',
        ],
      ),
      Post(
        userName: 'Priyo Vommb',
        userImage: "assets/images/cool-profile-picture-natural-light.webp",
        timeAgo: '2 hours ago',
        likeCount: 45,
        commentCount: 12,
        postText:
            'This is another sample social media post text with multiple images. You can replace it with your own content.',
        postImages: [
          'assets/images/image_2.jpg',
          'assets/images/image_2.jpg',
          'assets/images/image_2.jpg',
          'assets/images/image_2.jpg',
        ],
      ),
      Post(
        userName: 'Priyo Vommb',
        userImage: "assets/images/cool-profile-picture-natural-light.webp",
        timeAgo: '2 hours ago',
        likeCount: 45,
        commentCount: 12,
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
      Post(
        userName: 'Priyo Vommb',
        userImage: "assets/images/cool-profile-picture-natural-light.webp",
        timeAgo: '2 hours ago',
        likeCount: 45,
        commentCount: 12,
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
    ];
  }

  void addPost(Post newPost) {
    posts.add(newPost);
    notifyListeners(); // Notify listeners when the data changes
  }

  factory PostListModel.nullable() => PostListModel();
}

class GroupListModel extends ChangeNotifier {
  List<Group> groups = [];
  GroupListModel() {
    groups = [
      Group(
        name: 'Group 1',
        description: 'Description for Group 1',
        imageUrl: 'assets/images/group.jpg',
        numberOfPeople: 10,
        createdAt: DateTime(2023, 9, 1),
      ),
      Group(
        name: 'Group 2',
        description: 'Description for Group 2',
        imageUrl: 'assets/images/group.jpg',
        numberOfPeople: 5,
        createdAt: DateTime(2023, 8, 15),
      ),
    ];
  }

  void addGroup(Group group) {
    groups.add(group);
    notifyListeners();
  }
}

class ChatUserModel extends ChangeNotifier {
  List<ChatUser> chatusers = [];

  ChatUserModel() {
    chatusers = [
      ChatUser(
        id: '1',
        name: 'John',
        avatarUrl:
            'https://st3.depositphotos.com/15648834/17930/v/450/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg',
        lastMessage: 'Hello, how are you?',
        lastMessageDate: DateTime.now().subtract(const Duration(days: 1)),
      ),
      ChatUser(
        id: '2',
        name: 'Alice',
        avatarUrl:
            'https://st3.depositphotos.com/15648834/17930/v/450/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg',
        lastMessage: 'Good morning!',
        lastMessageDate: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      ChatUser(
        id: '3',
        name: 'Bob',
        avatarUrl:
            'https://st3.depositphotos.com/15648834/17930/v/450/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg',
        lastMessage: 'Hi there!',
        lastMessageDate: DateTime.now().subtract(const Duration(minutes: 30)),
      ),
      ChatUser(
        id: '4',
        name: 'Eva',
        avatarUrl:
            'https://st3.depositphotos.com/15648834/17930/v/450/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg',
        lastMessage: 'How`s it going?',
        lastMessageDate: DateTime.now().subtract(const Duration(minutes: 10)),
      ),
      ChatUser(
        id: '5',
        name: 'Grace',
        avatarUrl:
            'https://st3.depositphotos.com/15648834/17930/v/450/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg',
        lastMessage: 'See you later!',
        lastMessageDate: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
    ];
  }

  void setUser(ChatUser user) {
    chatusers.add(user);
    notifyListeners();
  }
}

class Userlogin extends ChangeNotifier {
  // Method to retrieve user data from shared preferences
  Future<Map<String, dynamic>?> retrieveUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('user');

    if (userJson != null) {
      return jsonDecode(userJson);
    } else {
      return null; // Handle the case where the data is not found
    }
  }
}
