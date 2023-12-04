
import 'package:dio/dio.dart';
import 'package:flutter_test_2/data/dataSource/dio/dio_client.dart';
import 'package:flutter_test_2/data/dataSource/exception/api_error_handler.dart';
import 'package:flutter_test_2/data/model/response/base/api_response.dart';
import 'package:flutter_test_2/util/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

double progressPercent = 0;

class VideoRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  VideoRepo({
    required this.dioClient,
    required this.sharedPreferences,
  });

  Future<ApiResponse> getVideo(int page) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get("${AppConstant.getVideo}page=$page");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }
}