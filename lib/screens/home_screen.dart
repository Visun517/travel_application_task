import 'package:flutter/material.dart';
import 'package:travel_application/models/place_model.dart';
import 'package:travel_application/widgets/category_bar.dart';
import 'package:travel_application/widgets/home_screen_top_banner.dart';
import 'package:travel_application/widgets/popular_destination_card.dart';
import 'package:travel_application/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: HomeScreenHeader()),
            SliverToBoxAdapter(child: const HomeScreenSearchBar()),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverToBoxAdapter(child: const HomeScreenCategories()),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: const [
                    Text(
                      "Popular Destinations",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "See all",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 470, 
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: popularPlaces.length,
                  itemBuilder: (context, index) {
                    return PopularDestinationCard(place: popularPlaces[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
