// lib/app_bar_component.dart
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onHandymanPressed;
  final VoidCallback onMusicNotePressed;

  const CustomAppBar({super.key, required this.onHandymanPressed, required this.onMusicNotePressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.pink,
      leading: IconButton(
        icon: Icon(Icons.handyman),
        onPressed: onHandymanPressed,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text('2',style: TextStyle(fontFamily: 'ChulaCharasNew'),),
              SizedBox(width: 10),

              SizedBox(
                width: 250, // Set a specific width for the progress indicator
                child: LinearProgressIndicator(
                  value: 0.3,
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),

              SizedBox(width: 10),
              // Replace IconButton with InkWell and Image
              InkWell(
                onTap: onMusicNotePressed, // Handle tap event
                child: Image.asset(
                  'assets/ic_melody.png', 
                  width: 24, // Adjust size as needed
                  height: 24,
                ),
              ),
            ],
          ),
          
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}