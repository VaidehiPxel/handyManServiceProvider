import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_projects/model/jobs/bid_model.dart';

import 'package:http/http.dart' as http;

import 'package:flutter_projects/model/jobs/job_detail_model.dart';
import 'package:flutter_projects/services/base_service.dart';

typedef JobDetailData = void Function(GetJobDetailModel jobDetailModel);
typedef BidUpdate = void Function(bool isUpdate, String msg);
typedef AppErrorCallBack = void Function(String appError);

class JobDetailService {
  final Dio _dio;

  JobDetailService({Dio? dio}) : _dio = dio ?? Dio();

  Future<void> jobDetail(
      {required AppErrorCallBack errorCallBack,
      required int jobId,
      required JobDetailData jobDetailData}) async {
    try {
      bool resSuccess = false;
      String message = '';
      Response? response;
      GetJobDetailModel jobDetailModel;

      Map<String, dynamic> map = {};

      map = {
        "job_id": jobId,
      };

      response = await _dio.post(
        URL.jobDetailUrl,
        data: FormData.fromMap(map),
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }, responseType: ResponseType.json),
      );

      Map<String, dynamic> data = jsonDecode(response.data);

      if (response.statusCode == 200) {
        resSuccess = data['status'].toString().compareTo("1") == 0;
        message = data['message'].toString();

        if (resSuccess && message.compareTo("Get Job Details") == 0) {
          jobDetailModel = GetJobDetailModel.fromJson(data);
          jobDetailData(jobDetailModel);
        } else if (resSuccess) {
          errorCallBack(message);
        }
      }
    } catch (e) {
      errorCallBack(e.toString());
    }
  }

  Future<void> bidUpdate(
      {required AppErrorCallBack errorCallBack,
      required int jobId,
      required int userId,
      required String amount,
      required bool isApplied,
      required BidUpdate bidUpdate}) async {
    try {
      Map<String, dynamic> map = {};

      map = {
        'jobid': jobId.toString(),
        'user_id': userId.toString(),
        'amount': amount,
      };

      var client = http.Client();

      http.Response response = await client.post(
        Uri.parse(isApplied ? URL.bidAppliedUrl : URL.bidUpdateUrl),
        body: map,
      );
      print(response.body);
      print(MyBidModel.fromJson(json.decode(response.body)));
      var data = MyBidModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        if (data.status.toString().compareTo("1") == 0) {
          bidUpdate(isApplied ? true : false, "");
        } else {
          errorCallBack(data.message);
        }
      }
    } catch (e) {
      print(e);
      errorCallBack(e.toString());
    }
  }

  Future<void> bidRemove(
      {required AppErrorCallBack errorCallBack,
      required int jobId,
      required int userId,
      required BidUpdate bidUpdate}) async {
    try {
      bool resSuccess = false;
      String message = '';

      Map<String, String> map = {};

      map = {
        "job_id": jobId.toString(),
        "user_id": userId.toString(),
      };

      var client = http.Client();

      http.Response response = await client.post(
        Uri.parse(URL.bidRemoveUrl),
        body: map,
      );

      Map<String, dynamic> data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        resSuccess = data['status'].toString().compareTo("1") == 0;
        message = data['message'].toString();

        if (resSuccess &&
            message.compareTo("Removed the bid by the service provider") == 0) {
          bidUpdate(true, "");
        } else if (resSuccess) {
          errorCallBack(message);
        }
      }
    } catch (e) {
      errorCallBack(e.toString());
    }
  }
}
