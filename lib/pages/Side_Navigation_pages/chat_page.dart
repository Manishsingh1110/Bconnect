import 'package:bconnect/components/chats.dart';
import 'package:bconnect/models/user.dart'; // Assuming User is defined in a separate user.dart file
import 'package:bconnect/state/state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  Widget build(BuildContext context) {
    // Get the chat users from the ChatUserModel using Provider
    final chatUserModel = Provider.of<ChatUserModel>(context);
    ThemeData theme = Theme.of(context);
    Color primaryColor = theme.primaryColor;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Chats'),
      ),
      body: ListView.builder(
        itemCount: chatUserModel.chatusers.length,
        itemBuilder: (context, index) {
          final user = chatUserModel.chatusers[index];
          return CustomListTile(user: user);
        },
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final ChatUser user;

  const CustomListTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Color primaryColor = theme.primaryColor;
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
          backgroundColor: primaryColor, // Customize the background color
          child: Text(
            user.name[0].toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(user.name),
        subtitle: Text(user.lastMessage), // Use the actual last message
        trailing: const Text("Today"), // Use the actual date
      ),
    );
  }
}
