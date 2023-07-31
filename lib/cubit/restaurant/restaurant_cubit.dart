import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies/cubit/restaurant/restaurant_state.dart';
import 'package:foodies/data/services.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  RestaurantCubit() : super(RestaurantInitial());

  void getRestaurantDetail(String id) async {
    try {
      emit(RestaurantLoading());
      final restaurant = await Services().getRestaurantDetail(id);
      emit(RestaurantLoaded(restaurant: restaurant));
    } catch (_) {
      emit(RestaurantFailure());
    }
  }
}
