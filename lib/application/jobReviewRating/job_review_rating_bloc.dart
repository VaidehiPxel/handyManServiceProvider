import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/application/jobReviewRating/job_review_rating_event.dart';
import 'package:flutter_projects/application/jobReviewRating/job_review_rating_state.dart';
import 'package:flutter_projects/services/job_review_rating_service.dart';



class JobReviewRatingBloc extends Bloc<JobReviewRatingEvent, JobReviewRatingState> {
  final JobReviewRatingService jobReviewRatingService;

  JobReviewRatingBloc({required this.jobReviewRatingService}) : super(JobReviewRatingInitial());

  @override
  Stream<JobReviewRatingState> mapEventToState(JobReviewRatingEvent event) async* {
    if (event is FetchJobReviewRating) {
      yield JobReviewRatingLoading();
      try {
        final rating = await jobReviewRatingService.getJobReviewRating(event.jobId);
        yield JobReviewRatingLoaded(jobReviewRating: rating);
      } catch (e) {
        yield JobReviewRatingError(message: e.toString());
      }
    }
  }
}
