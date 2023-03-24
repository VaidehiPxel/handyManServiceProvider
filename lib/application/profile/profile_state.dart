part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  final bool isLoading;
  final ProfileModel profileModel;
  const ProfileState({required this.isLoading, required this.profileModel});

  @override
  List<Object> get props => [
        isLoading,
        profileModel,
      ];
}

class ProfileInitial extends ProfileState {
  const ProfileInitial({required super.isLoading, required super.profileModel});
  @override
  List<Object> get props => [
        isLoading,
        profileModel,
      ];
}

class ProfileStateLoading extends ProfileState {
  const ProfileStateLoading({
    required super.isLoading,
    required super.profileModel,
  });
  @override
  List<Object> get props => [isLoading, profileModel];
}

class ProfileStateUpdateLoading extends ProfileState {
  const ProfileStateUpdateLoading({
    required super.isLoading,
    required super.profileModel,
  });
  @override
  List<Object> get props => [isLoading, profileModel];
}

class ProfileStateMessage extends ProfileState {
  final String msg;
  const ProfileStateMessage(
      {required this.msg,
      required super.isLoading,
      required super.profileModel});
  @override
  List<Object> get props => [
        msg,
        isLoading,
        profileModel,
      ];
}

class ProfileStateError extends ProfileState {
  final String? mErrorMsg;
  const ProfileStateError(
      {this.mErrorMsg, required super.isLoading, required super.profileModel});
  @override
  List<Object> get props => [
        mErrorMsg!,
        isLoading,
        profileModel,
      ];
}

class ProfileUpdateStateError extends ProfileState {
  final String? mErrorMsg;
  const ProfileUpdateStateError(
      {this.mErrorMsg, required super.isLoading, required super.profileModel});
  @override
  List<Object> get props => [
        mErrorMsg!,
        isLoading,
        profileModel,
      ];
}

class ProfileStateSuccess extends ProfileState {
  const ProfileStateSuccess({
    required super.isLoading,
    required super.profileModel,
  });
  @override
  List<Object> get props => [
        isLoading,
        profileModel,
      ];
}

