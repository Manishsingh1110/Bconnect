import 'package:bconnect/components/splashscreen.dart';
import 'package:bconnect/state/state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'Layout/landing.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => PostListModel()),
      ChangeNotifierProvider(create: (context) => GroupListModel()),
      ChangeNotifierProvider(create: (context) => ChatUserModel()),
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'B-Connect',
      theme: themeProvider.theme,
      home: const SplashScreen(),
    );
  }
}
