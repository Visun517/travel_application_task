import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Row(
        children: [
          const Expanded(child: Divider(thickness: 1, color: Colors.black26)),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'or',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
            ),
          ),

          const Expanded(child: Divider(thickness: 1, color: Colors.black26)),
        ],
      ),
    );
  }
}
