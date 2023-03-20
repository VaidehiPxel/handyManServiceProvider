import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/application/jobReviewRating/job_review_rating_event.dart';
import 'package:flutter_projects/application/jobReviewRating/job_review_rating_state.dart';
import 'package:flutter_projects/services/job_review_rating_service.dart';

class JobReviewRatingBloc
    extends Bloc<JobReviewRatingEvent, JobReviewRatingState> {
  final JobReviewRatingService jobReviewRatingService;

  JobReviewRatingBloc({required this.jobReviewRatingService})
      : super(JobReviewRatingInitial()) {
    on<JobReviewRatingEvent>((event, emit) async {
      try {
        print("hhhh" + event.toString());
        if (event is FetchJobReviewRating) {
          emit(JobReviewRatingLoading());
          await jobReviewRatingService.getJobReviewRating(
          
            errorCallBack: (appError) {
               print("kkkk");
              emit(JobReviewRatingError(message: appError));
            },
            reviewSuccess: (jobReviewRatingModel) {
              print("hhhhh111");
              emit(
                  JobReviewRatingLoaded(jobReviewRating: jobReviewRatingModel));
            },
          );
        }
      } catch (e) {
        JobReviewRatingError(message: e.toString());
      }
    });
  }
}
