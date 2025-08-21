import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  final String _baseUrl = 'https://www.googleapis.com/books/v1/';
  ApiService({required this.dio});

  Future<Map<dynamic, String>> get({required String endPoints}) async {
    Response response = await dio.get('$_baseUrl$endPoints');
    return response.data;
  }
}
