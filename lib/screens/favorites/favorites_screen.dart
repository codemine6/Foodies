import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies/cubit/favorites/favorites_cubit.dart';
import 'package:foodies/cubit/favorites/favorites_state.dart';
import 'package:foodies/screens/detail_restaurant/detail_restaurant_screen.dart';
import 'package:foodies/screens/widgets/restaurant_item.dart';
import 'package:foodies/screens/widgets/restaurant_item_shimmer.dart';
import 'package:ionicons/ionicons.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    context.read<FavoritesCubit>().getFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          BlocBuilder<FavoritesCubit, FavoritesState>(
            builder: (context, state) {
              if (state is FavoritesLoaded && state.favorites.isNotEmpty) {
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return RestaurantItem(
                        restaurant: state.favorites[index],
                        onTap: () async {
                          final refresh = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailRestaurantScreen(
                                restaurantId: state.favorites[index].id!,
                              ),
                            ),
                          );
                          if (refresh && mounted) {
                            context.read<FavoritesCubit>().getFavorites();
                          }
                        },
                      );
                    },
                    itemCount: state.favorites.length,
                  ),
                );
              } else if (state is FavoritesLoaded && state.favorites.isEmpty) {
                return Expanded(
                  child: Center(
                    child: Icon(
                      Ionicons.file_tray_outline,
                      size: 72,
                      color: Theme.of(context).disabledColor,
                    ),
                  ),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return const RestaurantItemShimmer();
                    },
                    itemCount: 10,
                  ),
                );
              }
            },
          ),
        ],
      ),
      backgroundColor: Theme.of(context).highlightColor,
    );
  }
}
