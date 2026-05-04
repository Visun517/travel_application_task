import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_application/providers/attraction_places_provider.dart';
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
            SliverToBoxAdapter(child: HomeScreenHeader()),
            SliverToBoxAdapter(child: const HomeScreenSearchBar()),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverToBoxAdapter(child: const HomeScreenCategories()),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: const [
                    Text(
                      "Popular Destinations",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "See all",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 470,
                child: ListView.builder(
                  cacheExtent: 100,
                  scrollDirection: Axis.horizontal,
                  itemCount: ref.watch(attractionsProvider).length,
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
