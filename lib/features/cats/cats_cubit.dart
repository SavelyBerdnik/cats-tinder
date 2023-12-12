import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cats_tinder/domain/service/cats_service.dart';
import 'package:cats_tinder/features/cats/cats_state.dart';

class CatsCubit extends Cubit<CatsState> {
  CatsCubit() : super(CatsInitial());

  final _service = CatsService();

  Future<void> getData() async {
    try {
      emit(CatsLoading());
      final cats = await _service.getCats();
      emit(
        CatsData(cats: cats),
      );
    } catch (e) {
      emit(
        CatsError(error: e.toString()),
      );
    }
  }
}