import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cats_tinder/domain/service/cats_service.dart';
import 'package:cats_tinder/features/cats/cats_state.dart';

class CatsCubit extends Cubit<CatsState> {
  CatsCubit() : super(CatsInitial());

  final _service = CatsService();

  Future<void> getFavourites() async {
    try {
      emit(CatsLoading());
      final cats = await _service.getFavoritesCats();
      emit(
        FavouritesData(cats: cats),
      );
    } catch (e) {
      emit(
        CatsError(error: e.toString()),
      );
    }
  }

  Future<void> getCat() async {
    try {
      emit(CatsLoading());
      final cat = await _service.getCat();
      emit(
        CatData(cat: cat),
      );
    } catch (e) {
      emit(
        CatsError(error: e.toString()),
      );
    }
  }
}