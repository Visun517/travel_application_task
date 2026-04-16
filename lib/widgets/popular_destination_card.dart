import 'package:flutter/material.dart';
import 'package:travel_application/models/favorite_places.dart'
    show favoritePlaces;
import 'package:travel_application/models/place_model.dart';
import 'package:travel_application/screens/destination_details_screen.dart';

class PopularDestinationCard extends StatefulWidget {
  final Place place;
  const PopularDestinationCard({super.key, required this.place});

  @override
  State<PopularDestinationCard> createState() => _PopularDestinationCardState();
}

class _PopularDestinationCardState extends State<PopularDestinationCard> {
  @override
  Widget build(BuildContext context) {
    // අදාළ ස්ථානය favorite list එකේ තිබේදැයි පරීක්ෂා කිරීම
    bool isFavorite = favoritePlaces.contains(widget.place);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DestinationDetailsScreen(place: widget.place),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                  child: Image.asset(
                    widget
                        .place
                        .image, // StatefulWidget එකේදී widget. භාවිතා කළ යුතුයි
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.8),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.black,
                      ),
                      onPressed: () {
                        // UI එක refresh කිරීමට setState භාවිතා කරමු
                        setState(() {
                          if (isFavorite) {
                            favoritePlaces.remove(widget.place);
                            print(
                              "${widget.place.name} removed from favorites",
                            );
                          } else {
                            favoritePlaces.add(widget.place);
                            print("${widget.place.name} added to favorites");
                          }
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.place.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 18,
                        color: Colors.blueGrey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.place.location,
                        style: const TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        "${widget.place.rating}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
