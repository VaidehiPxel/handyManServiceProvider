import 'dart:convert';
import 'package:flutter_projects/application/help/help_state.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_projects/services/base_service.dart';

typedef HelpSuccessValue = void Function(bool isSuccess, String msg);
typedef AppErrorCallBack = void Function(String appError);

class HelpService {
  Future<void> submitHelp(
      {required String firstName,
      required String lastName,
      required String email,
      required String mobilenumber,
      required String description,
      required AppErrorCallBack errorCallBack,
      required HelpSuccessValue helpSuccess}) async {
    try {
      String message = '';

      Map<String, dynamic> map = {};

      map = {
        "fname": firstName,
        "lname": lastName,
        "email": email,
        "mobno": mobilenumber,
        "description": description
      };
      var client = http.Client();

      http.Response response =
          await client.post(Uri.parse(URL.submitHelp), body: map);
      Map<String, dynamic> data = jsonDecode(response.body);
      message = data['message'].toString();
      if (response.statusCode == 200) {
        if (data["status"].toString().compareTo("1") == 0 &&
            message.contains("help detials save successful")) {
          helpSuccess(true, "");
        } else {
          helpSuccess(false, message);
        }
      } else {
        errorCallBack(message);
      }
    } catch (e) {
      errorCallBack(e.toString());
    }
  }
}
