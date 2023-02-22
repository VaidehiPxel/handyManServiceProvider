// To parse this JSON data, do
//
//     final myBidModel = myBidModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_projects/model/jobs/job_detail_model.dart';

class MyBidModel {
  MyBidModel({
    required this.status,
    required this.message,
    required this.result,
    required this.jobsAppliedServiceProviders,
    required this.bidInformation,
  });

  String status;
  String message;
  List<Result> result;
  List<BidInformation> jobsAppliedServiceProviders;
  List<BidInformation> bidInformation;

  factory MyBidModel.fromRawJson(String str) =>
      MyBidModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MyBidModel.fromJson(Map<String, dynamic> json) => MyBidModel(
        status: json["status"],
        message: json["message"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
        jobsAppliedServiceProviders: List<BidInformation>.from(
            json["jobsAppliedServiceProviders"]
                .map((x) => BidInformation.fromJson(x))),
        bidInformation: List<BidInformation>.from(
            json["BidInformation"].map((x) => BidInformation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
        "jobsAppliedServiceProviders": List<dynamic>.from(
            jobsAppliedServiceProviders.map((x) => x.toJson())),
        "BidInformation":
            List<dynamic>.from(bidInformation.map((x) => x.toJson())),
      };
}

class BidInformation {
  BidInformation({
    required this.id,
    required this.jobid,
    required this.title,
    required this.handymanId,
    required this.amount,
    required this.jobstatus,
    required this.createdAt,
    this.name,
    this.profilepics,
  });

  int id;
  int jobid;
  String title;
  int handymanId;
  String amount;
  int jobstatus;
  DateTime createdAt;
  String? name;
  dynamic profilepics;

  factory BidInformation.fromRawJson(String str) =>
      BidInformation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BidInformation.fromJson(Map<String, dynamic> json) => BidInformation(
        id: json["id"],
        jobid: json["jobid"],
        title: json["title"],
        handymanId: json["handyman_id"],
        amount: json["amount"],
        jobstatus: json["jobstatus"],
        createdAt: DateTime.parse(json["created_at"]),
        name: json["name"],
        profilepics: json["profilepics"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jobid": jobid,
        "title": title,
        "handyman_id": handymanId,
        "amount": amount,
        "jobstatus": jobstatus,
        "created_at": createdAt.toIso8601String(),
        "name": name,
        "profilepics": profilepics,
      };
}

