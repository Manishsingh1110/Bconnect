import 'package:bconnect/components/addnewgroup.dart';
import 'package:bconnect/components/constrant.dart';
import 'package:flutter/material.dart';

class Group {
  final String name;
  final String description;
  final String imageUrl;
  final int numberOfPeople;
  final DateTime createdAt;

  Group({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.numberOfPeople,
    required this.createdAt,
  });
}

class GroupPage extends StatefulWidget {
  const GroupPage({super.key});

  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  List<Group> groups = [
    Group(
      name: 'Group 1',
      description: 'Description for Group 1',
      imageUrl: 'assets/group1.png',
      numberOfPeople: 10,
      createdAt: DateTime(2023, 9, 1),
    ),
    Group(
      name: 'Group 2',
      description: 'Description for Group 2',
      imageUrl: 'assets/group2.png',
      numberOfPeople: 5,
      createdAt: DateTime(2023, 8, 15),
    ),
    // Add more groups here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navbar,
        title: const Text('Groups'),
      ),
      body: ListView.builder(
        itemCount: groups.length,
        itemBuilder: (BuildContext context, int index) {
          final group = groups[index];
          return buildGroupCard(group);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kButtonColor,
        onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>const CreateGroupScreen()),
    );
  },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildGroupCard(Group group) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(group.imageUrl),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    group.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    group.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(Icons.people),
                      const SizedBox(width: 8),
                      Text('${group.numberOfPeople} members'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        child: Row(
                        children:[
                      const Icon(Icons.date_range),
                      const SizedBox(width: 8),
                      Text(group.createdAt.toString()),
                      
                      ])
                  )],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

