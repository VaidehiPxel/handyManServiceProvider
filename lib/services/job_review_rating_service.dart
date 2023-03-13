import 'dart:convert';
import 'package:flutter_projects/model/job_review_rating/job_review_rating_model.dart';
import 'package:flutter_projects/services/base_service.dart';
import 'package:http/http.dart' as http;

class JobReviewRatingService {

  JobReviewRatingService();

  Future<JobReviewRatingModel> getJobReviewRating(int jobId) async {
    var client = http.Client();

    http.Response response = await client.get(
      Uri.parse("${URL.getJobReviewRating}jobId"),
    );

    var data = JobReviewRatingModel.fromJson(json.decode(response.body));
    if (response.statusCode == 200) {
      if (data.status.toString().compareTo("1") == 0) {
        return data;
      } else {
        throw Exception('Failed to get job review rating');
      }
    } else {
      throw Exception('Failed to get job review rating');
    }
  }
}
