// To parse this JSON data, do
//
//     final reportJobList = reportJobListFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class ReportJobList {
  ReportJobList({
    required this.status,
    required this.message,
    required this.getJobList,
  });

  String status;
  String message;
  List<GetJobList> getJobList;

  factory ReportJobList.fromRawJson(String str) =>
      ReportJobList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReportJobList.fromJson(Map<String, dynamic> json) => ReportJobList(
        status: json["status"],
        message: json["message"],
        getJobList: List<GetJobList>.from(
            json["getjoblist"].map((x) => GetJobList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "getjoblist": List<dynamic>.from(getJobList.map((x) => x.toJson())),
      };
}

class GetJobList {
  GetJobList({
    required this.id,
    required this.title,
    required this.description,
  });

  int id;
  String title;
  String description;

  factory GetJobList.fromRawJson(String str) =>
      GetJobList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetJobList.fromJson(Map<String, dynamic> json) => GetJobList(
        id: json["id"],
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
      };
}
