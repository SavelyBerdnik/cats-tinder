import 'package:cats_tinder/data/model/cats_dto.dart';

class CatsModel {
  final List breeds;
  final String id;
  final String url;
  final int width;
  final int height;

  CatsModel({
    required this.breeds,
    required this.id,
    required this.url,
    required this.width,
    required this.height,
  });

  factory CatsModel.fromDto(CatsDTO dto) => CatsModel(
    breeds: dto.breeds,
    id: dto.id,
    url: dto.url,
    width: dto.width,
    height: dto.height,
  );
}