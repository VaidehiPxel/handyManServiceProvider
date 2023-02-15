import 'dart:convert';

import 'package:flutter_projects/model/jobs/my_joblist_model.dart';
import 'package:flutter_projects/services/base_service.dart';
import 'package:http/http.dart' as http;

typedef MyJobData = void Function(List<Joblist> myJobListModel);
typedef AppErrorCallBack = void Function(String appError);

class MyJobService {
  MyJobService();

  Future<void> getJobList({
    required AppErrorCallBack errorCallBack,
    required MyJobData myJobData,
    required int userId,
    required String status,
  }) async {
    try {
      String message = '';

      Map<String, String> map = {};

      map = {
        "user_id": userId.toString(),
        "status": status,
      };

      var client = http.Client();

      http.Response response = await client.post(
        Uri.parse(URL.myJobListUrl),
        body: map,
      );

      var data = MyJobListModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        if (data.status.toString().compareTo("1") == 0) {
          myJobData(data.joblist);
        } else {
          errorCallBack(message);
        }
      }
    } catch (e) {
      errorCallBack(e.toString());
    }
  }
}
