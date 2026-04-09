import 'package:flutter/material.dart';
import 'package:travel_application/models/place_model.dart';
import 'package:travel_application/widgets/home_screen_top_banner.dart';
import 'package:travel_application/widgets/popular_destination_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: HomeScreenTopBanner()),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0), // Padding එක දාන්න
                child: const Text(
                  "Popular Destinations",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return PopularDestinationCard(place: popularPlaces[index]);
              }, childCount: popularPlaces.length),
            ),
          ],
        ),
      ),
    );
  }
}
