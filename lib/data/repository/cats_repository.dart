import 'package:dio/dio.dart';
import 'package:cats_tinder/data/model/cats_dto.dart';

class CatsRepository {
  static const host = 'https://api.thecatapi.com';
  static const apiKey = 'live_dU5XYI4z6VtZGO6hxmEu3NjxooRD94PxzINIVnzaN8bQP2KRTbnZaUp9FJz73xq6';
  final dio = Dio();

  Future<List<CatsDTO>?> getCats() async {
    final response = await dio.get(
        '$host/v1/images/search?',
        queryParameters: {'api_key': apiKey});
    final data = response.data as List<dynamic>;

    final cat = data.isNotEmpty ? data : null;

    if (cat == null){
      return null;
    }

    if (cat is Map<String, dynamic>) {
      return (data.cast<Map<String, dynamic>>()).map((e) => CatsDTO.fromJson(e)).toList();
    }

    return null;
  }
}