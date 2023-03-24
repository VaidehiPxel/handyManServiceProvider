// To parse this JSON data, do
//
//     final reportServiceProvidersList = reportServiceProvidersListFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class ReportServiceProvidersList {
  ReportServiceProvidersList({
    required this.status,
    required this.message,
    required this.getServiceProvidersList,
  });

  String status;
  String message;
  List<GetServiceProvidersList> getServiceProvidersList;

  factory ReportServiceProvidersList.fromRawJson(String str) =>
      ReportServiceProvidersList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReportServiceProvidersList.fromJson(Map<String, dynamic> json) =>
      ReportServiceProvidersList(
        status: json["status"],
        message: json["message"],
        getServiceProvidersList: List<GetServiceProvidersList>.from(
            json["getuserchatdetails"]
                .map((x) => GetServiceProvidersList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "getserviceproviderslist":
            List<dynamic>.from(getServiceProvidersList.map((x) => x.toJson())),
      };
}

class GetServiceProvidersList {
  GetServiceProvidersList({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory GetServiceProvidersList.fromRawJson(String str) =>
      GetServiceProvidersList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetServiceProvidersList.fromJson(Map<String, dynamic> json) =>
      GetServiceProvidersList(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
