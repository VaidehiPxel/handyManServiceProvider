import 'package:equatable/equatable.dart';


abstract class JobReviewRatingEvent extends Equatable {
  const JobReviewRatingEvent();

  @override
  List<Object> get props => [];
}

class FetchJobReviewRating extends JobReviewRatingEvent {

  const FetchJobReviewRating();

}
