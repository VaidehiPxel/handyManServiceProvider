import 'package:hive_flutter/hive_flutter.dart';

class HiveConstants {
  static HiveConstants instances = HiveConstants();
  late Box box1;

  HiveConstants() {
    createBox();
  }

  Future<void> createBox() async {
    box1 = await Hive.openBox('database1');
  }

  get database => box1;

  static const String userIdKey = "USER_ID_KEY";
  static const String userNameKey = "USER_NAME_KEY";
  static const String userEmailKey = "USER_EMAIL_KEY";
  static const String userProfileKey = "USER_PROFILE_KEY";
  static const String userOTPKey = "USER_OTP_KEY";
}

extension HHiveConstants on HiveConstants {
  Future<void> init() async {
    createBox();
  }
}

extension IntExtensions on int {
  int userIdFromBox() {
    return HiveConstants.instances.box1.get(HiveConstants.userIdKey);
    
  }
}
