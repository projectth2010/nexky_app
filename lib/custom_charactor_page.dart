// lib/custom_character_page.dart
import 'package:flutter/material.dart';

class CustomCharacterPage extends StatelessWidget {
  const CustomCharacterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Character'),
      ),
      body: Center(
        child: Text('This is the Custom Character Page'),
      ),
    );
  }
}