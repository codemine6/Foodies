import 'package:foodies/data/models/restaurant_detail.dart';

abstract class RestaurantState {
  const RestaurantState();
}

class RestaurantInitial extends RestaurantState {}

class RestaurantLoading extends RestaurantState {}

class RestaurantFailure extends RestaurantState {}

class RestaurantLoaded extends RestaurantState {
  final RestaurantDetail restaurant;

  RestaurantLoaded({required this.restaurant});
}
