part of 'message_bloc.dart';

abstract class MessageState extends Equatable {
  final bool isLoading;
  const MessageState({
    required this.isLoading,
  });

  @override
  List<Object> get props => [isLoading];
}

class MessageInitial extends MessageState {
  const MessageInitial({
    required super.isLoading,
  });
}

class MessageLoading extends MessageState {
  const MessageLoading({
    required super.isLoading,
  });
}

class ReportError extends MessageState {
  final String? mErrorMsg;
  const ReportError({
    this.mErrorMsg,
    required super.isLoading,
  });
  @override
  List<Object> get props => [mErrorMsg!];
}

class GetMessageSuccess extends MessageState {
  final List<Getuserchatdetail> messageList;

  const GetMessageSuccess(
      {required super.isLoading, required this.messageList});
}

class SendMessageSuccess extends MessageState {
  final bool isSend;

  const SendMessageSuccess(
      {required super.isLoading, required this.isSend});
}

class GetHistorySuccess extends MessageState {
  final List<Getuserchatdetail> historyList;
  const GetHistorySuccess(
      {required super.isLoading, required this.historyList});
}
