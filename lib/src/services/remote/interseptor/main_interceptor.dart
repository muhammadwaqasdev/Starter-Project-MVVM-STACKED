import 'package:dio/dio.dart';
import 'package:starter_app/src/configs/app_setup.locator.dart';
import 'package:starter_app/src/services/local/auth_service.dart';

class MainApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var authService = locator<AuthService>();
    options.headers = {
      ...options.headers,
      "authorization": "Bearer ${authService.user?.token}"
    };
    super.onRequest(options, handler);
  }
}
