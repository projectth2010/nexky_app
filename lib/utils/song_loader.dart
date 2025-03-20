// lib/utils/song_loader.dart
import 'dart:convert';
import 'package:flutter/services.dart';

class SongLoader {
  // static Future<List<Map<String, dynamic>>> loadSongs() async {
  //   final String jsonString = await rootBundle.loadString('assets/songs.json');
  //   final List<dynamic> jsonData = json.decode(jsonString);
  //   return jsonData.cast<Map<String, dynamic>>();
  // }

   static Future<List<Map<String, dynamic>>> loadSongs() async {
    // Simulate loading songs from a data source
    await Future.delayed(Duration(seconds: 1)); // Simulate delay
    return [
      {
        "name": "Sleep",
        "files": ["Moonlit Waves", "Dreamy Night"],
      },
      {
        "name": "Focus",
        "files": ["Flowing Mindstream", "Echoes of the Forest"],
      },
      {
        "name": "Wellness",
        "files": ["Healing Earth", "Relaxing Breeze"],
      },
      {
        "name": "Chill",
        "files": ["Twilight Harmony", "Ocean Serenity"],
      },
    ];
  }
}