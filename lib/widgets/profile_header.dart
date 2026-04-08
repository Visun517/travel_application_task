import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String email;
  final String imagePath;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.email,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 100,
          backgroundImage: AssetImage(imagePath),
          child: Text(
            email.isNotEmpty ? email[0].toUpperCase() : "U", 
            style: const TextStyle(fontSize: 40, color: Colors.white),
          ),
        ),

        const SizedBox(height: 15),

        Text(
          name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),

        Text(email, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
