import 'package:flutter/material.dart';

class RestaurantCategories extends StatelessWidget {
  final List categories;

  const RestaurantCategories({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: categories.map((category) {
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '$category',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
