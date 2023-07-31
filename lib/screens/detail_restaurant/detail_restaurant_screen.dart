import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies/cubit/restaurant/restaurant_cubit.dart';
import 'package:foodies/cubit/restaurant/restaurant_state.dart';
import 'package:foodies/data/models/review.dart';
import 'package:foodies/data/services.dart';
import 'package:foodies/screens/detail_restaurant/widgets/restaurant_categories.dart';
import 'package:foodies/screens/detail_restaurant/widgets/restaurant_detail_shimmer.dart';
import 'package:foodies/screens/detail_restaurant/widgets/restaurant_image.dart';
import 'package:foodies/screens/detail_restaurant/widgets/restaurant_location.dart';
import 'package:foodies/screens/detail_restaurant/widgets/restaurant_menus.dart';
import 'package:foodies/screens/detail_restaurant/widgets/restaurant_tabs.dart';
import 'package:foodies/screens/detail_restaurant/widgets/review_form.dart';
import 'package:foodies/screens/detail_restaurant/widgets/review_item.dart';
import 'package:foodies/screens/widgets/custom_alert.dart';
import 'package:ionicons/ionicons.dart';

class DetailRestaurantScreen extends StatefulWidget {
  final String restaurantId;

  const DetailRestaurantScreen({super.key, required this.restaurantId});

  @override
  State<DetailRestaurantScreen> createState() => _DetailRestaurantScreenState();
}

class _DetailRestaurantScreenState extends State<DetailRestaurantScreen> {
  var isFavorited = false;
  var tabIndex = 0;
  var showForm = false;

  @override
  void initState() {
    context.read<RestaurantCubit>().getRestaurantDetail(widget.restaurantId);
    Services().isFavorited(widget.restaurantId).then((value) {
      setState(() {
        isFavorited = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RestaurantCubit, RestaurantState>(
      builder: (context, state) {
        if (state is RestaurantLoaded) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                RestaurantImage(image: state.restaurant.image!),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${state.restaurant.name}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            InkWell(
                              child: Icon(
                                isFavorited
                                    ? Ionicons.heart
                                    : Ionicons.heart_outline,
                                size: 32,
                                color: Theme.of(context).primaryColor,
                              ),
                              onTap: () {
                                if (isFavorited) {
                                  Services()
                                      .removeFavorite(widget.restaurantId);
                                } else {
                                  Services().addFavorite(widget.restaurantId);
                                }
                                setState(() {
                                  isFavorited = !isFavorited;
                                });
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(isFavorited
                                      ? 'Added to favorites!'
                                      : 'Removed from favorites!'),
                                ));
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        RestaurantCategories(
                            categories: state.restaurant.categories!),
                        const SizedBox(height: 24),
                        RestaurantLocation(
                          address: state.restaurant.address!,
                          city: state.restaurant.city!,
                          rating: state.restaurant.rating!,
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${state.restaurant.description}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
                RestaurantTabs(
                  tabIndex: tabIndex,
                  setTabIndex: (tab) {
                    setState(() {
                      tabIndex = tab;
                    });
                  },
                ),
                if (tabIndex == 1)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: InkWell(
                        child: Row(
                          children: [
                            Icon(
                              Ionicons.add,
                              color: Theme.of(context).primaryColor,
                            ),
                            Text(
                              'Add Review',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            showForm = !showForm;
                          });
                        },
                      ),
                    ),
                  ),
                if (tabIndex == 1 && showForm)
                  ReviewForm(
                    onSubmit: (name, review) {
                      Services()
                          .addReview(Review(
                        id: widget.restaurantId,
                        name: name,
                        review: review,
                      ))
                          .then((_) {
                        context
                            .read<RestaurantCubit>()
                            .getRestaurantDetail(widget.restaurantId);
                        setState(() {
                          showForm = false;
                        });
                      });
                    },
                  ),
                if (tabIndex == 0)
                  RestaurantMenus(menus: state.restaurant.menus!)
                else
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return ReviewItem(
                            review: state.restaurant.customerReviews![index]);
                      },
                      childCount: state.restaurant.customerReviews!.length,
                    ),
                  ),
                if (tabIndex == 1)
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 16),
                  ),
              ],
            ),
          );
        } else {
          return const Scaffold(
            body: RestaurantDetailShimmer(),
          );
        }
      },
      listener: (context, state) {
        if (state is RestaurantFailure) {
          showDialog(
            context: context,
            builder: (context) => const CustomAlert(),
          );
        }
      },
    );
  }
}
