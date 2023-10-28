import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:products/features/home/data/model/product_model.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  List<Products>favorites=[];
  bool isFavorite(Products model)
  {
    model.isFav=!model.isFav;
    if(model.isFav)
      {
        favorites.add(model);
      }
    else
      {
        favorites.remove(model);
      }
    emit(AddToFavoriteSuccess());

    return model.isFav;
  }
  void removeFromFavorite(Products model)
  {
    model.isFav=false;
    favorites.remove(model);
        emit(RemovedFromFavoriteSuccess());

  }
}
