class Place {
  final String name;
  final String location;
  final String image;
  final double rating;
  final String about;

  Place({
    required this.name,
    required this.location,
    required this.image,
    required this.rating,
    required this.about,
  });
}

List<Place> popularPlaces = [
  Place(
    name: "Bali, Indonesia",
    location: "Southeast Asia",
    image: "assets/images/bali.png",
    rating: 4.9,
    about:
        "Bali is a living postcard, an Indonesian paradise that feels like a fantasy. Soak up the sun on a stretch of fine white sand, or dive along vibrant coral ridges. On shore, the lush jungle shelters stone temples and mischievous monkeys. The Balinese people practice a form of Hinduism full of unique rituals, from exquisite flower-petal offerings to the thrilling barong dance.",
  ),
  Place(
    name: "Maldives",
    location: "Indian Ocean",
    image: "assets/images/maldives.png",
    rating: 4.7,
    about:
        "Bali is a living postcard, an Indonesian paradise that feels like a fantasy. Soak up the sun on a stretch of fine white sand, or dive along vibrant coral ridges. On shore, the lush jungle shelters stone temples and mischievous monkeys. The Balinese people practice a form of Hinduism full of unique rituals, from exquisite flower-petal offerings to the thrilling barong dance.",
  ),
  Place(
    name: "Paris, France",
    location: "Europe",
    image: "assets/images/paris.png",
    rating: 4.8,
    about:
        "Bali is a living postcard, an Indonesian paradise that feels like a fantasy. Soak up the sun on a stretch of fine white sand, or dive along vibrant coral ridges. On shore, the lush jungle shelters stone temples and mischievous monkeys. The Balinese people practice a form of Hinduism full of unique rituals, from exquisite flower-petal offerings to the thrilling barong dance.",
  ),
  Place(
    name: "Machu Picchu, Peru",
    location: "South America",
    image: "assets/images/peru.png",
    rating: 4.8,
    about:
        "Bali is a living postcard, an Indonesian paradise that feels like a fantasy. Soak up the sun on a stretch of fine white sand, or dive along vibrant coral ridges. On shore, the lush jungle shelters stone temples and mischievous monkeys. The Balinese people practice a form of Hinduism full of unique rituals, from exquisite flower-petal offerings to the thrilling barong dance.",
  ),
  Place(
    name: "Tokyo, Japan",
    location: "East Asia",
    image: "assets/images/tokyo.png",
    rating: 4.8,
    about:
        "Bali is a living postcard, an Indonesian paradise that feels like a fantasy. Soak up the sun on a stretch of fine white sand, or dive along vibrant coral ridges. On shore, the lush jungle shelters stone temples and mischievous monkeys. The Balinese people practice a form of Hinduism full of unique rituals, from exquisite flower-petal offerings to the thrilling barong dance.",
  ),
];
