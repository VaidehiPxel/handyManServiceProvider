part of 'message_bloc.dart';

abstract class MessageEvent extends Equatable {
  const MessageEvent();

  @override
  List<Object> get props => [];
}

class GetMessageListCallApiEvent extends MessageEvent {
  final int userId;
  const GetMessageListCallApiEvent({
    required this.userId,
  });

  @override
  List<Object> get props => [
        userId,
      ];
}



class GetMessageHistoryCallApiEvent extends MessageEvent {
  final int userId;
   final String message;
  const GetMessageHistoryCallApiEvent({
    required this.userId,
    required this.message
  });

  @override
  List<Object> get props => [
        userId,
      ];
}


class GetMessageHistoryApiEvent extends MessageEvent {
  final int userId;
  const GetMessageHistoryApiEvent({
    required this.userId,
  });

  @override
  List<Object> get props => [
        userId,
      ];
}




