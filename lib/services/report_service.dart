import 'dart:convert';

import 'package:flutter_projects/_core/constants/hive_constant.dart';
import 'package:flutter_projects/model/report/report_listing_model.dart';
import 'package:flutter_projects/services/base_service.dart';
import 'package:http/http.dart' as http;

typedef ReportData = void Function(Getcomplaints getComplaintsModel);
typedef CreateReportData = void Function(bool isCreate);
typedef AppErrorCallBack = void Function(String appError);

class ReportService {
  Future<void> getComplaintList(
      {required AppErrorCallBack errorCallBack,
      required ReportData getComplaintsModel}) async {
    try {
      bool resSuccess = false;
      String message = '';

      var client = http.Client();

      http.Response response = await client.get(
        Uri.parse("${URL.complaintList}26"),
      );

      var data = GetComplaintsModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        if (data.status.toString().compareTo("1") == 0) {
          getComplaintsModel(data.getcomplaints);
        } else {
          errorCallBack(message);
        }
      }
    } catch (e) {
      print(e);
      errorCallBack(e.toString());
    }
  }

  Future<void> createComplaint({
    required AppErrorCallBack errorCallBack,
    required CreateReportData createReportData,
    required int userId,
    required int jobId,
    required String jobTitle,
    required String description,
  }) async {
    try {
      String message = '';

      var client = http.Client();
      Map<String, String> map = {};

      map = {
        'user_id': userId.toString(),
        'created_by': HiveConstants.instances.box1.get(HiveConstants.userIdKey),
        'job_id': jobId.toString(),
        'job_title': jobTitle.toString(),
        'complaints_desc': description.toString()
      };

      http.Response response =
          await client.post(Uri.parse(URL.createComplaint), body: map);

      Map<String, dynamic> data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (data['status'].toString().compareTo("1") == 0) {
          createReportData(true);
        } else {
          errorCallBack(message);
        }
      }
    } catch (e) {
      print(e);
      errorCallBack(e.toString());
    }
  }
}
