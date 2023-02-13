import 'package:equatable/equatable.dart';

abstract class JobDetailEvent extends Equatable {
  const JobDetailEvent();

  @override
  List<Object> get props => [];
}

class JobDetailCallApiEvent extends JobDetailEvent {
  final int jobId;

  const JobDetailCallApiEvent({required this.jobId});

  @override
  List<Object> get props => [jobId];
}

class BidUpdateApiEvent extends JobDetailEvent {
  final int jobId;
  final int userId;
  final String amount;

  const BidUpdateApiEvent(
      {required this.jobId, required this.userId, required this.amount});

  @override
  List<Object> get props => [jobId, userId, amount];
}

class BidRemoveApiEvent extends JobDetailEvent {
  final int jobId;
  final int userId;

  const BidRemoveApiEvent({
    required this.jobId,
    required this.userId,
  });

  @override
  List<Object> get props => [
        jobId,
        userId,
      ];
}
