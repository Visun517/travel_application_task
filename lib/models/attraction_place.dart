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

  factory AttractionModel.fromSupabase(Map<String, dynamic> map) {
    return AttractionModel(
      id: map['id'] ?? '',
      name: map['name'] ?? 'Unknown Place',
      imageUrl: map['image_url'], 
      rating: (map['rating'] is num) ? (map['rating'] as num).toDouble() : 0.0,
      reviewCount: map['review_count']?.toString() ?? "0",
      location: map['location'] ?? "",
      description: map['description'] ?? "",
      price: map['price'],
      category: map['category'] ?? "Attraction",
    );
  }
}
