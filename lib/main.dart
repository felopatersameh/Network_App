import 'package:flutter/material.dart';
import 'package:network_app/screen/news_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Network App',
      home: NewsScreen(),
    );
  }
}
