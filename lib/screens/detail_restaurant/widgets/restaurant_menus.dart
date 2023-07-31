import 'package:flutter/material.dart';
import 'package:foodies/data/models/menus.dart';
import 'package:foodies/screens/detail_restaurant/widgets/menu_item.dart';

class RestaurantMenus extends StatelessWidget {
  final Menus menus;

  const RestaurantMenus({super.key, required this.menus});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Foods',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 144,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return MenuItem(menu: menus.foods![index]);
                },
                separatorBuilder: (context, index) => const SizedBox(width: 12),
                itemCount: menus.foods!.length,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Drinks',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 144,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return MenuItem(menu: menus.drinks![index]);
                },
                separatorBuilder: (context, index) => const SizedBox(width: 12),
                itemCount: menus.drinks!.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
