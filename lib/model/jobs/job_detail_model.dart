import 'package:flutter_projects/model/service_provider/service_provider_model.dart';

class JobDetailModel {
  String? jobTitle;
  String? jobSmallDesc;
  String? jobBigDesc;
  String? jobAddress;
  int? lat;
  int? long;
  String? jobDate;
  String? jobTime;
  String? jobFee;
  List<ServiceProviderModel>? serviceProvider;

  JobDetailModel({this.jobTitle,this.jobSmallDesc,this.jobBigDesc,this.lat,this.long,this.jobDate,this.jobTime,this.serviceProvider});

  JobDetailModel.fromJson(Map<String, dynamic> json) {
    jobTitle = json['jobTitle'];
    jobSmallDesc = json['jobSmallDesc'];
    jobBigDesc = json['jobBigDesc'];
    jobAddress = json['jobAddress'];
    lat = json['lat'];
    long = json['long'];
    jobDate = json['jobDate'];
    jobTime = json['jobTime'];
    jobFee = json['jobFee'];
    serviceProvider = json['serviceProvider'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['jobTitle'] = jobTitle;
    data['jobSmallDesc'] = jobSmallDesc;
    data['jobBigDesc'] = jobBigDesc;
    data['jobAddress'] = jobAddress;
    data['lat'] = lat;
    data['long'] = long;
    data['jobDate'] = jobDate;
    data['jobTime'] = jobTime;
    data['jobFee'] = jobFee;
    data['serviceProvider'] = serviceProvider;
    return data;
  }
}