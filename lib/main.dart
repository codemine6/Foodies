import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies/cubit/favorites/favorites_cubit.dart';
import 'package:foodies/cubit/restaurant/restaurant_cubit.dart';
import 'package:foodies/cubit/restaurants/restaurants_cubit.dart';
import 'package:foodies/screens/home/home_screen.dart';
import 'package:foodies/utils/custom_theme.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FavoritesCubit(),
        ),
        BlocProvider(
          create: (context) => RestaurantCubit(),
        ),
        BlocProvider(
          create: (context) => RestaurantsCubit(),
        ),
      ],
      child: MaterialApp(
        home: const HomeScreen(),
        theme: customTheme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
