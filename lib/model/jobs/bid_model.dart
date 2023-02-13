// To parse this JSON data, do
//
//     final bidModel = bidModelFromJson(jsonString);

import 'dart:convert';

class BidModel {
  BidModel({
    required this.status,
    required this.message,
    required this.bidInformation,
  });

  String status;
  String message;
  List<BidInformation> bidInformation;

  factory BidModel.fromRawJson(String str) =>
      BidModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BidModel.fromJson(Map<String, dynamic> json) => BidModel(
        status: json["status"],
        message: json["message"],
        bidInformation: List<BidInformation>.from(
            json["BidInformation"].map((x) => BidInformation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
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
  });

  int id;
  int jobid;
  String title;
  int handymanId;
  String amount;
  int jobstatus;
  DateTime createdAt;

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
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jobid": jobid,
        "title": title,
        "handyman_id": handymanId,
        "amount": amount,
        "jobstatus": jobstatus,
        "created_at": createdAt.toIso8601String(),
      };
}
