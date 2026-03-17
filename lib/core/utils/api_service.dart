import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;

  // ضع المفتاح هنا ليكون متاحاً لكل الـ requests
  final String _apiKey = "AIzaSyCrsdJ2R-s-aJzKlb2vFCOPNCQJQKm5UDQ";

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    // نقوم بإضافة المفتاح لكل رابط يطلبه الـ Repository
    var response = await _dio.get('$_baseUrl$endpoint&key=$_apiKey');
   // print(response.data);
    return response.data;

  }
}
