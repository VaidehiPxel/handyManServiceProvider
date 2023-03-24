part of 'change_password_bloc.dart';

abstract class ChangePasswordState extends Equatable {
  final bool isLoading;
  const ChangePasswordState({required this.isLoading});

  @override
  List<Object> get props => [
        isLoading,
      ];
}

class ChangePasswordInitial extends ChangePasswordState {
  const ChangePasswordInitial({required super.isLoading});
}

class ChangePasswordStateMessage extends ChangePasswordState {
  final String msg;
  const ChangePasswordStateMessage(
      {required this.msg, required super.isLoading});
  @override
  List<Object> get props => [
        msg,
        isLoading,
      ];
}

class ChangePasswordStateError extends ChangePasswordState {
  final String? mErrorMsg;
  const ChangePasswordStateError({this.mErrorMsg, required super.isLoading});
  @override
  List<Object> get props => [
        mErrorMsg!,
        isLoading,
      ];
}

class ChangePasswordLoading extends ChangePasswordState {
  const ChangePasswordLoading({required super.isLoading});
}

class ChangePasswordSuccess extends ChangePasswordState {
  const ChangePasswordSuccess({required super.isLoading});
}
