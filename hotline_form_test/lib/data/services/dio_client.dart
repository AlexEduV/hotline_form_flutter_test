import 'package:dio/dio.dart';

class DioClient {

  static final endPoint = 'https://example.com/api/submit';
  static final Dio client = Dio();

  static Future<String?> sendRequest(String path) async {

    try {
      //todo: put extras (name, email, phone) into the request
      client.post(path);
    } catch(e) {

    }

    Future.delayed(Duration(seconds: 3), () {
      return null;
    });

  }

}



