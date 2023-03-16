import 'package:equatable/equatable.dart';

abstract class HelpState extends Equatable {
  const HelpState();

  @override
  List<Object> get props => [];
}

class HelpInitial extends HelpState {}

class HelpLoading extends HelpState {}

class HelpSuccess extends HelpState {}

class HelpError extends HelpState {
  final String? mErrorMsg;
  const HelpError({this.mErrorMsg});
  @override
  List<Object> get props => [mErrorMsg!];
}


class HelpShowMessage extends HelpState {
  final String msg;
  const HelpShowMessage({required this.msg});
  @override
  List<Object> get props => [msg];
}

