import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();
  final String baseUrl = "https://liot4ik.requestcatcher.com/test"; // Ваш URL для RequestCatcher

  Future<Response> login(String email, String password) async {
    try {
      final response = await _dio.post(
        baseUrl, // Відправка на основний endpoint
        data: {
          'email': email,
          'password': password,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded', // Вказуємо тип контенту
          },
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> register(String name, String email, String password) async {
    try {
      final response = await _dio.post(
        baseUrl, // Відправка на основний endpoint
        data: {
          'name': name,
          'email': email,
          'password': password,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded', // Вказуємо тип контенту
          },
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> resetPassword(String email) async {
    try {
      final response = await _dio.post(
        baseUrl, // Відправка на основний endpoint
        data: {
          'email': email,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
