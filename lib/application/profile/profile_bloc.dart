import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_projects/services/profile_service.dart';

import '../../model/profile/profile_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileService profileService;
  ProfileModel profileModel =
      ProfileModel(getserviceproviderdetails: [], message: "", status: "");
  ProfileBloc({required this.profileService})
      : super(ProfileInitial(isLoading: true, profileModel: ProfileModel(
            // getuseraddress: [],
            getserviceproviderdetails: [], message: "", status: ""))) {
    on<ProfileEvent>((event, emit) async {
      emit(ProfileStateLoading(isLoading: true, profileModel: profileModel));
      if (event is ProfileCallApiGetProfileEvent) {
        await profileService.getSPProfileByID(
          errorCallBack: (appError) {
            emit(ProfileStateError(
                mErrorMsg: appError,
                profileModel: state.profileModel,
                isLoading: false));
          },
          profileServiceSuccess: (profileModel) {
            this.profileModel = profileModel;
            emit(ProfileStateSuccess(
                isLoading: false, profileModel: profileModel));
          },
        );
      }
      if (event is ProfileCallApiPutProfileEvent) {
        await profileService.putUserProfile(
          profileModel: event.profileModel,
          errorCallBack: (appError) {
            emit(ProfileUpdateStateError(
                mErrorMsg: appError,
                profileModel: state.profileModel,
                isLoading: false));
          },
          profileServiceSuccess: (profileModel) {
            this.profileModel = profileModel;
            emit(ProfileStateSuccess(
                isLoading: false, profileModel: profileModel));
          },
        );
      }
    });
  }
}
