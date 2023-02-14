// To parse this JSON data, do
//
//     final myJobListModel = myJobListModelFromJson(jsonString);

import 'dart:convert';

class MyJobListModel {
  MyJobListModel({
    required this.status,
    required this.message,
    required this.joblist,
  });

  String status;
  String message;
  List<Joblist> joblist;

  factory MyJobListModel.fromRawJson(String str) =>
      MyJobListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MyJobListModel.fromJson(Map<String, dynamic> json) => MyJobListModel(
        status: json["status"],
        message: json["message"],
        joblist:
            List<Joblist>.from(json["joblist"].map((x) => Joblist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "joblist": List<dynamic>.from(joblist.map((x) => x.toJson())),
      };
}

class Joblist {
  Joblist({
    required this.id,
    required this.userId,
    required this.userName,
    required this.title,
    required this.description,
    required this.amount,
    required this.fromamount,
    required this.toamount,
    required this.jobdate,
    required this.jobtime,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.status,
    required this.createdAt,
  });

  int id;
  int userId;
  String userName;
  String title;
  String description;
  String amount;
  String fromamount;
  String toamount;
  DateTime jobdate;
  String jobtime;
  String image1;
  String image2;
  String image3;
  String image4;
  String image5;
  int status;
  DateTime createdAt;

  factory Joblist.fromRawJson(String str) => Joblist.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Joblist.fromJson(Map<String, dynamic> json) => Joblist(
        id: json["id"],
        userId: json["user_id"],
        userName: json["user_name"],
        title: json["title"],
        description: json["description"],
        amount: json["amount"],
        fromamount: json["fromamount"],
        toamount: json["toamount"],
        jobdate: DateTime.parse(json["jobdate"]),
        jobtime: json["jobtime"],
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        image4: json["image4"],
        image5: json["image5"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "user_name": userName,
        "title": title,
        "description": description,
        "amount": amount,
        "fromamount": fromamount,
        "toamount": toamount,
        "jobdate":
            "${jobdate.year.toString().padLeft(4, '0')}-${jobdate.month.toString().padLeft(2, '0')}-${jobdate.day.toString().padLeft(2, '0')}",
        "jobtime": jobtime,
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "image4": image4,
        "image5": image5,
        "status": status,
        "created_at": createdAt.toIso8601String(),
      };
}
