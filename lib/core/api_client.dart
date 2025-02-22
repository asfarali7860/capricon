import 'package:capricon/core/constant.dart';
import 'package:capricon/core/exception.dart';
import 'package:capricon/core/interceptor/auth_interceptor.dart';
import 'package:capricon/core/interceptor/response_interceptor.dart';
import 'package:capricon/utils/utils.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio = Dio();
  late final Ref ref;

  ApiClient(this.ref) {
    dio.options.connectTimeout = const Duration(minutes: 10);
    dio.options.receiveTimeout = const Duration(minutes: 10);
    dio.interceptors.add(AuthInterceptor(ref));
    dio.interceptors.add(ResponseInterceptor());
  }

  Future<Response> post(String path, dynamic data,
      {bool addCookies = false, bool sendCookies = false}) async {
    try {
      Logger.printError("${AppConstants.baseUrl}/$path $data");
      return await dio.post("${AppConstants.baseUrl}/$path",
          data: data,
      );
    } on DioException catch (e) {
      Logger.write(e.message.toString());
      throw ApiException(e.response!.data["message"].toString());
    }
  }

  Future<Response> get(String path, {bool sendCookies = false, Map<String, dynamic>? queryParams}) async {
    try {
      return await dio.get("${AppConstants.baseUrl}/$path",
        queryParameters: queryParams,
      );
    } on DioException catch (e) {
      Logger.write(e.message.toString());
      throw ApiException(e.response!.data["message"].toString());
    }
  }
}