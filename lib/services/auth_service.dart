import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_projects/_core/constants/app_constants.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:flutter_projects/services/base_service.dart';

typedef GetOTPSuccess = void Function(bool isSuccess, String msg);
typedef VerifyOTPSuccess = void Function(bool isSuccess, String msg);
typedef SetPasswordSucces = void Function(bool isSuccess, String msg);
typedef AppErrorCallBack = void Function(String appError);

class AuthService {
  final Dio _dio;

  AuthService({Dio? dio}) : _dio = dio ?? Dio();

  Future<void> getOTP(
      {required String mobileNo,
      required AppErrorCallBack errorCallBack,
      required GetOTPSuccess getOTPSuccess}) async {
    try {
      bool resSuccess = false;
      String message = '', errorCode = '';
      Response? response;

      Map<String, dynamic> map = {};

      map = {
        "mobileno": mobileNo,
      };

      response = await _dio.post(
        URL.getOTP,
        data: FormData.fromMap(map),
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }, responseType: ResponseType.json),
      );
      Map<String, dynamic> data = jsonDecode(response.data);

      if (response.statusCode == 200) {
        resSuccess = data['status'] == true;
        message = data['message'].toString();

        if (resSuccess && message.contains("OTP get & Generated")) {
          getOTPSuccess(true, "");
          box1.put(AppString.userOTPKey, data['userotpdetails'][0]['otp']);
        } else {
          errorCallBack(message);
        }
      }
    } catch (e) {
      errorCallBack(e.toString());
    }
  }

  Future<void> verifyOtp(
      {required String mobileNo,
      required String otp,
      required AppErrorCallBack errorCallBack,
      required VerifyOTPSuccess verifyOtpSuccess}) async {
    try {
      bool resSuccess = false;
      String message = '';
      Response? response;

      Map<String, dynamic> map = {};

      map = {
        "mobileno": mobileNo,
        "otp": otp,
      };

      response = await _dio.post(
        URL.verifyOtp,
        data: FormData.fromMap(map),
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }, responseType: ResponseType.json),
      );
      Map<String, dynamic> data = jsonDecode(response.data);

      if (response.statusCode == 200) {
        resSuccess = data['status'] == true;
        message = data['message'].toString();
        if (resSuccess && message.contains("OTP Validation Successfull")) {
          verifyOtpSuccess(true, "");
        } else {
          errorCallBack(message);
        }
      }
    } catch (e) {
      errorCallBack(e.toString());
    }
  }

  Future<void> setPassword(
      {required String mobileNo,
      required String password,
      required String confirmpassword,
      required AppErrorCallBack errorCallBack,
      required SetPasswordSucces setPasswordSuccess}) async {
    try {
      bool resSuccess = false;
      String message = '';
      Response? response;

      Map<String, dynamic> map = {};

      map = {
        "mobileno": mobileNo,
        "password": password,
        "confirmpassword": confirmpassword,
      };

      response = await _dio.post(
        URL.setPassword,
        data: FormData.fromMap(map),
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }, responseType: ResponseType.json),
      );
      Map<String, dynamic> data = jsonDecode(response.data);

      if (response.statusCode == 200) {
        resSuccess = data['status'] == true;
        message = data['message'].toString();
        if (resSuccess && message.contains("Change Password Successfull")) {
          setPasswordSuccess(true, "");
        } else {
          errorCallBack(message);
        }
      }
    } catch (e) {
      errorCallBack(e.toString());
    }
  }
}
