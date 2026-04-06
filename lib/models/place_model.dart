class Place {
  final String name;
  final String  location;
  final String image;
  final double rating;
  final String about;

  Place({required this.name, required this.location, required this.image, required this.rating, required this.about});
}

List<Place> popularPlaces = [
  Place(name: "Bali, Indonesia", location: "Southeast Asia", image: "assets/images/bali.png", rating: 4.9, about: "Tropical paradise with stunning beaches and rich culture."),
  Place(name: "Maldives", location: "Indian Ocean", image: "assets/images/maldives.png", rating: 4.7, about: "Overwater bungalows and crystal-clear waters."),
  Place(name: "Paris, France", location: "Europe", image: "assets/images/paris.png", rating: 4.8, about: "City of lights with iconic landmarks and world-class cuisine."),
  Place(name: "Machu Picchu, Peru", location: "South America", image: "assets/images/peru.png", rating: 4.8, about: "Ancient Incan citadel high in the Andes Mountains."),
  Place(name: "Tokyo, Japan", location: "East Asia", image: "assets/images/tokyo.png", rating: 4.8, about: "Vibrant metropolis blending traditional and modern culture."),
];