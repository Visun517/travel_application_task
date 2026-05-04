class AttractionModel {
  final String id;
  final String name;
  final String? imageUrl;
  final double rating;
  final String reviewCount;
  final String location;
  final String description;
  final String? price;
  final String category;

  AttractionModel({
    required this.id,
    required this.name,
    this.imageUrl,
    this.rating = 0.0,
    this.reviewCount = "0",
    required this.location,
    this.description = "",
    this.price,
    this.category = "Attraction",
  });

  factory AttractionModel.fromMap(Map<String, dynamic> map) {
    String? photoUrl;
    if (map['photo'] != null && map['photo']['images'] != null) {
      photoUrl = map['photo']['images']['large']?['url'] ?? 
                 map['photo']['images']['medium']?['url'];
    }

    String categoryName = "Attraction";
    if (map['subcategory'] != null && (map['subcategory'] as List).isNotEmpty) {
      categoryName = map['subcategory'][0]['name'] ?? "Attraction";
    }

    return AttractionModel(
      id: map['location_id'] ?? '',
      name: map['name'] ?? 'Unknown Place',
      imageUrl: photoUrl,
      rating: double.tryParse(map['rating']?.toString() ?? '0.0') ?? 0.0,
      reviewCount: map['num_reviews'] ?? "0",
      location: map['location_string'] ?? "",
      description: map['description'] ?? "",
      price: map['offer_group']?['lowest_price'],
      category: categoryName,
    );
  }
}