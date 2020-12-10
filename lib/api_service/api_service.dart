import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:unsplash_gallery_app/models/unsplash_image.dart';

class ApiService {
  ApiService._privateConstructor();

  static final ApiService instance = ApiService._privateConstructor();

  Future<List<UnsplashImage>> fetchData(int page, [int perPage = 10]) async {
    final url =
        "https://api.unsplash.com/photos?page=$page&per_page=$perPage&client_id=xfDU5Cjq7ZBjsWGp0_OQNH1PJfLPm6PnUjb-AJVLMTE";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final map = json.decode(response.body) as List<dynamic>;
      return [for (var item in map) UnsplashImage(item)];
    }
  }

}
