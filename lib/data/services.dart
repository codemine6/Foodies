import 'package:dio/dio.dart';
import 'package:foodies/data/models/restaurant.dart';
import 'package:foodies/data/models/restaurant_detail.dart';
import 'package:foodies/data/models/review.dart';
import 'package:hive/hive.dart';

class Services {
  final baseUrl = 'https://restaurant-api.dicoding.dev';
  final imageUrl = 'https://restaurant-api.dicoding.dev/images/medium/';

  Future<void> addFavorite(String id) async {
    try {
      final box = await Hive.openBox('restaurant');
      final favorites = box.get('favorites', defaultValue: []) as List;
      favorites.add(id);
      box.put('favorites', favorites);
    } catch (_) {}
  }

  Future<void> removeFavorite(String id) async {
    try {
      final box = await Hive.openBox('restaurant');
      final favorites = box.get('favorites', defaultValue: []) as List;
      favorites.remove(id);
      box.put('favorites', favorites);
    } catch (_) {}
  }

  Future<bool> isFavorited(String id) async {
    try {
      final box = await Hive.openBox('restaurant');
      final favorites = box.get('favorites', defaultValue: []) as List;
      return favorites.contains(id);
    } catch (e) {
      return false;
    }
  }

  Future<List<Restaurant>> getFavorites() async {
    try {
      final box = await Hive.openBox('restaurant');
      final favorites = box.get('favorites', defaultValue: []) as List;
      final restaurants = await Future.wait(favorites.map((id) async {
        try {
          final response = await Dio().get('$baseUrl/detail/$id');
          if (response.statusCode == 200) {
            final restaurant = response.data['restaurant'];
            return Restaurant.fromJson(restaurant);
          }
        } catch (_) {}
      }));
      return restaurants.whereType<Restaurant>().toList();
    } catch (_) {
      return [];
    }
  }

  Future<void> addReview(Review review) async {
    try {
      await Dio().post(
        '$baseUrl/review',
        data: {
          'id': review.id,
          'name': review.name,
          'review': review.review,
        },
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
    } catch (_) {}
  }

  Future<List<Restaurant>> getRestaurants() async {
    try {
      final response = await Dio().get('$baseUrl/list');
      if (response.statusCode == 200) {
        final restaurants = response.data['restaurants'] as List;
        return restaurants.map((restaurant) {
          return Restaurant.fromJson(restaurant);
        }).toList();
      }
      throw Exception;
    } catch (_) {
      throw Exception;
    }
  }

  Future<List<Restaurant>> getRestaurantsByCity(String city) async {
    try {
      final response = await Dio().get('$baseUrl/list');
      if (response.statusCode == 200) {
        final restaurants = response.data['restaurants'] as List;
        final data = restaurants.map((restaurant) {
          return Restaurant.fromJson(restaurant);
        });
        if (city == 'All') {
          return data.toList();
        } else {
          return data.where((element) => element.city == city).toList();
        }
      }
      throw Exception;
    } catch (_) {
      throw Exception;
    }
  }

  Future<RestaurantDetail> getRestaurantDetail(String id) async {
    try {
      final response = await Dio().get('$baseUrl/detail/$id');
      if (response.statusCode == 200) {
        final restaurant = response.data['restaurant'];
        return RestaurantDetail.fromJson(restaurant);
      }
      throw Exception();
    } catch (_) {
      throw Exception();
    }
  }

  Future<List<Restaurant>> searchRestaurant(String query) async {
    try {
      final response = await Dio().get('$baseUrl/search?q=$query');
      if (response.statusCode == 200) {
        final restaurants = response.data['restaurants'] as List;
        return restaurants
            .map((restaurant) => Restaurant.fromJson(restaurant))
            .toList();
      }
      throw Exception();
    } catch (_) {
      return [];
    }
  }
}
