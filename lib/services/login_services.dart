import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_projects/services/base_service.dart';

typedef LoginSuccess = void Function(bool isSuccess, String msg);
typedef AppErrorCallBack = void Function(String appError);

class LoginService {
  final Dio _dio;

  LoginService({Dio? dio}) : _dio = dio ?? Dio();

  Future<void> login(
      {required String username,
      required String password,
      required bool isMobile,
      required AppErrorCallBack errorCallBack,
      required LoginSuccess loginSuccess}) async {
    try {
      bool resSuccess = false;
      String message = '', errorCode = '';
      Response? response;

      Map<String, dynamic> map = {};

      if (isMobile) {
        map = {"mobileno": username, "password": password};
      } else {
        map = {"email": username, "password": password};
      }
      response = await _dio.post(
        URL.loginUrl,
        data: FormData.fromMap(map),
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }, responseType: ResponseType.json),
      );
      Map<String, dynamic> data = jsonDecode(response.data);

      if (response.statusCode == 200) {
        resSuccess = data['status'];
        message = data['message'].toString();

        if (resSuccess && message.contains("login successful")) {
          loginSuccess(true, "");
        }
        if (resSuccess &&
            data["isNewUser"] &&
            message.contains("user not register! please make registration")) {
          loginSuccess(false, "user not register! please make registration");
        } else if (resSuccess &&
            !message.contains("login successful") &&
            !message.contains("user not register! please make registration")) {
          errorCallBack(message);
        }
      }
    } catch (e) {
      errorCallBack(e.toString());
    }
  }
}
