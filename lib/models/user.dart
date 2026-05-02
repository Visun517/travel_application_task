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
}

UserModel currentUser = UserModel(
  name: "Visun Prabodha",
  email: "visun@example.com",
  imagePath: 'assets/images/user_profile.jpg',
  tripsCount: 12,
  favoritesCount: 45,
  reviewsCount: 8,
);