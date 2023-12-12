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

final class CatsData extends CatsBuildState {
  final List<CatsModel> cats;

  CatsData({required this.cats});
}