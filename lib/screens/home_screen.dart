import 'package:flutter/material.dart';
import 'package:travel_application/widgets/home_screen_top_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeScreenTopBanner(),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(items: [],),
    );
  }
}
