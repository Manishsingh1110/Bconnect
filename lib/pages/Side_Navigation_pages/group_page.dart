import 'package:bconnect/components/addnewgroup.dart';
import 'package:bconnect/models/group.dart';
import 'package:bconnect/state/state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroupPage extends StatefulWidget {
  const GroupPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  List<Group> groups = [];

  @override
  Widget build(BuildContext context) {
    Provider.of<GroupListModel>(context, listen: false).initData();
    ThemeData theme = Theme.of(context);
    Color primaryColor = theme.primaryColor;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Groups'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Consumer<GroupListModel>(
          // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
          builder: (context, GroupListModel, child) {
            final groups = GroupListModel.groups;
            return ListView.builder(
              itemCount: groups.length,
              itemBuilder: (context, index) {
                final group = groups[index];
                return buildGroupCard(group);
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateGroupScreen()),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
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
              backgroundImage: NetworkImage(group.imageUrl),
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
                      // ignore: avoid_unnecessary_containers
                      Container(
                          child: Row(children: [
                        const Icon(Icons.date_range),
                        const SizedBox(width: 8),
                        Text(group.createdAt.toString()),
                      ]))
                    ],
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
