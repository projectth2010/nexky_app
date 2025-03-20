// lib/music_player_page.dart
import 'package:flutter/material.dart';

class MusicPlayerPage extends StatefulWidget {
  final String songTitle;
  final String songUrl;

  const MusicPlayerPage({super.key, required this.songTitle, required this.songUrl});

  @override
  _MusicPlayerPageState createState() => _MusicPlayerPageState();
}

class _MusicPlayerPageState extends State<MusicPlayerPage> {
  bool isPlaying = false; // Simulate playback state

  void _togglePlayback() {
    setState(() {
      isPlaying = !isPlaying; // Toggle between play and pause
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.songTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
              iconSize: 64,
              onPressed: _togglePlayback, // Simulate playback toggle
            ),
            SizedBox(height: 16),
            Text(
              isPlaying ? 'Now Playing' : 'Paused',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}