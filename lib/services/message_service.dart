import 'dart:convert';
import 'dart:io';

import 'package:flutter_projects/_core/constants/hive_constant.dart';
import 'package:flutter_projects/services/base_service.dart';
import 'package:http/http.dart' as http;

import '../../model/message/message_list_model.dart';

typedef MessageList = void Function(List<Getuserchatdetail> messageList);
typedef ChatHistory = void Function(List<Getuserchatdetail> chatHistory);
typedef SendMessage = void Function(bool isSend);
typedef AppErrorCallBack = void Function(String appError);

class MessageService {
  int userId2 = HiveConstants.instances.box1.get(HiveConstants.userIdKey);

  Future<void> getMessageList(
      {required AppErrorCallBack errorCallBack,
      required MessageList messageList}) async {
    try {
      String message = '';

      var client = http.Client();
      http.Response response = await client.get(
        //Uri.parse("${URL.messageList}$userId2"),
        Uri.parse("${URL.messageList}26"),
      );

      var data = MessageListModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        if (data.status.toString().compareTo("1") == 0) {
          print("here111..");
          if (data.getuserchatdetails.isNotEmpty) {
            print("here..");
            messageList(data.getuserchatdetails);
          } else {
            print("there..");
            errorCallBack(message);
          }
        } else {
          errorCallBack(message);
        }
      }
    } catch (e) {
      print(e);
      errorCallBack(e.toString());
    }
  }

  Future<void> sendMessage({
    required AppErrorCallBack errorCallBack,
    required SendMessage sendMessage,
    required int userId,
    required String description,
  }) async {
    try {
      Map<String, String> map = {};

      map = {
        'user_id': userId2.toString(),
        'serviceprovider_id': userId.toString(),
        'description': description.toString(),
        'usertype': "serviceprovider"
      };
      var client = http.Client();

      http.Response response =
          await client.post(Uri.parse(URL.sendMessage), body: map);

      Map<String, dynamic> data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (data['status'].toString().compareTo("1") == 0 &&
            data['message'].toString().compareTo("Send chat message") == 0) {
          sendMessage(true);
        } else {
          errorCallBack("No data");
        }
      }
    } catch (e) {
      errorCallBack(e.toString());
    }
  }

  Future<void> getChatHistory(
      {required AppErrorCallBack errorCallBack,
      required int userId,
      required ChatHistory chatHistory}) async {
    try {
      String message = '';

      var client = http.Client();
      print(Uri.parse(URL.chatHistory
          .replaceAll("X", userId2.toString())
          .replaceAll("Y", userId.toString())));
      http.Response response = await client.get(
        Uri.parse(URL.chatHistory
            .replaceAll("X", userId2.toString())
            .replaceAll("Y", userId.toString())),
      );

      var data = MessageListModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        if (data.status.toString().compareTo("1") == 0) {
          if (data.getuserchatdetails.isNotEmpty) {
            chatHistory(data.getuserchatdetails);
          } else {
            errorCallBack(message);
          }
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
