// lib/search_bar_component.dart
import 'package:flutter/material.dart';

class SearchBarComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'what do you want to listen to?',
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}