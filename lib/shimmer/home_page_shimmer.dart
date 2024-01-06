import 'package:flutter/material.dart';
import 'package:pexels/constants/custom_colors.dart';
import 'package:shimmer/shimmer.dart';

class HomePageShimmer extends StatelessWidget {
  const HomePageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: shimmerBaseColor,
        highlightColor: shimmerHighlightColor,
        child: Container(
          height: 300,
          margin: const EdgeInsets.only(top: 20, bottom: 20),
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
              color: Colors.amber, borderRadius: BorderRadius.circular(10)),
        ));
  }
}
