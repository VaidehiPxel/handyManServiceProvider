import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/model/message/message_list_model.dart';

import 'package:flutter_projects/model/report/report_listing_model.dart';
import 'package:flutter_projects/services/message_service.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final MessageService messageService;

  MessageBloc({required this.messageService})
      : super(const MessageInitial(isLoading: true, messageList: [])) {
    on<MessageEvent>((event, emit) async {
      if (event is GetMessageListCallApiEvent) {
        emit(const MessageLoading(
          isLoading: true,
          messageList: [],
        ));
        await messageService.getMessageList(
          errorCallBack: (appError) {
            emit(ReportError(
                mErrorMsg: appError,
                isLoading: false,
                messageList: state.messageList));
          },
          messageList: (chatList) {
            emit(GetMessageSuccess(isLoading: false, messageList: chatList));
          },
        );
      } else if (event is GetMessageHistoryCallApiEvent) {
        emit(const MessageLoading(
          isLoading: true,
          messageList: [],
        ));
        await messageService.sendMessage(
          userId: event.userId,
          description: event.message,
          errorCallBack: (appError) {
            emit(ReportError(
                mErrorMsg: appError,
                isLoading: false,
                messageList: state.messageList));
          },
          sendMessage: (chatList) {
            emit(GetMessageSuccess(
                isLoading: false, messageList: state.messageList));
          },
        );
      } else if (event is GetMessageHistoryApiEvent) {
        emit(const MessageLoading(
          isLoading: true,
          messageList: [],
        ));
        await messageService.getMessageList(
          errorCallBack: (appError) {
            emit(ReportError(
                mErrorMsg: appError,
                isLoading: false,
                messageList: state.messageList));
          },
          messageList: (chatList) {
            emit(GetMessageSuccess(isLoading: false, messageList: chatList));
          },
        );
      }
    });
  }
}
