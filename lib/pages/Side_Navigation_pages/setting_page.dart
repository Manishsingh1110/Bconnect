import 'package:bconnect/components/constrant.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
 bool notificationsEnabled = true;
  bool darkModeEnabled = false;
  String selectedLanguage = 'English';

  List<String> languages = ['English', 'Spanish', 'French', 'German'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:navbar,
      ),
      body:  ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          ListTile(
            title: const Text('Notifications'),
            trailing: Switch(
              value: notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  notificationsEnabled = value;
                });
                // Handle notification settings change
              },
            ),
          ),
          ListTile(
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: darkModeEnabled,
              onChanged: (bool value) {
                setState(() {
                  darkModeEnabled = value;
                });
                // Handle dark mode settings change
              },
            ),
          ),
          ListTile(
            title: const Text('Language'),
            trailing: DropdownButton<String>(
              value: selectedLanguage,
              onChanged: (String? value) {
                setState(() {
                  selectedLanguage = value!;
                });
                // Handle language change
              },
              items: languages.map((String language) {
                return DropdownMenuItem<String>(
                  value: language,
                  child: Text(language),
                );
              }).toList(),
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Privacy Policy'),
            onTap: () {
              // Navigate to the privacy policy page
            },
          ),
          ListTile(
            title: const Text('Terms of Service'),
            onTap: () {
              // Navigate to the terms of service page
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Log Out'),
            onTap: () {
              // Handle log out action
            },
          ),
        ],
      ),
    );
  }
    
  }
