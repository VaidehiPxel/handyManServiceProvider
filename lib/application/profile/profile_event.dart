part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileCallApiGetProfileEvent extends ProfileEvent {}

class ProfileCallApiGetAddressListEvent extends ProfileEvent {}

class ProfileCallApiPutProfileEvent extends ProfileEvent {
  final ProfileModel profileModel;

  const ProfileCallApiPutProfileEvent({required this.profileModel});

  @override
  List<Object> get props => [profileModel];
}

