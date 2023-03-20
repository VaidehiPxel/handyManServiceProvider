import 'dart:convert';
import 'package:flutter_projects/model/job_review_rating/job_review_rating_model.dart';
import 'package:flutter_projects/services/base_service.dart';
import 'package:http/http.dart' as http;

typedef ReviewSuccess = void Function(
    JobReviewRatingModel jobReviewRatingModel);
typedef AppErrorCallBack = void Function(String appError);

class JobReviewRatingService {
  JobReviewRatingService();

  // int userId2 = HiveConstants.instances.box1.get(HiveConstants.userIdKey);
  int userId2 = 31;

  Future<void> getJobReviewRating({
    required ReviewSuccess reviewSuccess,
    required AppErrorCallBack errorCallBack,
  }) async {
    var client = http.Client();

    http.Response response = await client.get(
      Uri.parse("${URL.getJobReviewRating}$userId2"),
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    print(data);
    print("${URL.getJobReviewRating}$userId2");
    if (response.statusCode == 200) {
      if (data["status"].toString().compareTo("1") == 0) {
        var data = JobReviewRatingModel.fromJson(json.decode(response.body));

        return reviewSuccess(data);
      } else {
        return errorCallBack(data["message"]);
      }
    } else {
      return errorCallBack('Failed to get job review rating');
    }
  }
}
