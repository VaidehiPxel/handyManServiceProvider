part of 'message_bloc.dart';

abstract class MessageState extends Equatable {
  final bool isLoading;
  final List<Getuserchatdetail> messageList;
  final List<Getuserchatdetail> historyList;
  const MessageState({
    required this.isLoading,
    required this.messageList,
    required this.historyList,
  });

  @override
  List<Object> get props => [isLoading];
}

class MessageInitial extends MessageState {
  MessageInitial(
      {required super.isLoading,
      required super.messageList,
      required super.historyList});
}

class MessageLoading extends MessageState {
  MessageLoading(
      {required super.isLoading,
      required super.messageList,
      required super.historyList});
}

class ReportError extends MessageState {
  final String? mErrorMsg;
  const ReportError({
    this.mErrorMsg,
    required super.isLoading,
    required super.messageList,
    required super.historyList,
  });
  @override
  List<Object> get props => [mErrorMsg!];
}

class GetMessageSuccess extends MessageState {
  GetMessageSuccess(
      {required super.isLoading,
      required super.messageList,
      required super.historyList});
}

class SendMessageSuccess extends MessageState {
  final bool isSend;

  const SendMessageSuccess(
      {required super.isLoading,
      required this.isSend,
      required super.historyList,
      required super.messageList});
}

class GetHistorySuccess extends MessageState {
  const GetHistorySuccess(
      {required super.isLoading,
      required super.historyList,
      required super.messageList});
}
