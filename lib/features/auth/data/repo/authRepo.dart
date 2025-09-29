import 'dart:developer';

import 'package:bookia/features/auth/data/models/request/auth_params.dart';
import 'package:bookia/features/auth/data/models/response/auth_response/auth_response.dart';
import 'package:bookia/services/api/api_endpoints.dart';
import 'package:bookia/services/api/dio_provider.dart';
import 'package:bookia/services/local/local_helper.dart';
import 'package:dio/dio.dart';

class Authrepo {
  static final Dio dio = Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl));

  static Future<bool> sendOtp(String email) async {
    try {
      final res = await dio.post("/forget-password", data: {"email": email});
      return res.statusCode == 200;
    } catch (e) {
      print('error : $e');
      return false;
    }
  }

  static Future<bool> verifyOtp(String email, String otp) async {
    try {
      final res = await dio.post(
        "/check-forget-password",
        data: {"email": email, "verify_code": otp},
      );
      return res.statusCode == 200;
    } catch (e) {
      print('error : $e');
      return false;
    }
  }

  static Future<bool> resetPassword(
    String otp,
    String pass,
    String confpass,
  ) async {
    try {
      final res = await dio.post(
        "/reset-password",
        data: {
          "verify_code": otp,
          "new_password": pass,
          "new_password_confirmation": confpass,
        },
      );
      return res.statusCode == 200;
    } catch (e) {
      print('$e');
      return false;
    }
  }

  static Future<AuthResponse?> login(AuthParams params) async {
    try {
      var resp = await DioProvider.post(
        endpoint: ApiEndpoints.login,
        data: params.toJson(),
      ); //call endpoit -> register
      if (resp.statusCode == 200) {
        var data = AuthResponse.fromJson(resp.data);
        await LocalHelper.setUserData(data.data);
        return data;
        //success and return userdata data as json
        // await LocalHelper.setUserData(data.data);
      } else {
        //error
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> register(AuthParams params) async {
    try {
      var resp = await DioProvider.post(
        endpoint: ApiEndpoints.register,
        data: params.toJson(),
      ); //call endpoit -> register
      if (resp.statusCode == 201) {
        var data = AuthResponse.fromJson(resp.data);
        await LocalHelper.setUserData(data.data);
        return data;
        //success and return userdata data as json
        // var data = AuthResponse.fromJson(resp.data);
      } else {
        //error
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
