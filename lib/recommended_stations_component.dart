// lib/recommended_stations_component.dart
import 'package:flutter/material.dart';

class RecommendedStationsComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Station ${index + 1}'),
          trailing: Icon(Icons.more_vert),
        );
      },
    );
  }
}