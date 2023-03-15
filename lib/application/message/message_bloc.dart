import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/model/message/message_list_model.dart';

import 'package:flutter_projects/services/message_service.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final MessageService messageService;

  MessageBloc({required this.messageService})
      : super(const MessageInitial(
          isLoading: true,
        )) {
    on<MessageEvent>((event, emit) async {
      if (event is GetMessageListCallApiEvent) {
        emit(const MessageLoading(
          isLoading: true,
        ));
        await messageService.getMessageList(
          errorCallBack: (appError) {
            emit(ReportError(
              mErrorMsg: appError,
              isLoading: false,
            ));
          },
          messageList: (chatList) {
            emit(GetMessageSuccess(isLoading: false, messageList: chatList));
          },
        );
      } else if (event is SendMessageCallApiEvent) {
        await messageService.sendMessage(
          userId: event.userId,
          description: event.message,
          errorCallBack: (appError) {
            emit(ReportError(
              mErrorMsg: appError,
              isLoading: false,
            ));
          },
          sendMessage: (isSend) {
            emit(SendMessageSuccess(isLoading: false, isSend: isSend));
          },
        );
      } else if (event is GetMessageHistoryApiEvent) {
        emit(const MessageLoading(
          isLoading: true,
        ));
        await messageService.getChatHistory(
          userId: event.userId,
          errorCallBack: (appError) {
            emit(ReportError(
              mErrorMsg: appError,
              isLoading: false,
            ));
          },
          chatHistory: (historyList) {
            emit(GetHistorySuccess(isLoading: false, historyList: historyList));
          },
        );
      }
    });
  }
}
