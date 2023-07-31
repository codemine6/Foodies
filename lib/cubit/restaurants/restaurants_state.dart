import 'package:foodies/data/models/restaurant.dart';

abstract class RestaurantsState {
  const RestaurantsState();
}

class RestaurantsInitial extends RestaurantsState {}

class RestaurantsLoading extends RestaurantsState {}

class RestaurantsFailure extends RestaurantsState {}

class RestaurantsLoaded extends RestaurantsState {
  final List<Restaurant> restaurants;

  RestaurantsLoaded({required this.restaurants});
}

class RestaurantSearchLoaded extends RestaurantsState {
  final List<Restaurant> results;

  RestaurantSearchLoaded({required this.results});
}
