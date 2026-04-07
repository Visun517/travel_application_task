import 'package:flutter/material.dart';

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
        _buildStatItem("Trips", trips.toString()), 
        _buildStatItem("Favorites", favorites.toString()),
        _buildStatItem("Reviews", reviews.toString()),
      ],
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}