import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies/cubit/restaurants/restaurants_cubit.dart';

class RestaurantCities extends StatefulWidget {
  const RestaurantCities({super.key});

  @override
  State<RestaurantCities> createState() => _RestaurantCitiesState();
}

class _RestaurantCitiesState extends State<RestaurantCities> {
  var selected = 'All';
  final cities = [
    'All',
    'Aceh',
    'Bali',
    'Balikpapan',
    'Bandung',
    'Gorontalo',
    'Malang',
    'Medan',
    'Surabaya',
    'Ternate'
  ];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
        height: 64,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final city = cities[index];

            return InkWell(
              onTap: () {
                setState(() {
                  selected = city;
                  context.read<RestaurantsCubit>().getRestaurantsByCity(city);
                });
              },
              borderRadius: BorderRadius.circular(24),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: city == selected
                      ? Theme.of(context).primaryColor
                      : Colors.transparent,
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text(
                  cities[index],
                  style: TextStyle(
                    color: city == selected
                        ? Theme.of(context).canvasColor
                        : Theme.of(context).primaryColor,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 16),
          itemCount: cities.length,
        ),
      ),
    );
  }
}
