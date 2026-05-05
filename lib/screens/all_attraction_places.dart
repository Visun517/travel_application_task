import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_application/providers/attraction_places_provider.dart';
import 'package:travel_application/widgets/popular_destination_card.dart';

class AllAttractionsScreen extends ConsumerWidget {
  const AllAttractionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allAttractions = ref.watch(attractionsProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Explore Destinations",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: allAttractions.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: allAttractions.length,
                itemBuilder: (context, index) {
                  return ProviderScope(
                    overrides: [
                      currentAttractionProvider
                          .overrideWithValue(allAttractions[index]),
                    ],
                    child: const PopularDestinationCard(),
                  );
                },
              ),
            ),
    );
  }
}
