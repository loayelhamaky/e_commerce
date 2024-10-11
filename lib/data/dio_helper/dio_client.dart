import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    };
  }

  Future<Response> getRequest(String url) async {
    try {
      final response = await _dio.get(url);
      return response;
    } catch (e) {
      print("Error: $e");
      rethrow;
    }
  }
}
