import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

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
      final url = 'https://mrinvito.com/laravel/easylife/api/userlogin';
      Map<String, dynamic> map = {};

      if (isMobile) {
        map = {"mobileno": username, "password": password};
      } else {
        map = {"email": username, "password": password};
      }
      print(map);
      response = await _dio.post(
        url,
        data: FormData.fromMap(map),
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }, responseType: ResponseType.json),
      );

      print(response.statusCode);
      print(response.data);
      Map<String, dynamic> data = jsonDecode(response.data);

      if (response.statusCode == 200) {
        resSuccess = data['status'];

        message = data['message'].toString();

        if (resSuccess && message.contains("login successful")) {
          print(response.data);
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
      print(e);
      errorCallBack(e.toString());
    }
  }
}