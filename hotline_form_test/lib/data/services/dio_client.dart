import 'package:dio/dio.dart';

class DioClient {

  static final endPoint = 'https://example.com/api/submit';
  static final Dio client = Dio();

  static Future<String?> submitForm(String path, Map<String, dynamic> formData) async {

    String result = '';

    try {
      final Response response = await client.post(
        path,
        data: formData,
      );

      if (response.statusCode == 200) {
        result = 'Форма успішно відправлена';
      }
      else {
        result = 'Помилка відправки форми - ${response.statusCode}, ${response.statusMessage}';
      }

    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        result = 'Помилка з\'єднання - Таймаут';
      }
      else if (e.type == DioExceptionType.badResponse) {
        result = 'Помилка сервера - ${e.response?.statusCode}, ${e.response?.statusMessage}';
      }
    }

    await Future.delayed(Duration(seconds: 3), () {
      return null;
    });

  }

}



