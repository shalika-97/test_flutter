import 'package:dio/dio.dart';
import 'package:test_new/corona_result.dart';

class CoronaController {
  Dio _dio = Dio();

  Future<CoronaResult> getCoronDetails() async {
    final response =
        await _dio.get("https://hpb.health.gov.lk/api/get-current-statistical");
    print(response.statusCode);
    return CoronaResult.fromJson(response.data);
  }
}
