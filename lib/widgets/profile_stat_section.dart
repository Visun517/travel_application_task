import 'package:flutter/material.dart';
import 'package:travel_application/widgets/stat_item.dart';

class ProfileStatSection extends StatelessWidget {
  final int trips;
  final int favorites;
  final int reviews;

  const ProfileStatSection({
    super.key,
    required this.trips,     
    required this.favorites,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StatItem(label:"Trips", value: trips.toString()), 
        StatItem(label:"Favorites", value: favorites.toString()),
        StatItem(label:"Reviews", value: reviews.toString()),
      ],
    );
  }
}