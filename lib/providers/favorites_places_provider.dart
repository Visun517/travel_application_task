import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_application/services/favorites_service.dart';
import '../models/attraction_place.dart';

class FavoritesNotifier extends StateNotifier<List<AttractionModel>> {
  FavoritesNotifier() : super([]);

  Future<void> loadFavorites() async {
    final favorites = await getAllFavorites();
    state = favorites;
  }

  Future<void> toggleFavorite(AttractionModel attraction) async {
    final isExist = state.any((item) => item.id == attraction.id);

    if (isExist) {
      // Remove logic
      await removeFavorite(attraction.id.toString());
      state = state.where((item) => item.id != attraction.id).toList();
    } else {
      // Add logic
      await addFavorite(attraction.id.toString());
      state = [...state, attraction];
    }
  }

  bool isFavorite(String id) {
    return state.any((item) => item.id.toString() == id);
  }
}

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<AttractionModel>>((ref) {
  return FavoritesNotifier();
});
