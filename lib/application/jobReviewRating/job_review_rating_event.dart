import 'package:equatable/equatable.dart';


abstract class JobReviewRatingEvent extends Equatable {
  const JobReviewRatingEvent();

  @override
  List<Object> get props => [];
}

class FetchJobReviewRating extends JobReviewRatingEvent {
  final int jobId;

  const FetchJobReviewRating({required this.jobId});

  @override
  List<Object> get props => [jobId];

  @override
  String toString() => 'FetchJobReviewRating { jobId: $jobId }';
}
