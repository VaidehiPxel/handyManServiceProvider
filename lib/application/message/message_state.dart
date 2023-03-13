part of 'message_bloc.dart';

abstract class MessageState extends Equatable {
  final bool isLoading;
  final List<Getuserchatdetail> messageList;
  const MessageState({required this.isLoading, required this.messageList});

  @override
  List<Object> get props => [isLoading];
}

class MessageInitial extends MessageState {
  const MessageInitial(
      {required super.isLoading, required super.messageList});
}

class MessageLoading extends MessageState {
  const MessageLoading(
      {required super.isLoading, required super.messageList});
}


class ReportError extends MessageState {
  final String? mErrorMsg;
  const ReportError(
      {this.mErrorMsg, required super.isLoading, required super.messageList});
  @override
  List<Object> get props => [mErrorMsg!];
}

class GetMessageSuccess extends MessageState {
  const GetMessageSuccess({required super.isLoading, required super.messageList});
}
