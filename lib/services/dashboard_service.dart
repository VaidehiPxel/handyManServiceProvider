import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_projects/model/home/dashboard_model.dart';
import 'package:flutter_projects/services/base_service.dart';

typedef DashboardData = void Function(DashboardModel dashboardModel);
typedef AppErrorCallBack = void Function(String appError);

class DashboardService {
  final Dio _dio;

  DashboardService({Dio? dio}) : _dio = dio ?? Dio();

  Future<void> getDashboardData(
      {required AppErrorCallBack errorCallBack,
      required DashboardData dashboardData}) async {
    try {
      bool resSuccess = false;
      String message = '';
      Response? response;
      DashboardModel dashboardModel;

      response = await _dio.get(
        "${URL.dashboardUrl}26",
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

        if (resSuccess &&
            message.compareTo("Dashboard Details get Successfull") == 0) {
          dashboardModel = DashboardModel.fromJson(data);
          dashboardData(dashboardModel);
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
