import 'package:flutter/material.dart';
import 'package:travel_application/models/attraction_place.dart';
import '../widgets/destination_header.dart'; 
import '../widgets/destination_details_body.dart'; 

class DestinationDetailsScreen extends StatelessWidget {
  final AttractionModel attractionModel;
  const DestinationDetailsScreen({super.key, required this.attractionModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DestinationHeader(attraction: attractionModel), 
              DestinationDetailsBody(attraction: attractionModel), 
            ],
          ),
        ),
      ),
    );
  }
}