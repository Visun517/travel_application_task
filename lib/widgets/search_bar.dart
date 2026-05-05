import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_application/providers/attraction_places_provider.dart';
import 'package:travel_application/services/travel_service.dart';

class HomeScreenSearchBar extends ConsumerStatefulWidget {
  const HomeScreenSearchBar({super.key});

  @override
  ConsumerState<HomeScreenSearchBar> createState() =>
      _HomeScreenSearchBarState();
}

class _HomeScreenSearchBarState extends ConsumerState<HomeScreenSearchBar> {
  final TextEditingController _searchController = TextEditingController();

  void _performSearch() async {
    String searchText = _searchController.text.trim();

    if (searchText.isEmpty) {
      fetchStoredAttractions(ref);
      return;
    }

    ref.read(attractionsProvider.notifier).updateAttractions([]);

    final results = await getAttractionsFromSupabase(query: searchText);
    print('Results fetched: ${results.length}');

    ref.read(attractionsProvider.notifier).updateAttractions(results);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: TextField(
          controller: _searchController,
          onSubmitted: (_) => _performSearch(),
          decoration: InputDecoration(
            hintText: "Find your next adventure",
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
            prefixIcon: const Icon(Icons.search, color: Colors.black54),
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black54,
                size: 20,
              ),
              onPressed: () {
                _performSearch();
              },
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ),
    );
  }
}
