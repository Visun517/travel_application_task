import 'package:flutter/material.dart';
import '../models/place_model.dart';
import '../widgets/destination_header.dart'; 
import '../widgets/destination_details_body.dart'; 

class DestinationDetailsScreen extends StatelessWidget {
  final Place place;
  const DestinationDetailsScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DestinationHeader(place: place), 
              DestinationDetailsBody(place: place), 
            ],
          ),
        ),
      ),
    );
  }
}