import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_projects/model/faq/faq_model.dart';
import 'package:flutter_projects/services/base_service.dart';

typedef FaqSuccess = void Function(List<FaqModel> faq);
typedef AppErrorCallBack = void Function(String appError);

class FaqService {
  final Dio _dio;

  FaqService({Dio? dio}) : _dio = dio ?? Dio();

  Future<void> getFaqs(
      {required AppErrorCallBack errorCallBack,
      required FaqSuccess faqSuccess}) async {
    try {
      bool resSuccess = false;
      String message = '', errorCode = '';
      Response? response;
      List<FaqModel> faq = [];

      response = await _dio.get(
        URL.faqUrl,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }, responseType: ResponseType.json),
      );

      // print(response.statusCode);
      // print(response.data);
      Map<String, dynamic> data = jsonDecode(response.data);

      if (response.statusCode == 200) {
        resSuccess = data['status'].toString().compareTo("1") == 0;

        message = data['message'].toString();

        if (resSuccess) {
          for (var r in data["result"]) {
            // print(r);
            faq.add(FaqModel.fromMap(r));
          }
          print(faq.length);
          faqSuccess(faq);
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
