import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_application/loading/poplar_destination_card_loader.dart';
import 'package:travel_application/providers/attraction_places_provider.dart';
import 'package:travel_application/providers/favorites_places_provider.dart';
import 'package:travel_application/screens/all_attraction_places.dart';
import 'package:travel_application/services/travel_service.dart';
import 'package:travel_application/widgets/category_bar.dart';
import 'package:travel_application/widgets/home_screen_header.dart';
import 'package:travel_application/widgets/pop_up_notification.dart';
import 'package:travel_application/widgets/popular_destination_card.dart';
import 'package:travel_application/widgets/search_bar.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      TravelUtils.showWelcomeDialog(context);
      ref.read(favoritesProvider.notifier).loadFavorites();
      Future.microtask(() => fetchStoredAttractions(ref));
    });
  }

  @override
  Widget build(BuildContext context) {
    final allAttractions = ref.watch(attractionsProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: HomeScreenHeader()),
            const SliverToBoxAdapter(child: const HomeScreenSearchBar()),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            const SliverToBoxAdapter(child: const HomeScreenCategories()),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Text(
                      "Popular Destinations",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Spacer(),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const AllAttractionsScreen()),
                        );
                      },
                      child: const Text(
                        "See all",
                        style: TextStyle(
                          color: Colors
                              .blue, 
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 470,
                child: allAttractions.isEmpty
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) =>
                            buildPopularCardLoader(),
                      )
                    : ListView.builder(
                        cacheExtent: 100,
                        scrollDirection: Axis.horizontal,
                        itemCount: allAttractions.length,
                        itemBuilder: (context, index) {
                          return ProviderScope(
                            overrides: [
                              currentAttractionProvider.overrideWithValue(
                                allAttractions[index],
                              ),
                            ],
                            child: const PopularDestinationCard(),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
