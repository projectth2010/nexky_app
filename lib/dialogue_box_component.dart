// lib/dialogue_box_component.dart
import 'package:flutter/material.dart';

class DialogueBox extends StatelessWidget {
  final String text;

  const DialogueBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100,
      left: 50,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text, style: TextStyle(fontSize: 16,fontFamily: 'ChulaCharasNew')),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('ต่อไป >'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}