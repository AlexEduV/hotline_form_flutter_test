import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

class DioClient {

  static final Dio client = Dio();
  static final dioAdapter = DioAdapter(dio: client);

  //endpoints
  static const endPoint = 'https://example.com/api/submit';

  static Future<String> submitForm(String path, Map<String, dynamic> formData) async {

    //mock api
    dioAdapter.onPost(
      endPoint,
      data: formData,
      (server) => server.reply(
        200,
        {'message': 'Success!'},
        delay: const Duration(seconds: 3),
      ),
    );

    try {
      final response = await client.post(
        path,
        data: formData,
      );

      if (response.statusCode == 200) {
        return 'Форма успішно відправлена';
      }
      else {
        return 'Помилка відправки форми - ${response.statusCode}, ${response.statusMessage}';
      }

    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return 'Помилка з\'єднання - Таймаут';
      }
      else if (e.type == DioExceptionType.badResponse) {
        return 'Помилка сервера - ${e.response?.statusCode}, ${e.response?.statusMessage}';
      }
    }

    return '';

  }

}
