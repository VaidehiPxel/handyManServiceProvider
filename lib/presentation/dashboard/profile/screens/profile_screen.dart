import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/_core/Navigation.dart';
import 'package:flutter_projects/_core/constants/app_constants.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/constants/app_string.g.dart';
import 'package:flutter_projects/_core/custom_widgets/api_loader.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';
import 'package:flutter_projects/_core/custom_widgets/profile_item_widget.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/application/profile/profile_bloc.dart';
import 'package:flutter_projects/model/profile/profile_model.dart';
import 'package:flutter_projects/presentation/dashboard/notification/screen/notification_screen.dart';

import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int currentIndex = 0;
  var items = [
    LocaleKeys.english.tr(),
    LocaleKeys.french.tr(),
  ];
  String dropdownvalue = 'English';
  bool showEdit = false;

  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(ProfileCallApiGetProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        print(state.runtimeType);
        if (state is ProfileStateMessage ||
            state is ProfileStateError ||
            state is ProfileUpdateStateError) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(
                  (state is ProfileStateMessage)
                      ? state.msg
                      : (state is ProfileStateError)
                          ? state.mErrorMsg.toString()
                          : "",
                  style: const TextStyle(color: Colors.black),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "ok",
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              );
            },
          );
        }
      },
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: EazylifeAppBar(
              title: LocaleKeys.profile.tr(),
              leadIcon: AppAssets.backIcon,
              onPressed: () {
                Navigator.pop(context);
              },
              sideOnPressed: () {
                callNextScreen(context, const NotificationScreen());
              },
              sideIcon: AppAssets.notifications,
            ),
            body: (state.isLoading)
                ? const Center(child: APILoader())
                : renderBodyView(context, state),
          );
        },
      ),
    );
  }

  SingleChildScrollView renderBodyView(
      BuildContext context, ProfileState state) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 180.sp,
                  width: MediaQuery.of(context).size.width,
                  child: ClipPath(
                    clipper: CustomClipperPath(),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade700,
                        shape: BoxShape.rectangle,
                        image: const DecorationImage(
                          image: AssetImage(AppAssets.appBg),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    "Lonnie Murphy",
                    style: TextStyle(
                      color: AppTheme.black,
                      fontSize: 18.sp,
                      fontFamily: AppFonts.poppinsSemiBold,
                    ),
                  ),
                ),
                showProviderUserData(context, showEdit, state.profileModel),
              ],
            ),
            Positioned(
              top: 14.5.h,
              left: 0,
              right: 0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 130.sp,
                    width: 130.sp,
                    child: Center(
                      child: Container(
                        height: 90.sp,
                        width: 90.sp,
                        margin: EdgeInsets.only(bottom: 40.sp),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.sp)),
                          color: Colors.amber,
                          border: Border.all(
                            color: Colors.white,
                            width: 4,
                            strokeAlign: StrokeAlign.outside,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    top: 40.sp,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: Center(
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.all(Radius.circular(155.0)),
                            color: Colors.blue,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget showProviderUserData(
      context, bool showEdit, ProfileModel profileModel) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          margin: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 6.sp),
          decoration: BoxDecoration(
            color: AppTheme.lightGrey,
            borderRadius: BorderRadius.circular(8),
            shape: BoxShape.rectangle,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Personal Detail
              ...mPersonalDetailsWidget(context, showEdit, profileModel),
              //Work Experience
              ...mWorkExperience(context, showEdit,profileModel),
              //Service Categories
              ...mServiceCategories(context, showEdit,profileModel),
              //Educational Details
              ...mEducationalDetails(context, showEdit),
            ],
          ),
        ),
        if (showEdit == true) ...[
          SizedBox(
            width: 100.w,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 8.sp),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0082EB),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    this.showEdit = false;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    LocaleKeys.submit.tr(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 34.sp,
          ),
        ],
        SizedBox(
          height: 6.5.h,
        ),
      ],
    );
  }

  List<Widget> mPersonalDetailsWidget(
      context, bool showEdit, ProfileModel profileModel) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            LocaleKeys.personalDetail.tr(),
            style: TextStyle(
              color: AppTheme.black,
              fontSize: 12.sp,
              fontFamily: AppFonts.poppinsMed,
            ),
          ),
          if (showEdit == false)
            GestureDetector(
              onTap: () {
                setState(() {
                  this.showEdit = true;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(
                  right: 12.sp,
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    LocaleKeys.edit.tr(),
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: AppTheme.messageGrey,
                        fontSize: 14,
                        fontFamily: AppFonts.poppinsMed),
                  ),
                ),
              ),
            ),
        ],
      ),
      SizedBox(
        height: 1.5.h,
      ),
      ProfileItemWidget(
        onChange: (String value) {
          setState(() {
            profileModel.getserviceproviderdetails.first.setFirstName = value;
          });
        },
        isEdit: showEdit,
        value: profileModel.getFirstName(),
        key: UniqueKey(),
        profileItemType: ProfileItemType.Text,
        assetName: AppAssets.person,
        title: LocaleKeys.firstName.tr(),
        widget: Text(profileModel.getFirstName()),
      ),
      ProfileItemWidget(
        key: UniqueKey(),
        onChange: (String value) {
          setState(() {
            profileModel.getserviceproviderdetails.first.setLastName = value;
          });
        },
        profileItemType: ProfileItemType.Text,
        assetName: AppAssets.person,
        isEdit: showEdit,
        value: profileModel.getLastName(),
        title: LocaleKeys.lastName.tr(),
        widget: Text(profileModel.getLastName()),
      ),
      ProfileItemWidget(
        key: UniqueKey(),
        onChange: (String value) {
          setState(() {
            profileModel.getserviceproviderdetails.first.setEmail = value;
          });
        },
        profileItemType: ProfileItemType.Text,
        assetName: AppAssets.emailSvg,
        isEdit: showEdit,
        value: profileModel.getEmail(),
        title: LocaleKeys.email.tr(),
        widget: Text(profileModel.getEmail()),
      ),
      ProfileItemWidget(
        key: UniqueKey(),
        onChange: (String value) {
          setState(() {
            profileModel.getserviceproviderdetails.first.setMobileNo = value;
          });
        },
        profileItemType: ProfileItemType.Text,
        assetName: AppAssets.calSvg,
        isEdit: showEdit,
        value: profileModel.getMobile(),
        title: LocaleKeys.mobileNumber.tr(),
        widget: Text(profileModel.getMobile()),
      ),
      ProfileItemWidget(
        key: UniqueKey(),
        onChange: (String value) {
          setState(() {
            profileModel.getserviceproviderdetails.first.setIntroduction =
                value;
          });
        },
        profileItemType: ProfileItemType.Multiline,
        assetName: AppAssets.introSvg,
        isEdit: showEdit,
        value: profileModel.getIntroduction(),
        title: LocaleKeys.introDesc.tr(),
        widget: Text(profileModel.getIntroduction()),
      ),
      SizedBox(
        height: 4.sp,
      ),
    ];
  }

  List<Widget> mWorkExperience(context, bool showEdit, ProfileModel profileModel) {
    return [
      Text(
        LocaleKeys.workExperience.tr(),
        style: TextStyle(
          color: AppTheme.black,
          fontSize: 12.sp,
          fontFamily: AppFonts.poppinsMed,
        ),
      ),
      SizedBox(
        height: 1.5.h,
      ),
       ProfileItemWidget(
        key: UniqueKey(),
        onChange: (String value) {
          setState(() {
            profileModel.getserviceproviderdetails.first.setIntroduction =
                value;
          });
        },
        profileItemType: ProfileItemType.Multiline,
        assetName: AppAssets.introSvg,
        isEdit: showEdit,
        value: profileModel.getIntroduction(),
        title: LocaleKeys.introDesc.tr(),
        widget: Text(profileModel.getIntroduction()),
      ),
      ProfileItemWidget(
        key: UniqueKey(),
        profileItemType: ProfileItemType.Text,
        assetName: AppAssets.workSvg,
        isEdit: showEdit,
         onChange: (String value) {
          setState(() {
            profileModel.getserviceproviderdetails.first.setExperience =
                value;
          });
        },
        title: LocaleKeys.workExperience.tr(),
        widget: Text(profileModel.getExperience()),
        value: profileModel.getExperience()+"Years",
      ),

      SizedBox(
        height: 4.sp,
      ),
    ];
  }

  List<Widget> mServiceCategories(context, bool showEdit, ProfileModel profileModel) {
    return [
      Text(
        LocaleKeys.serviceCategories.tr(),
        style: TextStyle(
          color: AppTheme.black,
          fontSize: 12.sp,
          fontFamily: AppFonts.poppinsMed,
        ),
      ),
      SizedBox(
        height: 1.5.h,
      ),
      ProfileItemWidget(
        key: UniqueKey(),
        profileItemType: ProfileItemType.Dropdown,
        assetName: AppAssets.serviceSvg,
        isEdit: showEdit,
    
        items: const ["Select Service", "Cleaning"],
         onChange: (String value) {
          setState(() {
            profileModel.getserviceproviderdetails.first.setCategory =
                value;
          });
        },
        title: LocaleKeys.serviceCategories.tr(),
        widget: Text(profileModel.getCategory()),
        value: profileModel.getCategory(),
      ),
      ProfileItemWidget(
        key: UniqueKey(),
        profileItemType: ProfileItemType.Dropdown,
        assetName: AppAssets.serviceSvg,
        title: LocaleKeys.serviceArea,
        isEdit: showEdit,
        value: "Wales",
        items: const ["Select Service Area", "Wales"],
      ),
      ProfileItemWidget(
        key: UniqueKey(),
        profileItemType: ProfileItemType.Text,
        assetName: AppAssets.chargeSvg,
        title: LocaleKeys.serviceCharges,
        isEdit: showEdit,
        value: "₹ 399",
      ),
      ProfileItemWidget(
        key: UniqueKey(),
        profileItemType: ProfileItemType.Text,
        assetName: AppAssets.time,
        title: LocaleKeys.workingHours,
        isEdit: showEdit,
        value: "9 AM To 9 PM",
      ),
      SizedBox(
        height: 4.sp,
      ),
    ];
  }

  List<Widget> mEducationalDetails(context, bool showEdit) {
    return [
      Text(
        LocaleKeys.educationDetail.tr(),
        style: TextStyle(
          color: AppTheme.black,
          fontSize: 12.sp,
          fontFamily: AppFonts.poppinsMed,
        ),
      ),
      SizedBox(
        height: 1.5.h,
      ),
      // ProfileItemWidget(
      //   key: UniqueKey(),
      //   profileItemType: ProfileItemType.dropdown,
      //   assetName: AppAssets.eduSvg,
      //   title: LocaleKeys.educationDetail,
      //   isEdit: showEdit,
      //   value: "University of Wales, Swansea",
      //   items: const ["Select", "University of Wales, Swansea"],
      // ),
      // ProfileItemWidget(
      //   key: UniqueKey(),
      //   profileItemType: ProfileItemType.upload,
      //   assetName: AppAssets.certiSvg,
      //   title: LocaleKeys.uploadCerti,
      //   isEdit: showEdit,
      //   value: "Uploaded Certificate",
      // ),
      // ProfileItemWidget(
      //   key: UniqueKey(),
      //   profileItemType: ProfileItemType.multiline,
      //   assetName: AppAssets.extraCourseSvg,
      //   title: LocaleKeys.extraCourseDetail,
      //   isEdit: showEdit,
      //   value:
      //       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tincidunt leo a neque accumsan posuere. Nullam a purus congue,",
      // ),
    ];
  }
}
