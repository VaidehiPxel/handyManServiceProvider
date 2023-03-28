class ProfileModel {
  ProfileModel({
    required this.status,
    required this.message,
    required this.getserviceproviderdetails,
    //required this.getuseraddress,
  });

  final String status;
  final String message;
  final List<Getserviceproviderdetail> getserviceproviderdetails;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: json["status"],
        message: json["message"],
        getserviceproviderdetails: [
          Getserviceproviderdetail.fromJson(json["getuserdetails"])
        ],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "getserviceproviderdetails": List<dynamic>.from(
            getserviceproviderdetails.map((x) => x.toJson())),
      };
}

class Getserviceproviderdetail {
  Getserviceproviderdetail({
    required this.userid,
    this.name,
    required this.lastname,
    required this.email,
    required this.mobileno,
    required this.profilepics,
    required this.createdAt,
    this.description,
    this.extradescription,
    this.workexperience,
    this.educationdetail,
    this.categoryid,
    this.categoryname,
    this.subcategoryid,
    this.subcategoryname,
    this.amount,
    this.time,
    this.cetrificate1,
    this.cetrificate2,
  });

  int userid;
  dynamic name;
  String lastname;
  String email;
  String mobileno;
  String profilepics;
  DateTime createdAt;
  dynamic description;
  dynamic extradescription;
  dynamic workexperience;
  dynamic educationdetail;
  dynamic categoryid;
  dynamic categoryname;
  dynamic subcategoryid;
  dynamic subcategoryname;
  dynamic amount;
  dynamic time;
  dynamic cetrificate1;
  dynamic cetrificate2;

  set setFirstName(String fname) {
    this.name = fname;
  }

  set setLastName(String Lname) {
    this.lastname = Lname;
  }

  set setEmail(String email) {
    this.email = email;
  }

  set setMobileNo(String mobileno) {
    this.mobileno = mobileno;
  }

  set setIntroduction(String introduction) {
    description = introduction;
  }

  set setExperience(String experience) {
    this.workexperience = experience;
  }

  set setCategory(String category) {
    this.categoryname = category;
  }

  factory Getserviceproviderdetail.fromJson(Map<String, dynamic> json) =>
      Getserviceproviderdetail(
        userid: json["userid"],
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        mobileno: json["mobileno"],
        profilepics: json["profilepics"],
        createdAt: DateTime.parse(json["created_at"]),
        description: json["description"],
        extradescription: json["extradescription"],
        workexperience: json["workexperience"],
        educationdetail: json["educationdetail"],
        categoryid: json["categoryid"],
        categoryname: json["categoryname"],
        subcategoryid: json["subcategoryid"],
        subcategoryname: json["subcategoryname"],
        amount: json["amount"],
        time: json["time"],
        cetrificate1: json["cetrificate1"],
        cetrificate2: json["cetrificate2"],
      );

  Map<String, dynamic> toJson() => {
        "userid": userid,
        "name": name,
        "lastname": lastname,
        "email": email,
        "mobileno": mobileno,
        "profilepics": profilepics,
        "created_at": createdAt.toIso8601String(),
        "description": description,
        "extradescription": extradescription,
        "workexperience": workexperience,
        "educationdetail": educationdetail,
        "categoryid": categoryid,
        "categoryname": categoryname,
        "subcategoryid": subcategoryid,
        "subcategoryname": subcategoryname,
        "amount": amount,
        "time": time,
        "cetrificate1": cetrificate1,
        "cetrificate2": cetrificate2,
      };
}

extension Profile on ProfileModel {
  getFirstName() {
    return getserviceproviderdetails.first.name.toString().compareTo("null") ==
            0
        ? "Dummy"
        : "${getserviceproviderdetails.first.name}";
  }

  getLastName() {
    return getserviceproviderdetails.first.lastname
                .toString()
                .compareTo("null") ==
            0
        ? "LastName"
        : getserviceproviderdetails.first.lastname;
  }

  getMobile() {
    return getserviceproviderdetails.first.mobileno;
  }

  getEmail() {
    return getserviceproviderdetails.first.email;
  }

  getIntroduction() {
    return getserviceproviderdetails.first.description
                    .toString()
                    .compareTo("null") ==
                0 ||
            getserviceproviderdetails.first.description.toString().isEmpty
        ? "Dummy Text"
        : getserviceproviderdetails.first.description;
  }

  getExperience() {
    return getserviceproviderdetails.first.workexperience
                .toString()
                .compareTo("null") ==
            0
        ? "0"
        : getserviceproviderdetails.first.workexperience;
  }

  getCategory() {
    return getserviceproviderdetails.first.categoryname
                .toString()
                .compareTo("null") ==
            0
        ? "Cleaning"
        : getserviceproviderdetails.first.categoryname;
  }
}
