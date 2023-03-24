import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_projects/_core/constants/hive_constant.dart';
import 'package:flutter_projects/model/home/dashboard_model.dart';
import 'package:flutter_projects/services/base_service.dart';
import 'package:http/http.dart' as http;

typedef DashboardData = void Function(DashboardModel dashboardModel);
typedef AppErrorCallBack = void Function(String appError);

class DashboardService {
  Future<void> getDashboardData(
      {required AppErrorCallBack errorCallBack,
      required DashboardData dashboardData}) async {
    try {
      bool resSuccess = false;
      String message = '';
      DashboardModel dashboardModel;
      int userId = HiveConstants.instances.box1.get(HiveConstants.userIdKey);
      print("userId");
      print(userId);
      var client = http.Client();

      http.Response response = await client.get(
        Uri.parse("${URL.dashboardUrl}$userId"),
      );

      Map<String, dynamic> data =
          Map<String, dynamic>.from(json.decode(response.body));
      print(response.body);
      if (response.statusCode == 200) {
        resSuccess = data['status'].toString().compareTo("1") == 0;
        message = data['message'].toString();

        if (resSuccess &&
            message.compareTo("Dashboard Details get Successfull") == 0) {
          print("kkk");
          dashboardModel = DashboardModel.fromJson(data);
          dashboardData(dashboardModel);
          HiveConstants.instances.box1.put(HiveConstants.userNameKey,
              data['usersdetails']['name'] + data['usersdetails']['lastname']);
          HiveConstants.instances.box1
              .put(HiveConstants.userEmailKey, data['usersdetails']['email']);
          HiveConstants.instances.box1.put(HiveConstants.userProfileKey,
              data['usersdetails']['profilepics']);
        } else if (resSuccess) {
          errorCallBack(message);
        } else {
          print("hhhh");
          errorCallBack(message);
        }
      } else {
        errorCallBack(message);
      }
    } catch (e) {
      print(e);
      errorCallBack(e.toString());
    }
  }
}
