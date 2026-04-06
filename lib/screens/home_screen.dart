  import 'package:flutter/material.dart';
  import 'package:travel_application/models/place_model.dart';
import 'package:travel_application/widgets/custom_bottom_navigation_bar.dart';
  import 'package:travel_application/widgets/home_screen_top_banner.dart';
  import 'package:travel_application/widgets/popular_destination_card.dart';

  class HomeScreen extends StatelessWidget {
    const HomeScreen({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeScreenTopBanner(),
                Padding(
                  padding: const EdgeInsets.only(top: 30 , left: 20 , bottom: 10),
                  child: const Text(
                    "Popular Destinations",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true, 
                  physics:
                      const NeverScrollableScrollPhysics(), 
                  itemCount: popularPlaces.length,
                  itemBuilder: (context, index) {
                    return PopularDestinationCard(place: popularPlaces[index]);
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavBar(),
      );
    }
  }
