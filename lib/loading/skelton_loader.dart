import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonLoader extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadiusGeometry borderRadius;

  const SkeletonLoader({
    super.key,
    this.width = double.infinity, 
    this.height = 20, 
    this.borderRadius = const BorderRadius.all(Radius.circular(8))
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}

Widget buildLoadingCard() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // පින්තූරය වෙනුවට කොටුව (image_1abf76.png වගේ)
        SkeletonLoader(width: 80, height: 80, borderRadius: BorderRadius.circular(12)),
        
        SizedBox(width: 16),
        
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title එක - ටිකක් දිගයි
              SkeletonLoader(width: double.infinity, height: 20),
              
              SizedBox(height: 10),
              
              // Subtitle එක - පොඩ්ඩක් කොටයි
              FractionallySizedBox(
                widthFactor: 0.5, // screen එකෙන් භාගයක් වගේ width එක
                child: SkeletonLoader(height: 15),
              ),
            ],
          ),
        )
      ],
    ),
  );
}