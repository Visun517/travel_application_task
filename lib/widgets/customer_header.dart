import 'package:flutter/material.dart';
import 'package:travel_application/Components/back_button.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final String description;
  final double textSize;
  final Widget? targetScreen; 

  const CustomHeader({
    super.key,
    required this.title,
    required this.description,
    this.textSize = 50.0,
    this.targetScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyBackButton(targetScreen: targetScreen),

        const SizedBox(height: 20),

        Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: textSize,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),

        const SizedBox(height: 10),

        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
