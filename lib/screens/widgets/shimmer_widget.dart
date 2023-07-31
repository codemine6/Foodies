import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final double radius;

  const ShimmerWidget.rect({
    super.key,
    required this.width,
    required this.height,
    this.radius = 0,
  });

  const ShimmerWidget.circle({
    super.key,
    this.width = 0,
    this.height = 0,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(.3),
      highlightColor: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(radius > 0 ? radius : 8),
        ),
        width: radius > 0 ? radius : width,
        height: radius > 0 ? radius : height,
      ),
    );
  }
}
