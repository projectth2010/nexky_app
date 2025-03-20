// lib/bottom_navigation_bar_component.dart
import 'package:flutter/material.dart';
import 'calendar_page.dart';

class BottomNavigationBarComponent extends StatefulWidget {
  final Function(int) onTabTapped;

  BottomNavigationBarComponent({required this.onTabTapped});

  @override
  _BottomNavigationBarComponentState createState() => _BottomNavigationBarComponentState();
}

class _BottomNavigationBarComponentState extends State<BottomNavigationBarComponent> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    widget.onTabTapped(index);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onItemTapped,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset(
                  'assets/ic_calendar.png', 
                  width: 44, // Adjust size as needed
                  height: 44,
                ),
          label: '',
        ),
         BottomNavigationBarItem(
          icon: Image.asset(
                  'assets/ic_home.png', 
                  width: 44, // Adjust size as needed
                  height: 44,
                ),
          label: '',
        ),
         BottomNavigationBarItem(
          icon: Image.asset(
                  'assets/ic_moon_star.png', 
                  width: 44, // Adjust size as needed
                  height: 44,
                ),
          label: '',
        ),
      ],
    );
  }
}