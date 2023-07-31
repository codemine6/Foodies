class Restaurant {
  final String? id;
  final String? city;
  final String? image;
  final String? name;
  final double? rating;

  Restaurant({
    this.id,
    this.city,
    this.image,
    this.name,
    this.rating,
  });

  factory Restaurant.fromJson(restaurant) {
    const imageUrl = 'https://restaurant-api.dicoding.dev/images/medium/';

    return Restaurant(
      id: restaurant['id'],
      city: restaurant['city'],
      image: imageUrl + restaurant['pictureId'],
      name: restaurant['name'],
      rating: (restaurant['rating'] as num).toDouble(),
    );
  }
}
