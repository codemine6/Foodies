import 'package:flutter/material.dart';

class RestaurantTabs extends StatelessWidget {
  final int tabIndex;
  final Function(int tab) setTabIndex;

  const RestaurantTabs({
    super.key,
    required this.tabIndex,
    required this.setTabIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              child: Container(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 4),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: tabIndex == 0
                          ? Theme.of(context).primaryColor
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                child: const Text(
                  'Menus',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              onTap: () => setTabIndex(0),
            ),
            InkWell(
              child: Container(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 4),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: tabIndex == 1
                          ? Theme.of(context).primaryColor
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                child: const Text(
                  'Reviews',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              onTap: () => setTabIndex(1),
            ),
          ],
        ),
      ),
    );
  }
}
