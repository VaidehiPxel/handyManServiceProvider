// To parse this JSON data, do
//
//     final getJobDetailModel = getJobDetailModelFromJson(jsonString);

import 'dart:convert';

class GetJobDetailModel {
  GetJobDetailModel({
    required this.status,
    required this.message,
    required this.result,
    required this.jobsAppliedServiceProviders,
  });

  String status;
  String message;
  List<Result> result;
  List<dynamic> jobsAppliedServiceProviders;

  factory GetJobDetailModel.fromRawJson(String str) =>
      GetJobDetailModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetJobDetailModel.fromJson(Map<String, dynamic> json) =>
      GetJobDetailModel(
        status: json["status"],
        message: json["message"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
        jobsAppliedServiceProviders: List<dynamic>.from(
            json["jobsAppliedServiceProviders"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
        "jobsAppliedServiceProviders":
            List<dynamic>.from(jobsAppliedServiceProviders.map((x) => x)),
      };
}

class Result {
  Result({
    required this.id,
    required this.userId,
    required this.userName,
    required this.title,
    required this.description,
    required this.address1,
    required this.address2,
    required this.latitude,
    required this.longitude,
    required this.city,
    required this.state,
    required this.country,
    required this.pincode,
    required this.jobdate,
    required this.jobtime,
    this.amount,
    this.fromamount,
    this.toamount,
    required this.status,
    required this.createdAt,
  });

  int id;
  int userId;
  String userName;
  String title;
  String description;
  String address1;
  String address2;
  String latitude;
  String longitude;
  String city;
  String state;
  String country;
  String pincode;
  DateTime jobdate;
  String jobtime;
  dynamic amount;
  dynamic fromamount;
  dynamic toamount;
  int status;
  DateTime createdAt;

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        userId: json["user_id"],
        userName: json["user_name"],
        title: json["title"],
        description: json["description"],
        address1: json["address1"],
        address2: json["address2"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        pincode: json["pincode"],
        jobdate: DateTime.parse(json["jobdate"]),
        jobtime: json["jobtime"],
        amount: json["amount"] ?? 0.0,
        fromamount: json["fromamount"],
        toamount: json["toamount"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "user_name": userName,
        "title": title,
        "description": description,
        "address1": address1,
        "address2": address2,
        "latitude": latitude,
        "longitude": longitude,
        "city": city,
        "state": state,
        "country": country,
        "pincode": pincode,
        "jobdate":
            "${jobdate.year.toString().padLeft(4, '0')}-${jobdate.month.toString().padLeft(2, '0')}-${jobdate.day.toString().padLeft(2, '0')}",
        "jobtime": jobtime,
        "amount": amount,
        "fromamount": fromamount,
        "toamount": toamount,
        "status": status,
        "created_at": createdAt.toIso8601String(),
      };
}
