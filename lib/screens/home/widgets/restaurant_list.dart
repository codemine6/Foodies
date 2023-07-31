import 'package:flutter/material.dart';
import 'package:foodies/data/models/restaurant.dart';
import 'package:foodies/screens/detail_restaurant/detail_restaurant_screen.dart';
import 'package:foodies/screens/widgets/restaurant_item.dart';

class RestaurantList extends StatelessWidget {
  final List<Restaurant> data;

  const RestaurantList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return RestaurantItem(
            restaurant: data[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailRestaurantScreen(restaurantId: data[index].id!),
                ),
              );
            },
          );
        },
        childCount: data.length,
      ),
    );
  }
}
