class ServiceProviderModel {
  String? jobImage;
  String? jobTitle;
  String? jobDesc;
  String? jobAddress;
  String? jobTime;
  String? jobFee;

  ServiceProviderModel({this.jobImage, this.jobTitle,this.jobDesc,this.jobAddress,this.jobTime,this.jobFee});

  ServiceProviderModel.fromJson(Map<String, dynamic> json) {
    jobImage = json['jobImage'];
    jobTitle = json['jobTitle'];
    jobDesc = json['jobDesc'];
    jobAddress = json['jobAddress'];
    jobTime = json['jobTime'];
    jobFee = json['jobFee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['jobImage'] = jobImage;
    data['jobTitle'] = jobTitle;
    data['jobDesc'] = jobDesc;
    data['jobAddress'] = jobAddress;
    data['jobTime'] = jobTime;
    data['jobFee'] = jobFee;
    return data;
  }
}