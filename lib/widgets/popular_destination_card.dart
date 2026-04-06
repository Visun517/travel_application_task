import 'package:flutter/material.dart';
import 'package:travel_application/models/place_model.dart';

class PopularDestinationCard extends StatelessWidget {
  final Place place;
  const PopularDestinationCard({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              place.image,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Destination Name
                Text(
                  place.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 5),

                // 2. Location with Icon
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 18,
                      color: Colors.blueGrey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      place.location,
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // 3. Rating with Star
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 20),
                    const SizedBox(width: 4),
                    Text(
                      "${place.rating}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
