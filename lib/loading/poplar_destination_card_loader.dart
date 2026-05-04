import 'package:flutter/material.dart';
import 'package:travel_application/loading/skelton_loader.dart';

Widget buildPopularCardLoader() {
  return Container(
    width: 350,
    margin: const EdgeInsets.only(left: 20, right: 10),
    child: SkeletonLoader(
      width: 350,
      height: 470,
      borderRadius: BorderRadius.circular(30),
    ),
  );
}