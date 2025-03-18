// lib/character_component.dart
import 'package:flutter/material.dart';

class NexkyCharacter extends StatelessWidget {
  final String characterImage;

  const NexkyCharacter({super.key, required this.characterImage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(characterImage),
    );
  }
}