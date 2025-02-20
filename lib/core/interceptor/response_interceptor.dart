import 'dart:developer';

import 'package:dio/dio.dart';

class ResponseInterceptor extends Interceptor{

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    log(response.toString());
  }
}