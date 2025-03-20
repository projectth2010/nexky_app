// lib/music_listing_page.dart
import 'package:flutter/material.dart';
import 'package:nexky_app/music_player_page.dart';
import 'utils/song_loader.dart';

class MusicListingPage extends StatefulWidget {
  const MusicListingPage({super.key});

  @override
  _MusicListingPageState createState() => _MusicListingPageState();
}

class _MusicListingPageState extends State<MusicListingPage> {
  List<Map<String, dynamic>> _categories = [];
  List<String> _currentSongs = [];
  String _selectedCategory = '';

  @override
  void initState() {
    super.initState();
    _loadCategoriesAndSongs();
  }

  Future<void> _loadCategoriesAndSongs() async {
    final categories = await SongLoader.loadSongs();
    setState(() {
      _categories = categories;
      if (_categories.isNotEmpty) {
        _selectedCategory = _categories.first['name'];
        _currentSongs = List<String>.from(_categories.first['files']);
      }
    });
  }

  void _selectCategory(String categoryName) {
    final selectedCategory = _categories.firstWhere(
      (category) => category['name'] == categoryName,
    );
    setState(() {
      _selectedCategory = categoryName;
      _currentSongs = List<String>.from(selectedCategory['files']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Listing'),
      ),
      body: Column(
        children: [
          // Categories Section
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                final isSelected = category['name'] == _selectedCategory;
                return GestureDetector(
                  onTap: () => _selectCategory(category['name']),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          category['name'],
                          style: TextStyle(
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            color: isSelected ? Colors.blue : Colors.black,
                          ),
                        ),
                        if (isSelected)
                          Container(
                            margin: EdgeInsets.only(top: 4),
                            width: 20,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Songs Section
          Expanded(
            child: ListView.builder(
              itemCount: _currentSongs.length,
              itemBuilder: (context, index) {
                final song = _currentSongs[index];
                return ListTile(
                  title: Text(song),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MusicPlayerPage(
                          songTitle: song,
                          songUrl: 'assets/${song.toLowerCase().replaceAll(' ', '_')}.mp3', // Adjust path as needed
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}