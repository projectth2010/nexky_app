// lib/bottom_navigation_bar_component.dart
import 'package:flutter/material.dart';

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
    return Container(
      decoration: BoxDecoration(
        color: Colors.pink, // พื้นหลังของ BottomNavigationBar
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 4, // เพิ่มเงาเล็กน้อย
        //     spreadRadius: 2,
        //   ),
        // ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent, // ทำให้พื้นหลังโปร่งใส เพื่อให้เห็นสีจาก Container ด้านนอก
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // แก้ไขปัญหาแสดงไอคอนไม่ครบถ้ามีมากกว่า 3 ไอคอน
        selectedFontSize: 0, // ซ่อนข้อความใต้ไอคอน
        unselectedFontSize: 0, // ซ่อนข้อความใต้ไอคอน
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0), // เพิ่มพื้นที่รอบไอคอน
              child: Image.asset(
                'assets/ic_calendar.png',
                width: 80, // ปรับขนาดไอคอนให้ใหญ่ขึ้น
                height: 80,
                color: _currentIndex == 0 ? Colors.white : Colors.grey, // เปลี่ยนสีเมื่อเลือก
              ),
            ),
            label: '', // ไม่มีข้อความใต้ไอคอน
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/ic_home.png',
                width: 80,
                height: 80,
                color: _currentIndex == 1 ? Colors.white : Colors.grey,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/ic_moon_star.png',
                width: 80,
                height: 80,
                color: _currentIndex == 2 ? Colors.white : Colors.grey,
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}