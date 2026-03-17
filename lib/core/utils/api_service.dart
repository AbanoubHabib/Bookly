import 'package:dio/dio.dart';


class ApiService {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;
  final String _apiKey = "AIzaSyCrsdJ2R-s-aJzKlb2vFCOPNCQJQKm5UDQ";

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await _dio.get(
      '$_baseUrl$endpoint',
      queryParameters: {
        'key': _apiKey, // إضافة المفتاح بشكل منظم
      },
    );
    return response.data;
  }
}
