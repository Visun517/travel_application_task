import 'package:flutter/material.dart';

class AuthFooter extends StatelessWidget {
  final String leadingText;
  final String actionText;  
  final Widget targetScreen; 

  const AuthFooter({
    super.key,
    required this.leadingText,
    required this.actionText,
    required this.targetScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          leadingText,
          style: const TextStyle(color: Colors.black54),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => targetScreen),
            );
          },
          child: Text(
            actionText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}