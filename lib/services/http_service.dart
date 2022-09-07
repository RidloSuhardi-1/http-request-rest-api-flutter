import 'dart:io';

import 'package:http/http.dart' as http;

class HttpService {
  final String _apiKey = '206106649b23a35eec71e748afc2581a';
  final String _baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future<String?> getPopularMovies() async {
    final String uri = _baseUrl + _apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      String response = result.body;
      return response;
    } else {
      print("Fail");
      return null;
    }
  }
}
