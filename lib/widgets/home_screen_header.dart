import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_application/loading/skelton_loader.dart';
import 'package:travel_application/providers/user_profile_provider.dart';

class HomeScreenHeader extends ConsumerWidget {
  const HomeScreenHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userProfileDataProvider);

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: userAsync.when(
        data: (user) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,  
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/user_profile.jpg'),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good to see you,",
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                    Text(
                      user?.name ?? "Traveler",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'PlayfairDisplay',
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none,
                  color: Colors.black,
                  size: 26,
                ),
              ),
            ),
          ],
        ),
        loading: () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SkeletonLoader(
                  width: 50,
                  height: 50,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SkeletonLoader(width: 100, height: 14),
                    const SizedBox(height: 8),
                    const SkeletonLoader(width: 150, height: 20),
                  ],
                ),
              ],
            ),
            const SkeletonLoader(
              width: 45,
              height: 45,
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
          ],
        ),
        error: (err, stack) => Text("Error Loading Profile data $err"),
      ),
    );
  }
}
