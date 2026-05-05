import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_application/Components/back_button.dart';
import 'package:travel_application/providers/attraction_places_provider.dart';
import 'package:travel_application/providers/favorites_places_provider.dart' show favoritesProvider;
import 'package:travel_application/screens/home_screen.dart';
import 'package:travel_application/screens/main_screen.dart';
import 'package:travel_application/widgets/empty_favorites_view.dart';
import 'package:travel_application/widgets/popular_destination_card.dart';

class FavoritesDestinationsScreen extends ConsumerWidget {
  const FavoritesDestinationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteList = ref.watch(favoritesProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "My Favorites",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,

        leading: const MyBackButton( targetScreen: MainScreen()),
      ),
      body: favoriteList.isEmpty
          ? const EmptyFavoritesView()
          : ListView.builder(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              itemCount: favoriteList.length,
              itemBuilder: (context, index) {
                final attraction = favoriteList[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: SizedBox(
                    height: 250,
                    child: ProviderScope(
                      overrides: [
                        currentAttractionProvider.overrideWithValue(attraction),
                      ],
                      child: const PopularDestinationCard(),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
