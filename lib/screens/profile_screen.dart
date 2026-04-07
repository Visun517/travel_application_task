import 'package:flutter/material.dart';
import 'package:travel_application/models/user_model.dart';
import 'package:travel_application/screens/main_screen.dart';
import 'package:travel_application/widgets/profile_header.dart';
import 'package:travel_application/widgets/profile_stat_section.dart';
import 'package:travel_application/widgets/profile_menu_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SafeArea(
            child: Column(
              children: [
                ProfileHeader(
                  name: currentUser.name,
                  email: currentUser.email,
                  imagePath: currentUser.imagePath,
                ),
                const SizedBox(height: 30),

                ProfileStatSection(
                  trips: currentUser.tripsCount,
                  favorites: currentUser.favoritesCount,
                  reviews: currentUser.reviewsCount,
                ),

                const SizedBox(height: 30),

                ProfileMenuItem(
                  icon: Icons.person_outline,
                  title: "Edit Profile",
                  onTap: () {
                    print("Edit Profile Clicked");
                  },
                ),
                ProfileMenuItem(
                  icon: Icons.favorite_border,
                  title: "My Favorites",
                  onTap: () {
                    print("Favorites Clicked");
                  },
                ),
                ProfileMenuItem(
                  icon: Icons.settings_outlined,
                  title: "Settings",
                  onTap: () {
                    print("Settings Clicked");
                  },
                ),
                ProfileMenuItem(
                  icon: Icons.help_outline,
                  title: "Help & Support",
                  onTap: () {
                    print("Help Clicked");
                  },
                ),

                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red[50],
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Logout",
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
