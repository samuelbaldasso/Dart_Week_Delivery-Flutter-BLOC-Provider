import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:dw_delivery_flutter/app/core/config/rest_client/auth_interceptor.dart';

import '../env/env.dart';

class CustomDio extends DioForNative {
  late AuthInterceptor _authInterceptor;
  CustomDio()
      : super(BaseOptions(
          baseUrl: Env.i['backend_base_url'] ?? '',
          connectTimeout: 5000,
          receiveTimeout: 60000,
        )) {
    interceptors.add(LogInterceptor(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true));
    _authInterceptor = AuthInterceptor();
  }

  CustomDio auth() {
    interceptors.add(_authInterceptor);
    return this;
  }

  CustomDio unauth() {
    interceptors.remove(_authInterceptor);
    return this;
  }
}
