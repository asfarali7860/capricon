import 'dart:developer';

import 'package:capricon/core/constant.dart';
import 'package:capricon/core/endpoints.dart';
import 'package:capricon/utils/utils.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  late final Ref ref;
  AuthInterceptor(this.ref);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.path.requiresBearerToken) {
      final accessToken = await getAccessToken();
      log("accessToken : $accessToken");
      options.headers['Authorization'] = 'Bearer ${accessToken ?? ""}';
      if (accessToken != null) {
        handler.next(options);
      } else {
        // ref.read(appStateNotifierProvider.notifier).unAuthenticate();
      }
    } else {
      handler.next(options);
    }
  }

  Future<String?> getAccessToken() async {
    final pref = await SharedPreferences.getInstance();
    final accessToken = pref.getString(KeyConstants.accessToken);
    return accessToken;
  }

  Future<bool> isAccessTokenExpired() async {
    final pref = await SharedPreferences.getInstance();
    final accessToken = pref.getString(KeyConstants.accessToken);
    if (accessToken == null || accessToken.isEmpty) {
      return true;
    } else {
      final DateTime expirationDate = JwtDecoder.getExpirationDate(accessToken);
      if (expirationDate.difference(DateTime.now()).isNegative) {
        return true;
      } else {
        return false;
      }
    }
  }
}
