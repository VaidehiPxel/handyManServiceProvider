import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

typedef SignUpSuccess = void Function(bool isSuccess, String msg);
typedef AppErrorCallBack = void Function(String appError);

class SignUpService {
  final Dio _dio;

  SignUpService({Dio? dio}) : _dio = dio ?? Dio();

  Future<void> singUp(
      {
        required String firstName,
        required String lastName,
        required String mobileNo,
        required String email,
        required String password,
        required String confirmPassword,
        required AppErrorCallBack errorCallBack,
        required SignUpSuccess signUpSuccess}) async {
    try {
      bool resSuccess = false;
      String message = '', errorCode = '';
      Response? response;
      final url = 'https://mrinvito.com/laravel/easylife/api/serviceprovidersignup';
      Map<String, dynamic> map = {
        "firstname":firstName,
        "lastname":lastName,
        "mobileno": mobileNo,
        "email": email,
        "password": password,
        "confirmpassword": confirmPassword
      };

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

        if (resSuccess &&
            data["isNewUser"] &&
            message.contains("registration successful")) {
          print(response.data);
          signUpSuccess(true, "");
        }
        if (resSuccess &&
            !data["isNewUser"] &&
            message.contains("User Details already exists")) {
          signUpSuccess(false, "User Details already exists");
        } else if (resSuccess) {
          errorCallBack(message);
        }
      }
    } catch (e) {
      print(e);
      errorCallBack(e.toString());
    }
  }
}