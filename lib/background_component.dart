// lib/background_component.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final hour = now.hour;

    String imagePath;
    if (hour >= 5 && hour < 12) {
      imagePath = 'assets/morning_background.png'; // เช้า
    } else if (hour >= 12 && hour < 18) {
      imagePath = 'assets/afternoon_background.png'; // บ่าย
    } else if (hour >= 18 && hour < 22) {
      imagePath = 'assets/evening_background.png'; // เย็น
    } else {
      imagePath = 'assets/night_background.png'; // กลางคืน
    }

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}