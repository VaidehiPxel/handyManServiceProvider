// To parse this JSON data, do
//
//     final messageListModel = messageListModelFromJson(jsonString);

import 'dart:convert';

class MessageListModel {
    MessageListModel({
        required this.status,
        required this.message,
        required this.getuserchatdetails,
    });

    String status;
    String message;
    List<Getuserchatdetail> getuserchatdetails;

    factory MessageListModel.fromRawJson(String str) => MessageListModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MessageListModel.fromJson(Map<String, dynamic> json) => MessageListModel(
        status: json["status"],
        message: json["message"],
        getuserchatdetails: List<Getuserchatdetail>.from(json["getuserchatdetails"].map((x) => Getuserchatdetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "getuserchatdetails": List<dynamic>.from(getuserchatdetails.map((x) => x.toJson())),
    };
}

class Getuserchatdetail {
    Getuserchatdetail({
        required this.id,
        required this.userId,
        required this.handymanId,
        required this.description,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.name,
        required this.profilepics,
    });

    int id;
    int userId;
    int handymanId;
    String description;
    int status;
    DateTime createdAt;
    DateTime updatedAt;
    String name;
    String profilepics;

    factory Getuserchatdetail.fromRawJson(String str) => Getuserchatdetail.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Getuserchatdetail.fromJson(Map<String, dynamic> json) => Getuserchatdetail(
        id: json["id"],
        userId: json["user_id"],
        handymanId: json["handyman_id"],
        description: json["description"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"],
        profilepics: json["profilepics"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "handyman_id": handymanId,
        "description": description,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "name": name,
        "profilepics": profilepics,
    };
}
