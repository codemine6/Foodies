import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies/cubit/restaurants/restaurants_cubit.dart';
import 'package:foodies/cubit/restaurants/restaurants_state.dart';
import 'package:foodies/screens/home/widgets/home_app_bar.dart';
import 'package:foodies/screens/home/widgets/restaurant_cities.dart';
import 'package:foodies/screens/home/widgets/restaurant_list.dart';
import 'package:foodies/screens/home/widgets/search_form.dart';
import 'package:foodies/screens/home/widgets/search_not_found.dart';
import 'package:foodies/screens/widgets/custom_alert.dart';
import 'package:foodies/screens/widgets/restaurant_item_shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<RestaurantsCubit>().getRestaurants();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(48),
        child: HomeAppBar(),
      ),
      body: BlocConsumer<RestaurantsCubit, RestaurantsState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    SearchForm(
                      onSearch: (query) {
                        context
                            .read<RestaurantsCubit>()
                            .searchRestaurant(query);
                      },
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
              const RestaurantCities(),
              if (state is RestaurantsLoaded)
                RestaurantList(data: state.restaurants),
              if (state is RestaurantSearchLoaded)
                RestaurantList(data: state.results),
              if (state is RestaurantSearchLoaded && state.results.isEmpty)
                SearchNotFound(
                  onCancel: () {
                    context.read<RestaurantsCubit>().getRestaurants();
                  },
                ),
              if (state is RestaurantsLoading || state is RestaurantsFailure)
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => const RestaurantItemShimmer(),
                    childCount: 10,
                  ),
                ),
            ],
          );
        },
        listener: (context, state) {
          if (state is RestaurantsFailure) {
            showDialog(
              context: context,
              builder: (context) => const CustomAlert(),
            );
          }
        },
      ),
      backgroundColor: Theme.of(context).highlightColor,
    );
  }
}
