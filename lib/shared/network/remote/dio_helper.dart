import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> qury,
  }) async {
    return await dio.get(url, queryParameters: qury);
  }
}



//https://newsapi.org/v2/top-headlines?country=eg&category=business&apikey=c7cfbee96c2f47d2a7b758fa87def9d4