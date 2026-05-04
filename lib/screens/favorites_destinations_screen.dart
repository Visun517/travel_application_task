import 'package:flutter/material.dart';
import 'package:travel_application/models/favorite_places.dart';
import 'package:travel_application/widgets/empty_favorites_view.dart';
import 'package:travel_application/widgets/popular_destination_card.dart';

class FavoritesDestinationsScreen extends StatelessWidget {
  const FavoritesDestinationsScreen({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Favorites")),
      body: favoritePlaces.isEmpty
    ? const EmptyFavoritesView()
    : ListView.builder(
        itemCount: favoritePlaces.length,
        itemBuilder: (context, index) {
          return const PopularDestinationCard();
        },
      ),
    );
  }
}
