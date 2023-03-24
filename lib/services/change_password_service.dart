import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_projects/_core/constants/hive_constant.dart';
import 'package:flutter_projects/services/base_service.dart';


typedef ChangePasswordSuccess = void Function();
typedef AppErrorCallBack = void Function(String appError);

class ChangePasswordService {
  final Dio _dio;

  ChangePasswordService({Dio? dio}) : _dio = dio ?? Dio();

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
    required AppErrorCallBack errorCallBack,
    required ChangePasswordSuccess changePasswordSuccess,
  }) async {
    try {
      String userId = HiveConstants.instances.box1.get(HiveConstants.userIdKey);
      bool resSuccess = false;
      String message = '', errorCode = '';
      Response? response;

      print({"user_id": userId});

      print({
        'oldpassword': oldPassword,
        'newpassword': newPassword,
        'confirmpassword': newPassword,
        'user_id': userId
      });

      FormData formData = FormData.fromMap({
        'oldpassword': oldPassword,
        'newpassword': newPassword,
        'confirmpassword': newPassword,
        'user_id': userId
      });

      response = await _dio.post(
        data: formData,
        URL.userChangePassword,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }, responseType: ResponseType.json),
      );

      print(response.statusCode);
      print(response.data);
      Map<String, dynamic> data = jsonDecode(response.data);

      if (response.statusCode == 200) {
        resSuccess = data['status'].toString().compareTo("1") == 0;

        message = data['message'].toString();

        if (resSuccess &&
            message.compareTo("User Password has been updated successfully") ==
                0) {
          changePasswordSuccess();
        } else if (!resSuccess) {
          errorCallBack(message);
        }
      }
    } catch (e) {
      // print(e);
      if (e is DioError) {
        print(e.message);
        print(e.error);
        print(e.response);
      }
      errorCallBack(e.toString());
    }
  }
}
