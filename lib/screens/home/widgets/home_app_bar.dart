import 'package:flutter/material.dart';
import 'package:foodies/screens/favorites/favorites_screen.dart';
import 'package:foodies/screens/settings/settings_screen.dart';
import 'package:ionicons/ionicons.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Foodies'),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FavoritesScreen(),
              ),
            );
          },
          icon: Icon(
            Ionicons.heart_outline,
            color: Theme.of(context).primaryColor,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsScreen(),
              ),
            );
          },
          icon: Icon(
            Ionicons.settings_outline,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
