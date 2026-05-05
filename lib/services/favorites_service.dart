import 'package:travel_application/models/attraction_place.dart';
import 'package:travel_application/services/travel_service.dart';

Future<void> addFavorite(String attractionId) async {
  try {
    final user = supabase.auth.currentUser;
    if (user == null) return;

    await supabase.from('favorites').insert({
      'id': user.id,
      'attraction_id': attractionId,
    });

    print("Added to favorites!");
  } catch (e) {
    print("Add Favorite Error: $e");
  }
}

Future<void> removeFavorite(String attractionId) async {
  try {
    final user = supabase.auth.currentUser;
    if (user == null) return;

    await supabase
        .from('favorites')
        .delete()
        .eq('id', user.id)
        .eq('attraction_id', attractionId);

    print("Removed from favorites!");
  } catch (e) {
    print("Remove Favorite Error: $e");
  }
}

Future<List<AttractionModel>> getAllFavorites() async {
  try {
    final user = supabase.auth.currentUser;
    if (user == null) return [];

    final response = await supabase.from('favorites').select('''
          attractions (*)
        ''').eq('id', user.id);

    return (response as List).map((item) {
      return AttractionModel.fromSupabase(item['attractions']);
    }).toList();
  } catch (e) {
    print("Get Favorites Error: $e");
    return [];
  }
}
