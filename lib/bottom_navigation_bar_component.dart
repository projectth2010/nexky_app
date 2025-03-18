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
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Calendar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.snooze),
          label: 'Sleep',
        ),
      ],
    );
  }
}