// lib/main.dart
import 'package:flutter/material.dart';
import 'package:nexky_app/charactor_component.dart';
import 'package:nexky_app/custom_app_bar.dart';
import 'package:nexky_app/music_listing_page.dart';
import 'background_component.dart';
import 'dialogue_box_component.dart';
import 'bottom_navigation_bar_component.dart';
import 'search_bar_component.dart';
import 'category_icons_component.dart';
import 'recommended_stations_component.dart';
import 'player_controls_component.dart';
import 'timer_component.dart';
import 'media_list_page.dart';
import 'calendar_page.dart';
import 'music_listing_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    CalendarPage(),
    MusicListingPage(), // Music Listing Page
    Container(), // Placeholder for Sleep page
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onHandymanPressed: () {},
        onMusicNotePressed: () {},
      ),
      body: Stack(
        children: [
          CustomBackground(),
          NexkyCharacter(characterImage: 'assets/nexky.png'),
          DialogueBox(text: 'สวัสดี! วันนี้เป็นอย่างไรบ้าง?'),
          Positioned(
            bottom: 20,
            left: 20,
            child: TimerComponent(),
          ),
          _pages[_currentIndex],
        ],
      ),
      bottomNavigationBar: BottomNavigationBarComponent(onTabTapped: _onTabTapped),
    );
  }
}