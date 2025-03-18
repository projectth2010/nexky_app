// lib/media_list_page.dart
import 'package:flutter/material.dart';

class MediaListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Media List'),
      ),
      body: Center(
        child: Text('This is the Media List Page'),
      ),
    );
  }
}