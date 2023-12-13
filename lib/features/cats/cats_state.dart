import 'package:cats_tinder/domain/model/cats_model.dart';

sealed class CatsState {}

final class CatsBuildState extends CatsState {}

final class CatsListenState extends CatsState {}

final class CatsInitial extends CatsBuildState {}

final class CatsLoading extends CatsBuildState {}

final class CatsError extends CatsListenState {
  final String error;

  CatsError({required this.error});
}

final class FavouritesData extends CatsBuildState {
  final List<CatsModel> cats;

  FavouritesData({required this.cats});
}

final class CatData extends CatsBuildState {
  final List<CatsModel> cat;

  CatData({required this.cat});
}