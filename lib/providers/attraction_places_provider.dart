import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_application/models/attraction_place.dart';

final currentAttractionProvider = Provider<AttractionModel>((ref) {
  throw UnimplementedError();
});

class AttractionsNotifier extends Notifier<List<AttractionModel>> {
  @override
  List<AttractionModel> build() {
    return []; 
  }

  void updateAttractions(List<AttractionModel> newList) {
    state = newList;
  }
}

final attractionsProvider = NotifierProvider<AttractionsNotifier, List<AttractionModel>>(
  AttractionsNotifier.new,
);