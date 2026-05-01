class Place {
  final String name;
  final String location;
  final String image;
  final double rating;
  final String description; 
  final String about;       
  final int price;          

  Place({
    required this.name,
    required this.location,
    required this.image,
    required this.rating,
    required this.description,
    required this.about,
    required this.price,
  });
}

List<Place> popularPlaces = [
  Place(
    name: "Ireland",
    location: "Europe",
    image: "assets/images/pexels-tejas-kamble-715220277-34731910.jpg", 
    rating: 4.9,
    price: 3200,
    description: "Rolling green hills, dramatic Atlantic coasts, and live music in every town.",
    about: "Ireland is an island in the North Atlantic. It is separated from Great Britain to its east by the North Channel, the Irish Sea, and St George's Channel. Ireland is the second-largest island of the British Isles, the third-largest in Europe, and the twentieth-largest on Earth.",
  ),
  Place(
    name: "Bali, Indonesia",
    location: "Southeast Asia",
    image: "assets/images/bali.png",
    rating: 4.8,
    price: 1500,
    description: "A tropical paradise with ancient temples and vibrant coral ridges.",
    about: "Bali is a living postcard, an Indonesian paradise that feels like a fantasy. Soak up the sun on a stretch of fine white sand, or dive along vibrant coral ridges. On shore, the lush jungle shelters stone temples and mischievous monkeys.",
  ),
  Place(
    name: "Paris, France",
    location: "Europe",
    image: "assets/images/paris.png",
    rating: 4.7,
    price: 2800,
    description: "The city of lights, known for its iconic Eiffel Tower and world-class art.",
    about: "Paris, France's capital, is a major European city and a global center for art, fashion, gastronomy and culture. Its 19th-century cityscape is crisscrossed by wide boulevards and the River Seine.",
  ),
  Place(
    name: "Tokyo, Japan",
    location: "East Asia",
    image: "assets/images/tokyo.png",
    rating: 4.8,
    price: 2200,
    description: "A futuristic metropolis where neon lights meet historic shrines.",
    about: "Tokyo, Japan’s busy capital, mixes the ultramodern and the traditional, from neon-lit skyscrapers to historic temples. The opulent Meiji Shinto Shrine is known for its towering gate and surrounding woods.",
  ),
];