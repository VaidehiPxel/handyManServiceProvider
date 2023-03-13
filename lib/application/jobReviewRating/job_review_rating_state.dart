
import 'package:equatable/equatable.dart';
import 'package:flutter_projects/model/job_review_rating/job_review_rating_model.dart';


abstract class JobReviewRatingState extends Equatable {
  const JobReviewRatingState();

  @override
  List<Object> get props => [];
}

class JobReviewRatingInitial extends JobReviewRatingState {}

class JobReviewRatingLoading extends JobReviewRatingState {}

class JobReviewRatingLoaded extends JobReviewRatingState {
  final JobReviewRatingModel jobReviewRating;

  const JobReviewRatingLoaded({required this.jobReviewRating});

  @override
  List<Object> get props => [jobReviewRatingList];

}

class JobReviewRatingError extends JobReviewRatingState {
  final String message;

  const JobReviewRatingError({required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'JobReviewRatingError { message: $message }';
}
