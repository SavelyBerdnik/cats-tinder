import 'package:cats_tinder/data/repository/cats_repository.dart';
import 'package:cats_tinder/domain/model/cats_model.dart';

class CatsService {
  final _repository = CatsRepository();

  Future<List<CatsModel>> getCats() async {
    final list = await _repository.getCats();
    if (list == null) return [];
    return list.map((e) => CatsModel.fromDto(e)).toList();
  }
}