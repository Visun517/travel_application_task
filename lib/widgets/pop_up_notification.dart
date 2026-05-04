import 'package:flutter/material.dart';

class TravelUtils {
  static void showWelcomeDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: const Text("Travel Tips 🌍", style: TextStyle(fontWeight: FontWeight.bold)),
          content: const Text(
            "Please search for the name of the country you wish to explore in the search bar. Once searched, you will be able to see all the popular attractions available in that country.",
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Got it!", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }
}