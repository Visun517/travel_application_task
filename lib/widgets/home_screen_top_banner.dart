import 'package:flutter/material.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, 
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Row(
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
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                  const Text(
                    "Jasmin Lowery",
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
          
          // දකුණු පැත්තේ ඇති Notification Bell එක
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100], // Bell එක වටේ ලස්සන පෙනුමක් ලබා දීමට
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
    );
  }
}