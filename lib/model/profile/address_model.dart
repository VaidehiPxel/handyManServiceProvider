class UserAddressList {
  final String status;
  final String message;
  final List<Getuseraddress> getuseraddress;

  UserAddressList(
      {required this.status,
      required this.message,
      required this.getuseraddress});

  factory UserAddressList.fromJson(Map<String, dynamic> json) =>
      UserAddressList(
        status: json["status"],
        message: json["message"],
        getuseraddress: List<Getuseraddress>.from(
            json["getuseraddress"].map((x) => Getuseraddress.fromJson(x))),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.getuseraddress != null) {
      data['getuseraddress'] =
          this.getuseraddress!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Getuseraddress {
  final int id;
  final int userId;
  final String name;
  final String address1;
  final String address2;
  final String city;
  final String state;
  final String zipcode;
  final String country;
  int defaultset;
  final int status;
  final String createdAt;
  final String updatedAt;

  Getuseraddress(
      {required this.id,
      required this.userId,
      required this.name,
      required this.address1,
      required this.address2,
      required this.city,
      required this.state,
      required this.zipcode,
      required this.country,
      required this.defaultset,
      required this.status,
      required this.createdAt,
      required this.updatedAt});

  set setDefaultset(int defaultset) {
    this.defaultset = defaultset;
  }

  factory Getuseraddress.fromJson(Map<String, dynamic> json) => Getuseraddress(
        id: json['id'],
        userId: json['user_id'],
        name: json['name'].toString(),
        address1: json['address1'].toString(),
        address2: json['address2'].toString(),
        city: json['city'].toString(),
        state: json['state'].toString(),
        zipcode: json['zipcode'].toString(),
        country: json['country'].toString(),
        defaultset: json['defaultset'],
        status: json['status'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zipcode'] = this.zipcode;
    data['country'] = this.country;
    data['defaultset'] = this.defaultset;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

  getAddress() {
  //   return getuseraddress.isNotEmpty
  //       ? getuseraddress
  //           .where((element) => element.defaultset == 1)
  //           .first
  //           .address
  //       : "";
 }
}

extension AddressListDefault on List<Getuseraddress> {
  setAllDefault() {
    for (var d in this) {
      d.setDefaultset = 0;
    }
    return this;
  }
}
