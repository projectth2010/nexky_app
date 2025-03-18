// lib/utils/song_loader.dart
import 'dart:convert';
import 'package:flutter/services.dart';

class SongLoader {
  static Future<List<Map<String, dynamic>>> loadSongs() async {
    final String jsonString = await rootBundle.loadString('assets/songs.json');
    final List<dynamic> jsonData = json.decode(jsonString);
    return jsonData.cast<Map<String, dynamic>>();
  }
}