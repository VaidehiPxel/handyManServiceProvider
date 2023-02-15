import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_projects/services/base_service.dart';

typedef TermsConditionServiceSuccess = void Function(String description);
typedef AppErrorCallBack = void Function(String appError);

class TermsConditionService {
  final Dio _dio;

  TermsConditionService({Dio? dio}) : _dio = dio ?? Dio();

  Future<void> getTAndC(
      {required AppErrorCallBack errorCallBack,
      required TermsConditionServiceSuccess
          termsConditionServiceSuccess}) async {
    try {
      bool resSuccess = false;
      String message = '';
      Response? response;
      String description = "";

      response = await _dio.get(
        URL.termsUrl,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }, responseType: ResponseType.json),
      );

      Map<String, dynamic> data = jsonDecode(response.data);

      if (response.statusCode == 200) {
        resSuccess = data['status'].toString().compareTo("1") == 0;

        message = data['message'].toString();

        if (resSuccess &&
            message.compareTo("terms and condition details Get Successfull") ==
                0) {
          for (var r in data["result"]) {
            description = r["description"];
          }
          termsConditionServiceSuccess(description);
        } else if (resSuccess) {
          errorCallBack(message);
        }
      }
    } catch (e) {
      errorCallBack(e.toString());
    }
  }
}
