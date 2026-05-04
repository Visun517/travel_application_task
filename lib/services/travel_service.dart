import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; 
import 'package:travel_application/models/attraction_place.dart';
import 'package:travel_application/providers/attraction_places_provider.dart';

final supabase = Supabase.instance.client;

Future<List<AttractionModel>> getAttractionsFromSupabase() async {
  try {
    final List<dynamic> response = await supabase.from('attractions').select();
    
    print("Fetched ${response.length} items from Supabase"); 

    return response.map((item) => AttractionModel.fromSupabase(item)).toList();
  } catch (e) {
    print("Supabase Error: $e");
    return [];
  }
}

Future<void> fetchStoredAttractions(WidgetRef ref) async {
  try {
    final List<AttractionModel> results = await getAttractionsFromSupabase();
    
    print('Results fetched: ${results.length}');

    ref.read(attractionsProvider.notifier).updateAttractions(results);
    
  } catch (e) {
    print("Provider update error: $e");
  }
}



Future<List<AttractionModel>> getAttractionsByCategory({query = "Sri Lanka", String? category}) async {
  try {
    var supabaseQuery = supabase.from('attractions').select();

    if (category != null && category != "Best by Season") {
      supabaseQuery = supabaseQuery.eq('category', category);
    }

    final List<dynamic> response = await supabaseQuery;
    return response.map((item) => AttractionModel.fromSupabase(item)).toList();
  } catch (e) {
    print("Supabase Fetch Error: $e");
    return [];
  }
}

// travel_service.dart

Future<void> updateCategory(WidgetRef ref, String categoryName) async {
  try {
    ref.read(selectedCategoryProvider.notifier).state = categoryName;

    ref.read(attractionsProvider.notifier).updateAttractions([]);

    final results = await getAttractionsByCategory(query: "Sri Lanka", category: categoryName);

    ref.read(attractionsProvider.notifier).updateAttractions(results);
  } catch (e) {
    print("Error updating category: $e");
  }
}
