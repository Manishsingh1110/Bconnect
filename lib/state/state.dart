import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bconnect/models/group.dart';
import 'package:bconnect/models/postcard.dart';
import 'package:bconnect/models/user.dart';
import 'package:bconnect/state/darktheme.dart';
import 'package:bconnect/state/lighttheme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PostNotifier extends ChangeNotifier {
  List<Post> _postData = [];
  List<Post> get postData => _postData;

  Future<void> fetchData() async {
    final Uri apiUrl =
        Uri.parse('https://bconnect-backend-main.onrender.com/app/getpost');

    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      final List<Post> postList =
          responseData.map((data) => Post.fromJson(data)).toList();
      setPostData(postList);
    } else {
      throw Exception('Failed to load data');
    }
  }

  // This method can be called to initialize the data fetching
  Future<void> initData() async {
    await fetchData();
  }

  // Add this method to set the data and notify listeners
  void setPostData(List<Post> newData) {
    _postData = newData;
    notifyListeners();
  }
}

class PostListModel with ChangeNotifier {
  List<Post> posts = [];

  PostListModel() {
    posts;
  }
  void fetchPostsFromApi() async {
    final response = await http.get(
        Uri.parse('https://bconnect-backend-main.onrender.com/app/getpost'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      posts = responseData
          .map((data) => Post.fromJson(data as Map<String, dynamic>))
          .toList();
      notifyListeners(); // Notify listeners when the data changes
    } else {
      throw Exception('Failed to load data');
    }
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
    final storedCustomerData = prefs.getString('customerData');
    if (storedCustomerData != null) {
      return jsonDecode(storedCustomerData);
    } else {
      return null; // Handle the case where the data is not found
    }
  }

  Future<String?> retrieveJwt() async {
    final prefs = await SharedPreferences.getInstance();
    final storedJwtToken = prefs.getString('jwtToken');
    return storedJwtToken;
  }
}

Widget customLoadingIndicator() {
  return const Center(
    child: SpinKitFadingCircle(
      color: Colors.blue, // Customize the color to match your design
      size: 50.0, // Customize the size
    ),
  );
}

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
