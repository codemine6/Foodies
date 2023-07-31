import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class RestaurantLocation extends StatelessWidget {
  final String address;
  final String city;
  final double rating;

  const RestaurantLocation({
    super.key,
    required this.address,
    required this.city,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Ionicons.location,
          size: 32,
          color: Theme.of(context).primaryColor,
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              city,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              address,
              style: TextStyle(color: Theme.of(context).disabledColor),
            ),
          ],
        ),
        const Spacer(),
        const Icon(
          Ionicons.star,
          size: 28,
          color: Colors.yellow,
        ),
        const SizedBox(width: 4),
        Text(
          '$rating',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
