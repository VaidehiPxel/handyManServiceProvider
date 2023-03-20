import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/message/message_list_model.dart';
import 'package:flutter_projects/services/message_service.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final MessageService messageService;

  MessageBloc({required this.messageService})
      : super(MessageInitial(
          isLoading: true,
          messageList: [],
          historyList: [],
        )) {
    on<MessageEvent>((event, emit) async {
      if (event is GetMessageListCallApiEvent) {
        emit(MessageLoading(
          isLoading: true,
          messageList: [],
          historyList: [],
        ));
        await messageService.getMessageList(
          errorCallBack: (appError) {
            emit(ReportError(
              mErrorMsg: appError,
              isLoading: false,
              messageList: state.messageList,
              historyList: state.historyList,
            ));
          },
          messageList: (chatList) {
            emit(GetMessageSuccess(
              isLoading: false,
              messageList: chatList,
              historyList: state.historyList,
            ));
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
              messageList: state.messageList,
              historyList: state.historyList,
            ));
          },
          sendMessage: (isSend) {
            emit(SendMessageSuccess(
                isLoading: false,
                isSend: isSend,
                messageList: state.messageList,
                historyList: state.historyList));
          },
        );
      } else if (event is GetMessageHistoryApiEvent) {
        emit(MessageLoading(
          isLoading: true,
          messageList: state.messageList,
          historyList: state.historyList,
        ));
        await messageService.getChatHistory(
          userId: event.userId,
          errorCallBack: (appError) {
            emit(ReportError(
              mErrorMsg: appError,
              isLoading: false,
              messageList: state.messageList,
              historyList: state.historyList,
            ));
          },
          chatHistory: (historyList) {
            emit(GetHistorySuccess(
              isLoading: false,
              historyList: historyList,
              messageList: state.messageList,
            ));
          },
        );
      }
    });
  }
}
