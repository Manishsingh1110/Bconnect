import 'package:flutter/material.dart';

class NotificationItem {
  final String text;
  final DateTime sentTime;
  final String imageUrl;

  NotificationItem(this.text, this.sentTime, this.imageUrl);
}

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  // Simulated list of notification items
  List<NotificationItem> notifications = [
    NotificationItem('You have a new message', DateTime.now().subtract(const Duration(minutes: 2)), 'https://example.com/image1.jpg'),
    NotificationItem('You have a new follower', DateTime.now().subtract(const Duration(hours: 1)), 'https://example.com/image2.jpg'),
    NotificationItem('Your post was liked', DateTime.now().subtract(const Duration(hours: 2)), 'https://example.com/image3.jpg'),
    // Add more notification items here
  ];

  // Function to calculate the time elapsed since the sent time
  String calculateTimeElapsed(DateTime sentTime) {
    final currentTime = DateTime.now();
    final difference = currentTime.difference(sentTime);

    if (difference.inDays > 0) {
      final days = difference.inDays;
      return '$days ${days == 1 ? 'day' : 'days'} ago';
    } else if (difference.inHours > 0) {
      final hours = difference.inHours;
      return '$hours ${hours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inMinutes > 0) {
      final minutes = difference.inMinutes;
      return '$minutes ${minutes == 1 ? 'minute' : 'minutes'} ago';
    } else {
      return 'Just now';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          final timeElapsed = calculateTimeElapsed(notification.sentTime);

          return NotificationCard(
            notification: notification,
            timeElapsed: timeElapsed,
          );
        },
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final NotificationItem notification;
  final String timeElapsed;

  NotificationCard({required this.notification, required this.timeElapsed});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 6.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(notification.imageUrl),
          radius: 25.0,
        ),
        title: Text(
          notification.text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(timeElapsed),
        trailing: PopupMenuButton<String>(
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'delete',
              child: Text('Delete'),
            ),
            const PopupMenuItem(
              value: 'archive',
              child: Text('Archive'),
            ),
            // Add more options here
          ],
          onSelected: (value) {
            // Handle the selected option (e.g., delete, archive)
            if (value == 'delete') {
              // Delete the notification
              // Add your delete logic here
            } else if (value == 'archive') {
              // Archive the notification
              // Add your archive logic here
            }
          },
        ),
      ),
    );
  }
}
