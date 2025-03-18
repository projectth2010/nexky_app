// lib/player_controls_component.dart
import 'package:flutter/material.dart';

class PlayerControlsComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: 0.5,
          onChanged: (_) {},
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.volume_off),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.skip_previous),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.play_arrow),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.skip_next),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}