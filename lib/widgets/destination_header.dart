import 'package:flutter/material.dart';
import '../models/place_model.dart';

class DestinationHeader extends StatelessWidget {
  final Place place;
  const DestinationHeader({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          place.image,
          width: double.infinity,
          height: 400,
          fit: BoxFit.cover,
        ),

        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.3),
                  Colors.transparent,
                  Colors.transparent,
                ],
                stops: const [0.0, 0.2, 1.0],
              ),
            ),
          ),
        ),

        Positioned(
          top:10,
          left: 20,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ],
    );
  }
}
