class UserModel {
  final String name;
  final String email;
  final String imagePath;
  final int tripsCount;
  final int favoritesCount;
  final int reviewsCount;

  UserModel({
    required this.name,
    required this.email,
    required this.imagePath,
    this.tripsCount = 0,
    this.favoritesCount = 0,
    this.reviewsCount = 0,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['full_name'] ?? 'Traveler', 
      email: map['email'] ?? '',
      imagePath: map['avatar_url'] ?? 'assets/images/user_profile.jpg',
      tripsCount: map['trips_count'] ?? 0,
      favoritesCount: map['favorites_count'] ?? 0,
      reviewsCount: map['reviews_count'] ?? 0,
    );
  }
}