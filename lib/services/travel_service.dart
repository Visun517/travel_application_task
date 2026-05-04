import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_application/models/attraction_place.dart';
import 'package:travel_application/providers/attraction_places_provider.dart';

Future<List<AttractionModel>> getLocationIdFromApi(String query) async {
  final apiKey = dotenv.env['X-RAPIDAPIKEY'] ?? '';

  if (apiKey.isEmpty) {
    return [];
  }

  final String url =
      'https://travel-advisor.p.rapidapi.com/locations/search?query=$query&limit=1&units=km&currency=USD&sort=relevance&lang=en_US';

  try {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'x-rapidapi-host': 'travel-advisor.p.rapidapi.com',
        'x-rapidapi-key': apiKey,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> fullData = jsonDecode(response.body);

      if (fullData['data'] != null && (fullData['data'] as List).isNotEmpty) {
        final resultObject = fullData['data'][0]['result_object'];

        if (resultObject != null && resultObject['location_id'] != null) {
          final String locationId = resultObject['location_id'].toString();

          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('saved_location_id', locationId);
          print('✅ Location ID saved: $locationId');

          return await getAttractionsByLocationId(locationId);
        }
      }
    } else {}
    return [];
  } catch (e) {
    return [];
  }
}

Future<List<AttractionModel>> getAttractionsByLocationId(
  String locationId,
) async {
  final apiKey = dotenv.env['X-RAPIDAPIKEY'] ?? '';

  final String url =
      'https://travel-advisor.p.rapidapi.com/attractions/list?location_id=$locationId&currency=USD&lang=en_US';

  try {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'x-rapidapi-host': 'travel-advisor.p.rapidapi.com',
        'x-rapidapi-key': apiKey,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      final List<dynamic> rawData = responseBody['data'] ?? [];

      return rawData
          .where(
            (item) =>
                item['name'] != null &&
                item['photo'] != null &&
                item['location_id'] != "0",
          )
          .map((item) => AttractionModel.fromMap(item))
          .toList();
    } else {
      return [];
    }
  } catch (e) {
    return [];
  }
}

Future<void> fetchStoredAttractions(WidgetRef ref) async {
  try {
    final prefs = await SharedPreferences.getInstance();

    final String? savedId = prefs.getString('saved_location_id');

    List<AttractionModel> results = [];

    if (savedId != null && savedId.isNotEmpty) {
      results = await getAttractionsByLocationId(savedId);
    } else {
      results = await getLocationIdFromApi("Colombo");
    }

    ref.read(attractionsProvider.notifier).updateAttractions(results);
  } catch (e) {
    print(e);
  }
}
