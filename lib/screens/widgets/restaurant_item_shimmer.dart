import 'package:flutter/material.dart';
import 'package:foodies/screens/widgets/shimmer_widget.dart';

class RestaurantItemShimmer extends StatelessWidget {
  const RestaurantItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
      child: Row(
        children: [
          const ShimmerWidget.rect(width: 100, height: 75),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ShimmerWidget.rect(width: 150, height: 16),
                SizedBox(height: 14),
                ShimmerWidget.rect(width: 90, height: 12),
                SizedBox(height: 8),
                ShimmerWidget.rect(width: 70, height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
