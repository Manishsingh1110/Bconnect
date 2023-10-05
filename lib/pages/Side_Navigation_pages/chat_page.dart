import 'package:bconnect/components/chats.dart';
import 'package:bconnect/components/constrant.dart';
import 'package:bconnect/models/user.dart';
import 'package:flutter/material.dart';

class ChatManager {
  List<User> users = [
    User(
      id: '1',
      name: 'John',
      avatarUrl:
          'https://st3.depositphotos.com/15648834/17930/v/450/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg',
      lastMessage: 'Hello, how are you?',
      lastMessageDate: DateTime.now().subtract(const Duration(days: 1)),
    ),
    User(
      id: '2',
      name: 'Alice',
      avatarUrl:
          'https://st3.depositphotos.com/15648834/17930/v/450/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg',
      lastMessage: 'Good morning!',
      lastMessageDate: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    User(
      id: '3',
      name: 'Bob',
      avatarUrl:
          'https://st3.depositphotos.com/15648834/17930/v/450/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg',
      lastMessage: 'Hi there!',
      lastMessageDate: DateTime.now().subtract(const Duration(minutes: 30)),
    ),
    User(
      id: '4',
      name: 'Eva',
      avatarUrl:
          'https://st3.depositphotos.com/15648834/17930/v/450/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg',
      lastMessage: 'How`s it going?',
      lastMessageDate: DateTime.now().subtract(const Duration(minutes: 10)),
    ),
    User(
      id: '5',
      name: 'Grace',
      avatarUrl:
          'https://st3.depositphotos.com/15648834/17930/v/450/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg',
      lastMessage: 'See you later!',
      lastMessageDate: DateTime.now().subtract(const Duration(minutes: 5)),
    ),
  ];

  // You can maintain a list of messages for each user here

  static final ChatManager _singleton = ChatManager._internal();

  factory ChatManager() {
    return _singleton;
  }

  ChatManager._internal();
}

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  final ChatManager chatManager = ChatManager(); // Get the chat manager

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navbar,
        title: const Text('Chats'),
      ),
      body: ListView.builder(
        itemCount: chatManager.users.length,
        itemBuilder: (context, index) {
          final user = chatManager.users[index];
          return CustomListTile(user: user);
        },
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final User user;

  const CustomListTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Chats(user: user),
          ),
        );
      },
      child: ListTile(
        leading: CircleAvatar(
          // Add user's avatar here
          backgroundColor: navbar, // Customize the background color
          child: Text(
            user.name[0].toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(user.name),
        subtitle:
            const Text('Last message goes here'), // Replace with last message
        trailing: const Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Replace with the date of the last message
            Text('Today'), // Replace with last message
          ],
        ),
      ),
    );
  }
}
