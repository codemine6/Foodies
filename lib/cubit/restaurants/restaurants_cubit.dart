import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies/cubit/restaurants/restaurants_state.dart';
import 'package:foodies/data/services.dart';

class RestaurantsCubit extends Cubit<RestaurantsState> {
  RestaurantsCubit() : super(RestaurantsInitial());

  void getRestaurants() async {
    try {
      emit(RestaurantsLoading());
      final restaurants = await Services().getRestaurants();
      emit(RestaurantsLoaded(restaurants: restaurants));
    } catch (_) {
      emit(RestaurantsFailure());
    }
  }

  void getRestaurantsByCity(String city) async {
    try {
      emit(RestaurantsLoading());
      final restaurants = await Services().getRestaurantsByCity(city);
      emit(RestaurantsLoaded(restaurants: restaurants));
    } catch (_) {
      emit(RestaurantsFailure());
    }
  }

  void searchRestaurant(String query) async {
    try {
      emit(RestaurantsLoading());
      final results = await Services().searchRestaurant(query);
      emit(RestaurantSearchLoaded(results: results));
    } catch (_) {
      emit(RestaurantsFailure());
    }
  }
}
