import 'package:foodies/data/models/restaurant.dart';

abstract class FavoritesState {
  const FavoritesState();
}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesFailure extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<Restaurant> favorites;

  FavoritesLoaded({required this.favorites});
}
