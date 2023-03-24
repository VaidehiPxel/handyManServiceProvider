class ProfileModel {
  ProfileModel({
    required this.status,
    required this.message,
    required this.getuserdetails,
    //required this.getuseraddress,
  });

  final String status;
  final String message;
  final List<Getuserdetail> getuserdetails;
  //List<Getuseraddress> getuseraddress;

  // set setUserAddress(List<Getuseraddress> getuseraddress) {
  //   this.getuseraddress = getuseraddress;
  // }

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: json["status"],
        message: json["message"],
        getuserdetails: [Getuserdetail.fromJson(json["getuserdetails"])],
        // getuseraddress: List<Getuseraddress>.from(
        //     json["getuseraddress"].map((x) => Getuseraddress.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "getuserdetails":
            List<dynamic>.from(getuserdetails.map((x) => x.toJson())),
        // "getuseraddress":
        //     List<dynamic>.from(getuseraddress.map((x) => x.toJson())),
      };
}

// class Getuseraddress {
//   Getuseraddress({
//     required this.id,
//     required this.userId,
//     required this.name,
//     required this.address,
//     required this.defaultset,
//     required this.status,
//     required this.createdAt,
//   });

//   final int id;
//   final int userId;
//   final String name;
//   final String address;
//   int defaultset;
//   final int status;
//   final DateTime createdAt;

//   set setDefaultset(int defaultset) {
//     this.defaultset = defaultset;
//   }

//   factory Getuseraddress.fromJson(Map<String, dynamic> json) => Getuseraddress(
//         id: json["id"],
//         userId: json["user_id"],
//         name: json["name"].toString(),
//         address: json["address"].toString(),
//         defaultset: json["defaultset"],
//         status: json["status"],
//         createdAt: DateTime.parse(json["created_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "user_id": userId,
//         "name": name,
//         "address": address,
//         "defaultset": defaultset,
//         "status": status,
//         "created_at": createdAt.toIso8601String(),
//       };
// }

class Getuserdetail {
  Getuserdetail({
    required this.userid,
    required this.userRole,
    required this.name,
    required this.lastname,
    required this.email,
    required this.mobileno,
    required this.otp,
    required this.originalePasword,
    required this.apiToken,
    required this.profilepics,
    required this.status,
    required this.gender,
    required this.dob,
    required this.language,
    required this.userBalance,
    required this.createdAt,
  });

  final int userid;
  final int userRole;
  String name;
  final dynamic lastname;
  String email;
  String mobileno;
  final String otp;
  final String originalePasword;
  final String apiToken;
  final dynamic profilepics;
  final int status;
  dynamic gender;
  dynamic dob;
  dynamic language;
  final int userBalance;
  final DateTime createdAt;

  set setName(String name) {
    this.name = name;
  }

  set setEmail(String email) {
    this.email = email;
  }

  set setMobileNo(String mobileno) {
    this.mobileno = mobileno;
  }

  set setGender(String gender) {
    this.gender = gender;
  }

  set setDob(String dob) {
    this.dob = dob;
  }

  set setLanguage(String language) {
    this.language = language;
  }

  factory Getuserdetail.fromJson(Map<String, dynamic> json) => Getuserdetail(
        userid: json["userid"],
        userRole: json["user_role"],
        name: json["name"] ?? "",
        lastname: json["lastname"] ?? "",
        email: json["email"] ?? "",
        mobileno: json["mobileno"] ?? "",
        otp: json["otp"] ?? "",
        originalePasword: json["originale_pasword"] ?? "",
        apiToken: json["api_token"] ?? "",
        profilepics: json["profilepics"] ?? "",
        status: json["status"],
        gender: json["gender"] ?? "",
        dob: json["dob"] ?? "",
        language: json["language"] ?? "",
        userBalance: json["user_balance"] ?? 0,
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "userid": userid,
        "user_role": userRole,
        "name": name,
        "lastname": lastname,
        "email": email,
        "mobileno": mobileno,
        "otp": otp,
        "originale_pasword": originalePasword,
        "api_token": apiToken,
        "profilepics": profilepics,
        "status": status,
        "gender": gender,
        "dob": dob,
        "language": language,
        "user_balance": userBalance,
        "created_at": createdAt.toIso8601String(),
      };
}

extension Profile on ProfileModel {
  getName() {
    return getuserdetails.first.language.toString().compareTo("null") == 0
        ? getuserdetails.first.name
        : "${getuserdetails.first.name}${getuserdetails.first.lastname}";
  }

  getMobile() {
    return getuserdetails.first.mobileno;
  }

  getEmail() {
    return getuserdetails.first.email;
  }

  getGender() {
    return getuserdetails.first.gender.toString().compareTo("null") == 0 ||
            getuserdetails.first.gender.toString().isEmpty
        ? "Male"
        : getuserdetails.first.gender;
  }

  getDob() {
    return getuserdetails.first.dob.toString().compareTo("null") == 0
        ? ""
        : getuserdetails.first.dob;
  }

  getLanguage() {
    return getuserdetails.first.language.toString().compareTo("null") == 0
        ? "English"
        : getuserdetails.first.language;
  }

  // getAddress() {
  //   return getuseraddress.isNotEmpty
  //       ? getuseraddress
  //           .where((element) => element.defaultset == 1)
  //           .first
  //           .address
  //       : "";
  // }

  getUserBal() {
    return getuserdetails.first.userBalance;
  }
}

// extension AddressDefault on List<Getuseraddress> {
//   setAllDefault() {
//     for (var d in this) {
//       d.setDefaultset = 0;
//     }
//     return this;
//   }
// }
