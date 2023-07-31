import 'package:foodies/data/models/menus.dart';
import 'package:foodies/data/models/review.dart';

class RestaurantDetail {
  final String? address;
  final List? categories;
  final String? city;
  final List? customerReviews;
  final String? description;
  final String? image;
  final Menus? menus;
  final String? name;
  final double? rating;

  RestaurantDetail({
    this.address,
    this.categories,
    this.city,
    this.customerReviews,
    this.description,
    this.image,
    this.menus,
    this.name,
    this.rating,
  });

  factory RestaurantDetail.fromJson(restaurant) {
    const imageUrl = 'https://restaurant-api.dicoding.dev/images/medium/';
    final categories =
        restaurant['categories'].map((category) => category['name']).toList();
    final customerReviews = restaurant['customerReviews']
        .map((review) => Review(
              date: review['date'],
              name: review['name'],
              review: review['review'],
            ))
        .toList();
    final menus = Menus(
      foods: restaurant['menus']['foods'].map((food) => food['name']).toList(),
      drinks:
          restaurant['menus']['drinks'].map((drink) => drink['name']).toList(),
    );

    return RestaurantDetail(
      address: restaurant['address'],
      categories: categories,
      city: restaurant['city'],
      customerReviews: customerReviews,
      description: restaurant['description'],
      image: imageUrl + restaurant['pictureId'],
      menus: menus,
      name: restaurant['name'],
      rating: (restaurant['rating'] as num).toDouble(),
    );
  }
}
