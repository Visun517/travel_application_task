import 'package:flutter/material.dart';
import 'package:travel_application/models/favorite_places.dart';
import 'package:travel_application/widgets/popular_destination_card.dart';

class FavoritesDestinationsScreen extends StatelessWidget {
  const FavoritesDestinationsScreen({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Favorites")),
      body: favoritePlaces.isEmpty
    ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 1. ලස්සන අයිකනයක් (විශාල ප්‍රමාණයෙන්)
            Icon(
              Icons.favorite_outline_rounded,
              size: 100,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 20),
            // 2. ප්‍රධාන පණිවිඩය
            const Text(
              "No Favorites Yet",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 10),
            // 3. පරිශීලකයා දිරිමත් කරන පොඩි විස්තරයක්
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Explore destinations and mark your favorite places to see them here.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      )
    : ListView.builder(
        itemCount: favoritePlaces.length,
        itemBuilder: (context, index) {
          return PopularDestinationCard(place: favoritePlaces[index]);
        },
      ),
    );
  }
}
