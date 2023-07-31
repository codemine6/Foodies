import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodies/data/models/restaurant.dart';
import 'package:ionicons/ionicons.dart';

class RestaurantItem extends StatelessWidget {
  final Restaurant restaurant;
  final Function() onTap;

  const RestaurantItem({
    super.key,
    required this.restaurant,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: AspectRatio(
                    aspectRatio: 4 / 3,
                    child: Image.network(
                      restaurant.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${restaurant.name}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    RatingBarIndicator(
                      itemBuilder: (context, index) => const Icon(
                        Ionicons.star,
                        color: Colors.amber,
                      ),
                      itemSize: 16,
                      rating: restaurant.rating!,
                    ),
                    const SizedBox(height: 4),
                    Text('${restaurant.city}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
