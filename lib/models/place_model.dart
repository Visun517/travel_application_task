class Place {
  final String name;
  final String  location;
  final String image;
  final double rating;

  Place({required this.name, required this.location, required this.image, required this.rating});
}

List<Place> popularPlaces = [
  Place(name: "Bali, Indonesia", location: "Southeast Asia", image: "assets/images/bali.png", rating: 4.9),
  Place(name: "Maldives", location: "Indian Ocean", image: "assets/images/maldives.png", rating: 4.7),
  Place(name: "Paris, France", location: "Europe", image: "assets/images/paris.png", rating: 4.8),
  Place(name: "Machu Picchu, Peru", location: "South America", image: "assets/images/peru.png", rating: 4.8),
  Place(name: "Tokyo, Japan", location: "East Asia", image: "assets/images/tokyo.png", rating: 4.8),
];