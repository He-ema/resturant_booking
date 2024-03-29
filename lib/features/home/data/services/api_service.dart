import 'package:dio/dio.dart';

class ApiService {
  String baseUrl =
      'https://the-fork-the-spoon.p.rapidapi.com/restaurants/v2/list';

  final Dio _dio;

  ApiService(this._dio);

  Future<dynamic> get() async {
    var response = await _dio.get(
      baseUrl,
      queryParameters: {
        'queryPlaceValueCityId': '348156',
        'pageSize': '10',
        'pageNumber': '1'
      },
      options: Options(
        headers: {
          'X-RapidAPI-Key':
              '229abfe9cbmsh5d68b54532908eap192ab2jsnd73d04c64082',
          'X-RapidAPI-Host': 'the-fork-the-spoon.p.rapidapi.com'
        },
      ),
    );
    return response.data;
  }
}
