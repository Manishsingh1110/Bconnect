import 'package:flutter/material.dart';
import 'package:bconnect/state/state.dart';
import 'package:provider/provider.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool systemModeEnabled = true; // System mode switch
  bool manualModeEnabled = false; // Manual mode switch
  String selectedLanguage = 'English';

  List<String> languages = ['English', 'Spanish', 'French', 'German'];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    ThemeData theme = Theme.of(context);
    Color primaryColor = theme.primaryColor;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          ListTile(
            title: const Text('System Mode'),
            trailing: Switch(
              value: themeProvider.useManualTheme,
              onChanged: (bool value) {
                setState(() {
                  themeProvider.toggleTheme();
                });
              },
            ),
          ),

          // ListTile(
          //   title: const Text('Manual Mode'),
          //   trailing: IgnorePointer(
          //     ignoring: !themeProvider.useManualTheme,
          //     child: Switch(
          //       value: themeProvider.useManualTheme,
          //       onChanged: (bool value) {
          //         setState(() {
          //           themeProvider.toggleManualTheme(value);
          //           systemModeEnabled = !value;
          //         });
          //       },
          //     ),
          //   ),
          // ),

          ListTile(
            title: const Text('Language'),
            trailing: DropdownButton<String>(
              value: selectedLanguage,
              onChanged: (String? value) {
                setState(() {
                  selectedLanguage = value!;
                });
                // Handle language change, e.g., using SharedPreferences.
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
