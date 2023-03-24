import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_projects/_core/constants/hive_constant.dart';
import 'package:flutter_projects/services/base_service.dart';
import 'package:path/path.dart';

import '../../model/profile/profile_model.dart';

typedef ProfileServiceSuccess = void Function(ProfileModel profileModel);
typedef UserAddressRemoveSuccess = void Function();
typedef AppErrorCallBack = void Function(String appError);

class ProfileService {
  final Dio _dio;

  ProfileService({Dio? dio}) : _dio = dio ?? Dio();

  Future<void> getSPProfileByID(
      {required AppErrorCallBack errorCallBack,
      required ProfileServiceSuccess profileServiceSuccess}) async {
    String userId = HiveConstants.instances.box1.get(HiveConstants.userIdKey);
    try {
      bool resSuccess = false;
      String message = '', errorCode = '';
      Response? response;
      ProfileModel profileModel;
      print({"user_id": userId});
      response = await _dio.post(
        data: FormData.fromMap({"user_id": userId}),
        URL.sPProfile,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }, responseType: ResponseType.json),
      );

      print(response.statusCode);
      print(response.data);
      Map<String, dynamic> data = jsonDecode(response.data);

      if (response.statusCode == 200) {
        resSuccess = data['status'].toString().compareTo("1") == 0;

        message = data['message'].toString();

        if (resSuccess && message.compareTo("Get Users Details") == 0) {
          profileModel = ProfileModel.fromJson(data);
          print(profileModel.toString());
          profileServiceSuccess(profileModel);
        } else if (!resSuccess) {
          errorCallBack(message);
        }
      }
    } catch (e) {
      print(e);
      errorCallBack(e.toString());
    }
  }

  Future<void> putUserProfile({
    required ProfileModel profileModel,
    required AppErrorCallBack errorCallBack,
    required ProfileServiceSuccess profileServiceSuccess,
  }) async {
    try {
      String userId = HiveConstants.instances.box1.get(HiveConstants.userIdKey);
      bool resSuccess = false;
      String message = '', errorCode = '';
      Response? response;
      ProfileModel profileModels;
      print({"user_id": userId});

      Getuserdetail getuserdetails = profileModel.getuserdetails.first;

      print({
        'user_id': getuserdetails.userid,
        'name': getuserdetails.name,
        'email': getuserdetails.email,
        'mobileno': getuserdetails.mobileno,
        'gender': getuserdetails.gender,
        'dob': getuserdetails.dob,
        'language': getuserdetails.language,
        'oldpassword': getuserdetails.originalePasword,
        'newpassword': getuserdetails.originalePasword,
        'confirmpassword': getuserdetails.originalePasword,
        
      });

      FormData formData = FormData.fromMap({
        'user_id': getuserdetails.userid,
        'name': getuserdetails.name,
        'email': getuserdetails.email,
        'mobileno': getuserdetails.mobileno,
        'gender': getuserdetails.gender,
        'dob': getuserdetails.dob,
        'language': getuserdetails.language,
        'oldpassword': getuserdetails.originalePasword,
        'newpassword': getuserdetails.originalePasword,
        'confirmpassword': getuserdetails.originalePasword,
      });

      if (getuserdetails.profilepics.toString().isNotEmpty) {
        formData.files.add(MapEntry(
            'profilepics',
            await MultipartFile.fromFile(
              getuserdetails.profilepics,
              filename: basename(getuserdetails.profilepics),
            )));
      }

      response = await _dio.post(
        data: formData,
        URL.sPSubmit,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }, responseType: ResponseType.json),
      );

      print(response.statusCode);
      print(response.data);
      Map<String, dynamic> data = jsonDecode(response.data);

      if (response.statusCode == 200) {
        resSuccess = data['status'].toString().compareTo("1") == 0;

        message = data['message'].toString();

        if (resSuccess &&
            message.compareTo("Profile Updated Successfully") == 0) {
          profileModels = ProfileModel.fromJson(data);
          print(profileModels.toString());
          profileServiceSuccess(profileModels);
        } else if (!resSuccess) {
          errorCallBack(message);
        }
      }
    } catch (e) {
      print(e);
      if (e is DioError) {
        print(e.message);
        print(e.error);
        print(e.response);
      }
      errorCallBack(e.toString());
    }
  }




      }
