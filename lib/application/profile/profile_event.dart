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

class ProfileCallAddNewAddressListEvent extends ProfileEvent {
  final Getuseraddress getuseraddress;
  final UserAddressList userAddressList;
  const ProfileCallAddNewAddressListEvent(
      {required this.getuseraddress, required this.userAddressList});

  @override
  List<Object> get props => [getuseraddress, userAddressList];
}

class ProfileCallEditAddressListEvent extends ProfileEvent {
  final Getuseraddress getuseraddress;
  final UserAddressList userAddressList;
  const ProfileCallEditAddressListEvent(
      {required this.getuseraddress, required this.userAddressList});

  @override
  List<Object> get props => [
        getuseraddress,
        userAddressList,
      ];
}

class ProfileCallRemoveAddressListEvent extends ProfileEvent {
  final int id;
  final UserAddressList userAddressList;
  const ProfileCallRemoveAddressListEvent(
      {required this.id, required this.userAddressList});

  @override
  List<Object> get props => [
        id,
        userAddressList,
      ];
}

class ProfileCallSetDefaultAddressListEvent extends ProfileEvent {
  final int id;
  final UserAddressList userAddressList;
  const ProfileCallSetDefaultAddressListEvent(
      {required this.id, required this.userAddressList});

  @override
  List<Object> get props => [
        id,
        userAddressList,
      ];
}
