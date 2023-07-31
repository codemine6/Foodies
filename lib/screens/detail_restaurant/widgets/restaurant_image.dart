import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class RestaurantImage extends StatelessWidget {
  final String image;

  const RestaurantImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(56),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: InkWell(
              onTap: () => Navigator.pop(context, true),
              borderRadius: BorderRadius.circular(56),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor.withOpacity(.2),
                ),
                child: Icon(
                  Ionicons.chevron_back,
                  color: Theme.of(context).canvasColor,
                ),
              ),
            ),
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(image, fit: BoxFit.cover),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          height: 32,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).disabledColor,
              borderRadius: BorderRadius.circular(5),
            ),
            width: 40,
            height: 5,
          ),
        ),
      ),
      expandedHeight: 340,
      leadingWidth: 80,
    );
  }
}
