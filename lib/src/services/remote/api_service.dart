import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:starter_app/src/base/utils/constants.dart';
import 'package:starter_app/src/models/user.dart';
import 'package:starter_app/src/services/remote/api_client.dart';
import 'package:starter_app/src/services/remote/api_result.dart';
import 'package:starter_app/src/services/remote/interseptor/main_interceptor.dart';
import 'package:starter_app/src/services/remote/network_exceptions.dart';

class ApiService {
  ApiClient? _apiClient;
  ApiClient? _apiMainClient;

  ApiService() {
    _apiClient = ApiClient(Dio());
    _apiMainClient = ApiClient(Dio(), interceptors: [MainApiInterceptor()]);
  }

  Future<ApiResult<UserModel>?> userLogin(
      String email, String password, BuildContext context) async {
    try {
      var response = await _apiClient?.postReq(
        "/users/login",
        data: {"email": email, "password": password},
      );
      if (response!.statusCode != 200) {
        Constants.customWarningSnack(response.message.toString());
        return null;
      }
      return ApiResult.success(data: UserModel.fromJson(response.data));
    } catch (e) {
      Constants.customWarningSnack(
          NetworkExceptions.getDioExceptionMessage(e).toString());
      return ApiResult.failure(error: NetworkExceptions.getDioException(e)!);
    }
  }
}
