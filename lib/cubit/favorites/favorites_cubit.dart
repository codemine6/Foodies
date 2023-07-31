import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies/cubit/favorites/favorites_state.dart';
import 'package:foodies/data/services.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

  void getFavorites() async {
    try {
      emit(FavoritesLoading());
      final favorites = await Services().getFavorites();
      emit(FavoritesLoaded(favorites: favorites));
    } catch (_) {
      emit(FavoritesFailure());
    }
  }
}
