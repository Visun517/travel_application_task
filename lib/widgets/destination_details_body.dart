import 'package:flutter/material.dart';
import '../models/place_model.dart';

class DestinationDetailsBody extends StatelessWidget {
  final Place place;

  const DestinationDetailsBody({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Title
          Text(
            place.name,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),

          // Location
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.blueGrey, size: 20),
              const SizedBox(width: 5),
              Text(
                place.location,
                style: const TextStyle(fontSize: 18, color: Colors.blueGrey),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Rating section
          Row(
            children: [
              ...List.generate(5, (index) {
                return Icon(
                  index < place.rating.floor() ? Icons.star : Icons.star_border,
                  color: Colors.orange,
                  size: 24,
                );
              }),
              const SizedBox(width: 10),
              Text(
                "${place.rating}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // About section
          const Text(
            "About",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          Text(
            place.about,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
