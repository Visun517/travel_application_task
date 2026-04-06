class Place {
  final String name;
  final String image;
  final double rating;

  Place({required this.name, required this.image, required this.rating});
}

List<Place> popularPlaces = [
  Place(name: "Bali, Indonesia", image: "assets/images/bali.png", rating: 4.9),
  Place(name: "Maldives", image: "assets/images/maldives.png", rating: 4.7),
  Place(name: "Paris, France", image: "assets/images/paris.png", rating: 4.8),
  Place(name: "Machu Picchu, Peru", image: "assets/images/peru.png", rating: 4.8),
  Place(name: "Tokyo, Japan", image: "assets/images/tokyo.png", rating: 4.8),
];