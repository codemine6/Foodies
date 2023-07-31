import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SearchNotFound extends StatelessWidget {
  final Function() onCancel;

  const SearchNotFound({super.key, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const SizedBox(height: 120),
          Icon(
            Ionicons.search_circle_sharp,
            size: 72,
            color: Theme.of(context).disabledColor,
          ),
          const SizedBox(height: 24),
          Text(
            'Restaurant not found!',
            style: TextStyle(color: Theme.of(context).disabledColor),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: onCancel,
            child: Text(
              'Cancel',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
