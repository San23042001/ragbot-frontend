import 'package:flutter/material.dart';
import 'package:ragbot/presentation/screens/chat_screen.dart';
import 'package:ui/ui.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RagBot',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const ChatScreen(),
    );
  }
}
