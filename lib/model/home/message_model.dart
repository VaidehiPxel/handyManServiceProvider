class MessageModel {
  String? senderImage;
  String? senderName;
  String? senderMessage;
  String? senderTime;

  MessageModel({this.senderImage, this.senderName,this.senderMessage,this.senderTime,});

  MessageModel.fromJson(Map<String, dynamic> json) {
    senderImage = json['senderImage'];
    senderName = json['senderName'];
    senderMessage = json['senderMessage'];
    senderTime = json['senderTime'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['senderImage'] = senderImage;
    data['senderName'] = senderName;
    data['senderMessage'] = senderMessage;
    data['senderTime'] = senderTime;

    return data;
  }
}