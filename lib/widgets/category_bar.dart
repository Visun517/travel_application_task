import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_application/providers/attraction_places_provider.dart';
import 'package:travel_application/services/travel_service.dart';

class HomeScreenCategories extends ConsumerWidget {
  const HomeScreenCategories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> categories = [
      "Best by Season",
      "Weekend Getaways",
      "South",
      "Mountains",
      "Beaches"
    ];

    final selectedCategory = ref.watch(selectedCategoryProvider);

    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemBuilder: (context, index) {
          final isSelected = selectedCategory == categories[index];

          return GestureDetector(

            onTap: () async {
             updateCategory(ref, categories[index]);
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: isSelected ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? Colors.black : Colors.grey[300]!,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
