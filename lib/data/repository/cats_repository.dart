import 'package:dio/dio.dart';
import 'package:cats_tinder/data/model/cats_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CatsRepository {
  static const host = 'https://api.thecatapi.com';
  static const apiKey = 'live_dU5XYI4z6VtZGO6hxmEu3NjxooRD94PxzINIVnzaN8bQP2KRTbnZaUp9FJz73xq6';
  final dio = Dio();

  Future<List<CatsDTO>?> getCat() async {
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

  Future<List<CatsDTO>?> getFavoritesCats() async {
    // final perfs = await SharedPreferences.getInstance();
    // final data = perfs.getStringList('cats') as List<dynamic>;
    final response = await dio.get(
        '$host/v1/images/search?',
        queryParameters: {'api_key': apiKey, 'limit': 10});
    final data = response.data as List<dynamic>;

    final cats = data.isNotEmpty ? data : null;

    if (cats == null){
      return null;
    }

    if (cats is Map<String, dynamic>) {
      return (data.cast<Map<String, dynamic>>()).map((e) => CatsDTO.fromJson(e)).toList();
    }

    return null;
  }
}