import 'package:flutter/material.dart';

class MyBackButton extends StatelessWidget {
  final Widget? targetScreen; 

  const MyBackButton({super.key, this.targetScreen});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey[200],
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black87, size: 22),
            onPressed: () {
              if (targetScreen != null) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => targetScreen!),
                );
              } else {
                Navigator.pop(context);
              }
            },
          ),
        ),
      ),
    );
  }
}