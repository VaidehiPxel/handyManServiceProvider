// To parse this JSON data, do
//
//     final jobReviewRatingModel = jobReviewRatingModelFromJson(jsonString);

import 'dart:convert';

class JobReviewRatingModel {
  JobReviewRatingModel({
    required this.status,
    required this.message,
    required this.totalavaragerateing,
    required this.totalreview,
    required this.orderaccepted,
    required this.ordercancel,
    required this.result,
  });

  String status;
  String message;
  int totalavaragerateing;
  int totalreview;
  int orderaccepted;
  int ordercancel;
  List<jobReviewRatingList> result;

  factory JobReviewRatingModel.fromRawJson(String str) =>
      JobReviewRatingModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory JobReviewRatingModel.fromJson(Map<String, dynamic> json) =>
      JobReviewRatingModel(
        status: json["status"],
        message: json["message"],
        totalavaragerateing: json["totalavaragerateing"],
        totalreview: json["totalreview"],
        orderaccepted: json["orderaccepted"],
        ordercancel: json["ordercancel"],
        result: List<jobReviewRatingList>.from(
            json["result"].map((x) => jobReviewRatingList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "totalavaragerateing": totalavaragerateing,
        "totalreview": totalreview,
        "orderaccepted": orderaccepted,
        "ordercancel": ordercancel,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class jobReviewRatingList {
  jobReviewRatingList({
    required this.id,
    required this.customerId,
    required this.customerName,
    required this.handymanId,
    required this.handymanName,
    required this.jobId,
    required this.jobTitle,
    required this.ratingDesc,
    required this.ratingValue,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.profilepics,
  });

  int id;
  int customerId;
  String customerName;
  int handymanId;
  String handymanName;
  int jobId;
  String jobTitle;
  String ratingDesc;
  int ratingValue;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  String profilepics;

  factory jobReviewRatingList.fromRawJson(String str) =>
      jobReviewRatingList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory jobReviewRatingList.fromJson(Map<String, dynamic> json) =>
      jobReviewRatingList(
        id: json["id"],
        customerId: json["customer_id"],
        customerName: json["customer_name"],
        handymanId: json["handyman_id"],
        handymanName: json["handyman_name"],
        jobId: json["job_id"],
        jobTitle: json["job_title"],
        ratingDesc: json["rating_desc"],
        ratingValue: json["rating_value"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"],
        profilepics: json["profilepics"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "customer_name": customerName,
        "handyman_id": handymanId,
        "handyman_name": handymanName,
        "job_id": jobId,
        "job_title": jobTitle,
        "rating_desc": ratingDesc,
        "rating_value": ratingValue,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "name": name,
        "profilepics": profilepics,
      };
}
