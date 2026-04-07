import 'package:flutter/material.dart';

class FavoritesDestinationsScreen extends StatelessWidget {
  const FavoritesDestinationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Favorites Destinations Screen',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
