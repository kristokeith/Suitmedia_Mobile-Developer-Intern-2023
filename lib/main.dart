import 'package:flutter/material.dart';
import 'package:mobiledevintern2023_1/screens/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobile Developer Intern 2023',
      home: const first_screen(),
    );
  }
}