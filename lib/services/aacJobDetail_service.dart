import 'dart:convert';

import 'package:flutter_projects/services/base_service.dart';
import 'package:http/http.dart' as http;

typedef JobStart = void Function(bool isStart, String msg);
typedef JobComplete = void Function(bool isComplete, String msg);
typedef AppErrorCallBack = void Function(String appError);

class AACJobDetailService {
  AACJobDetailService();

  Future<void> jobStart(
      {required AppErrorCallBack errorCallBack,
      required int jobId,
      required JobStart jobStart}) async {
    try {
      Map<String, String> headers = {'Content-Type': 'application/json'};

      var client = http.Client();

      http.Response response = await client
          .get(Uri.parse(URL.jobStart + jobId.toString()), headers: headers);
      print(response.body);

      Map<String, dynamic> data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (data["status"].toString().compareTo("1") == 0) {
          jobStart(true, "");
        } else {
          errorCallBack(data['message'].toString());
        }
      }
    } catch (e) {
      print(e);
      errorCallBack(e.toString());
    }
  }

  Future<void> jobComplete(
      {required AppErrorCallBack errorCallBack,
      required int jobId,
      required int timecounter,
      required bool isExtraWork,
      String? esTitle,
      int? esTime,
      int? esAmount,
      required int totalAmount,
      required JobComplete jobComplete}) async {
    try {
      Map<String, dynamic> map = {};

      map = isExtraWork
          ? {
              'job_id': jobId.toString(),
              'timecounter': timecounter,
              'jobstatus': '3',
              'extrawork': 'Y',
              'extraservice': esTitle,
              'approxtime': esTime,
              'extraserviceamount': esAmount,
              'amount': totalAmount
            }
          : {
              'job_id': jobId.toString(),
              'timecounter': timecounter,
              'jobstatus': '3',
              'extrawork': 'N',
              'amount': totalAmount
            };
      Map<String, String> headers = {'Content-Type': 'application/json'};

      var client = http.Client();

      http.Response response = await client.post(Uri.parse(URL.jobComplete),
          body: json.encode(map), headers: headers);
      print(response.body);

      Map<String, dynamic> data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (data["status"].toString().compareTo("1") == 0) {
          jobComplete(true, "");
        } else {
          errorCallBack(data['message'].toString());
        }
      }
    } catch (e) {
      print(e);
      errorCallBack(e.toString());
    }
  }
}
