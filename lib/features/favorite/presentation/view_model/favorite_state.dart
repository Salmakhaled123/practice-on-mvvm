part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}
class AddToFavoriteSuccess extends FavoriteState{}
class RemovedFromFavoriteSuccess extends FavoriteState{}
