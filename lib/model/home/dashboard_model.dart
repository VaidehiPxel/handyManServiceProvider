// To parse this JSON data, do
//
//     final dashboardModel = dashboardModelFromJson(jsonString);

import 'dart:convert';

class DashboardModel {
  DashboardModel({
    required this.status,
    required this.message,
    required this.usersdetails,
    required this.total5Star,
    required this.total4Star,
    required this.total3Star,
    required this.total2Star,
    required this.total1Star,
    required this.totalreview,
    required this.todayjob,
    required this.completedjob,
    required this.totalearning,
    required this.jobrequest,
    required this.newjobs,
  });

  String status;
  String message;
  Usersdetail usersdetails;
  int total5Star;
  int total4Star;
  int total3Star;
  int total2Star;
  int total1Star;
  int totalreview;
  int todayjob;
  int completedjob;
  int totalearning;
  List<Jobrequest> jobrequest;
  List<Jobrequest> newjobs;

  factory DashboardModel.fromRawJson(String str) =>
      DashboardModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        status: json["status"],
        message: json["message"],
        usersdetails: Usersdetail.fromJson(json["usersdetails"]),
        total5Star: json["total5star"],
        total4Star: json["total4star"],
        total3Star: json["total3star"],
        total2Star: json["total2star"],
        total1Star: json["total1star"],
        totalreview: json["totalreview"],
        todayjob: json["todayjob"],
        completedjob: json["completedjob"],
        totalearning: json["totalearning"],
        jobrequest: List<Jobrequest>.from(
            json["jobrequest"].map((x) => Jobrequest.fromJson(x))),
        newjobs: List<Jobrequest>.from(
            json["newjobs"].map((x) => Jobrequest.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "usersdetails": usersdetails.toJson(),
        "total5star": total5Star,
        "total4star": total4Star,
        "total3star": total3Star,
        "total2star": total2Star,
        "total1star": total1Star,
        "totalreview": totalreview,
        "todayjob": todayjob,
        "completedjob": completedjob,
        "totalearning": totalearning,
        "jobrequest": List<dynamic>.from(jobrequest.map((x) => x.toJson())),
        "newjobs": List<dynamic>.from(newjobs.map((x) => x.toJson())),
      };
}

class Jobrequest {
  Jobrequest({
    required this.id,
    required this.userId,
    required this.userName,
    required this.title,
    required this.description,
    required this.address1,
    required this.address2,
    this.latitude,
    this.longitude,
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
    this.image1,
  });

  int id;
  int userId;
  String userName;
  String title;
  String description;
  String address1;
  String address2;
  String? latitude;
  String? longitude;
  String city;
  String state;
  String country;
  String pincode;
  DateTime jobdate;
  String jobtime;
  String? amount;
  String? fromamount;
  String? toamount;
  int status;
  DateTime createdAt;
  String? image1;

  factory Jobrequest.fromRawJson(String str) =>
      Jobrequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Jobrequest.fromJson(Map<String, dynamic> json) => Jobrequest(
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
      createdAt: DateTime.parse(
        json["created_at"],
      ),
      image1: json["image1"]);

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
        "image1": image1,
      };
}

class Usersdetail {
  Usersdetail({
    required this.id,
    required this.userRole,
    required this.name,
    required this.lastname,
    required this.email,
    this.emailVerifiedAt,
    required this.mobileno,
    this.otp,
    required this.profilepics,
    required this.status,
    this.gender,
    this.dob,
    this.language,
    required this.userBalance,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int userRole;
  String name;
  String lastname;
  String email;
  dynamic emailVerifiedAt;
  String mobileno;
  dynamic otp;
  String profilepics;
  int status;
  dynamic gender;
  dynamic dob;
  dynamic language;
  int userBalance;
  DateTime createdAt;
  DateTime updatedAt;

  factory Usersdetail.fromRawJson(String str) =>
      Usersdetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Usersdetail.fromJson(Map<String, dynamic> json) => Usersdetail(
        id: json["id"],
        userRole: json["user_role"],
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        mobileno: json["mobileno"],
        otp: json["otp"],
        profilepics: json["profilepics"],
        status: json["status"],
        gender: json["gender"],
        dob: json["dob"],
        language: json["language"],
        userBalance: json["user_balance"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_role": userRole,
        "name": name,
        "lastname": lastname,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "mobileno": mobileno,
        "otp": otp,
        "profilepics": profilepics,
        "status": status,
        "gender": gender,
        "dob": dob,
        "language": language,
        "user_balance": userBalance,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
