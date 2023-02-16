// To parse this JSON data, do
//
//     final myBidModel = myBidModelFromJson(jsonString);

import 'dart:convert';

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
  String? amount;
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
        amount: json["amount"],
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
