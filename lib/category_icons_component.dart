// lib/category_icons_component.dart
import 'package:flutter/material.dart';

class CategoryIconsComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: Icon(Icons.bed),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.person),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.favorite),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.local_drink),
          onPressed: () {},
        ),
      ],
    );
  }
}