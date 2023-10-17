import 'package:bconnect/models/user.dart';
import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key, required this.user}) : super(key: key);
  final ChatUser user;

  @override
  // ignore: library_private_types_in_public_api
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  final List<String> messages = []; // Store chat messages
  final TextEditingController messageController = TextEditingController();

  void _sendMessage() {
    setState(() {
      final message = messageController.text;
      if (message.isNotEmpty) {
        messages.add(message);
        messageController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Color primaryColor = theme.primaryColor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Row(
          children: [
            CircleAvatar(
              // User's avatar
              backgroundImage: NetworkImage(
                  widget.user.avatarUrl), // Use the user's avatar URL
            ),
            const SizedBox(width: 8.0), // Add spacing between avatar and name
            Text(widget.user.name), // User's name
          ],
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'archive',
                child: Text('Archive'),
              ),
              const PopupMenuItem(
                value: 'delete',
                child: Text('Delete'),
              ),
            ],
            onSelected: (value) {
              // Handle archive or delete action here
              if (value == 'archive') {
                // Implement archive functionality
              } else if (value == 'delete') {
                // Implement delete functionality
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(messages[index]),
                );
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    ThemeData theme = Theme.of(context);
    Color primaryColor = theme.primaryColor;
    Color hintColor = theme.hintColor;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor:
                    (hintColor == Colors.black) ? Colors.grey : hintColor,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.white),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }
}
