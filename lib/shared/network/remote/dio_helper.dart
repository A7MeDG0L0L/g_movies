import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String? url,
    Map<String, dynamic>? query,
    String lang = 'en-US',
    String? token,
  }) async {
    return await dio!.get(
      url!,
      queryParameters: query,
    );
  }
}
