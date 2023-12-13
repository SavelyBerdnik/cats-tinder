import 'package:cats_tinder/data/repository/cats_repository.dart';
import 'package:cats_tinder/domain/model/cats_model.dart';

class CatsService {
  final _repository = CatsRepository();

  Future<List<CatsModel>> getFavoritesCats() async {
    final list = await _repository.getFavoritesCats();
    if (list == null) return [];
    return list.map((e) => CatsModel.fromDto(e)).toList();
  }
  Future<List<CatsModel>> getCat() async {
    final list = await _repository.getCat();
    if (list == null) return [];
    return list.map((e) => CatsModel.fromDto(e)).toList();
  }
}