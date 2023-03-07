// To parse this JSON data, do
//
//     final getComplaints = getComplaintsFromJson(jsonString);

import 'dart:convert';

class GetComplaintsModel {
    GetComplaintsModel({
        required this.status,
        required this.message,
        required this.getcomplaints,
    });

    String status;
    String message;
    Getcomplaints getcomplaints;

    factory GetComplaintsModel.fromRawJson(String str) => GetComplaintsModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetComplaintsModel.fromJson(Map<String, dynamic> json) => GetComplaintsModel(
        status: json["status"],
        message: json["message"],
        getcomplaints: Getcomplaints.fromJson(json["getcomplaints"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "getcomplaints": getcomplaints.toJson(),
    };
}

class Getcomplaints {
    Getcomplaints({
        required this.id,
        required this.userId,
        required this.createdBy,
        required this.jobId,
        required this.jobTitle,
        required this.complaintsDesc,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    int userId;
    int createdBy;
    int jobId;
    String jobTitle;
    String complaintsDesc;
    int status;
    DateTime createdAt;
    DateTime updatedAt;

    factory Getcomplaints.fromRawJson(String str) => Getcomplaints.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Getcomplaints.fromJson(Map<String, dynamic> json) => Getcomplaints(
        id: json["id"],
        userId: json["user_id"],
        createdBy: json["created_by"],
        jobId: json["job_id"],
        jobTitle: json["job_title"],
        complaintsDesc: json["complaints_desc"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "created_by": createdBy,
        "job_id": jobId,
        "job_title": jobTitle,
        "complaints_desc": complaintsDesc,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
