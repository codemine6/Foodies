import 'package:flutter/material.dart';
import 'package:foodies/screens/widgets/shimmer_widget.dart';

class RestaurantDetailShimmer extends StatelessWidget {
  const RestaurantDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          const ShimmerWidget.rect(width: double.infinity, height: 360),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            margin: const EdgeInsets.only(top: 340),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 13),
                Container(
                  alignment: Alignment.center,
                  child: const ShimmerWidget.rect(width: 40, height: 5),
                ),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    ShimmerWidget.rect(width: 100, height: 20),
                    ShimmerWidget.circle(radius: 32),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: const [
                    ShimmerWidget.rect(width: 80, height: 32),
                    SizedBox(width: 16),
                    ShimmerWidget.rect(width: 80, height: 32),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: const [
                    ShimmerWidget.rect(width: 40, height: 40),
                    SizedBox(width: 16),
                    ShimmerWidget.rect(width: 180, height: 40),
                    Spacer(),
                    ShimmerWidget.rect(width: 60, height: 40),
                  ],
                ),
                const SizedBox(height: 24),
                const ShimmerWidget.rect(width: 100, height: 16),
                const SizedBox(height: 16),
                const ShimmerWidget.rect(width: double.infinity, height: 100),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    ShimmerWidget.rect(width: 80, height: 24),
                    ShimmerWidget.rect(width: 80, height: 24),
                  ],
                ),
                const SizedBox(height: 24),
                const ShimmerWidget.rect(width: 80, height: 24),
                const SizedBox(height: 16),
                SizedBox(
                  height: 144,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: 100,
                        child: Column(
                          children: const [
                            ShimmerWidget.rect(
                                width: double.infinity, height: 70),
                            Spacer(),
                            ShimmerWidget.rect(
                                width: double.infinity, height: 16),
                            SizedBox(height: 8),
                            ShimmerWidget.rect(width: 60, height: 16),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 12),
                    itemCount: 5,
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
