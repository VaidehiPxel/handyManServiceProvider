import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/constants/app_constants.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:flutter_projects/_core/custom_widgets/profile_item_widget.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';

import 'package:sizer/sizer.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int currentIndex = 0;
  bool showEdit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      extendBodyBehindAppBar: true,

      body: SingleChildScrollView(
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
                        decoration:  BoxDecoration(
                          color: Colors.blue.shade700,
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
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
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  showProviderUserData(context, showEdit),
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
                          margin:  EdgeInsets.only(bottom: 40.sp),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius:  BorderRadius.all(
                                Radius.circular(50.sp)),
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
                              borderRadius: BorderRadius.all(
                                  Radius.circular(155.0)),
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
      ),
    );
  }

  Widget showProviderUserData(context, bool showEdit) {
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
              ...mPersonalDetailsWidget(context, showEdit),
              //Work Experience
              ...mWorkExperience(context, showEdit),
              //Service Categories
              ...mServiceCategories(context, showEdit),
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
                child: const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    AppString.submit,
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

  List<Widget> mPersonalDetailsWidget(context, bool showEdit) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Personal Detail",
            style: TextStyle(
              color: AppTheme.black,
              fontSize: 12.sp,
              fontFamily: AppFonts.poppinsMed,
              fontWeight: FontWeight.bold,
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
                child: const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    AppString.edit,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: AppTheme.messageGrey,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      SizedBox(
        height: 4.sp,
      ),
      ProfileItemWidget(
        key: UniqueKey(),
        profileItemType: ProfileItemType.Text,
        assetName: AppAssets.person,
        title: "First Name",
        isEdit: showEdit,
        value: "Lonnie Murphy",
      ),
      ProfileItemWidget(
        key: UniqueKey(),
        profileItemType: ProfileItemType.Text,
        assetName: AppAssets.person,
        title: "Last Name",
        isEdit: showEdit,
        value: "Lonnie Murphy",
      ),
      ProfileItemWidget(
        key: UniqueKey(),
        profileItemType: ProfileItemType.Text,
        assetName: AppAssets.emailSvg,
        title: "Email",
        isEdit: showEdit,
        value: "lonnie.murphy@gmail.com",
      ),
      ProfileItemWidget(
        key: UniqueKey(),
        profileItemType: ProfileItemType.Text,
        assetName: AppAssets.calSvg,
        title: "Mobile Number",
        isEdit: showEdit,
        value: "+230 5763 6925",
      ),
      ProfileItemWidget(
        key: UniqueKey(),
        profileItemType: ProfileItemType.Multiline,
        assetName: AppAssets.introSvg,
        title: "Introduction Description",
        isEdit: showEdit,
        value:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tincidunt leo a neque accumsan posuere. Nullam a purus congue,",
      ),
      SizedBox(
        height: 4.sp,
      ),
    ];
  }

  List<Widget> mWorkExperience(context, bool showEdit) {
    return [
      Text(
        "Work Experience",
        style: TextStyle(
          color: AppTheme.black,
          fontSize: 12.sp,
          fontFamily: AppFonts.poppinsMed,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 4.sp,
      ),
      ProfileItemWidget(
        key: UniqueKey(),
        profileItemType: ProfileItemType.Text,
        assetName: AppAssets.workSvg,
        title: "Work Experience",
        isEdit: showEdit,
        value: "5-6 Years",
      ),
      SizedBox(
        height: 4.sp,
      ),
    ];
  }

  List<Widget> mServiceCategories(context, bool showEdit) {
    return [
      Text(
        "Service Categories",
        style: TextStyle(
          color: AppTheme.black,
          fontSize: 12.sp,
          fontFamily: AppFonts.poppinsMed,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 4.sp,
      ),
      ProfileItemWidget(
        key: UniqueKey(),
        profileItemType: ProfileItemType.Dropdown,
        assetName: AppAssets.serviceSvg,
        title: "Service Categories",
        isEdit: showEdit,
        value: "Cleaning",
        items: ["Select Service", "Cleaning"],
      ),
      ProfileItemWidget(
        key: UniqueKey(),
        profileItemType: ProfileItemType.Dropdown,
        assetName: AppAssets.serviceSvg,
        title: "Service Area",
        isEdit: showEdit,
        value: "Wales",
        items: ["Select Service Area", "Wales"],
      ),
      ProfileItemWidget(
        key: UniqueKey(),
        profileItemType: ProfileItemType.Text,
        assetName: AppAssets.chargeSvg,
        title: "Service Charges",
        isEdit: showEdit,
        value: "₹ 399",
      ),
      ProfileItemWidget(
        key: UniqueKey(),
        profileItemType: ProfileItemType.Text,
        assetName: AppAssets.time,
        title: "Working Hours",
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
        "Education Details",
        style: TextStyle(
          color: AppTheme.black,
          fontSize: 12.sp,
          fontFamily: AppFonts.poppinsMed,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 4.sp,
      ),
      ProfileItemWidget(
        key: UniqueKey(),
        profileItemType: ProfileItemType.Dropdown,
        assetName: AppAssets.eduSvg,
        title: "Education Details",
        isEdit: showEdit,
        value: "University of Wales, Swansea",
        items: ["Select", "University of Wales, Swansea"],
      ),
      ProfileItemWidget(
        key: UniqueKey(),
        profileItemType: ProfileItemType.Upload,
        assetName: AppAssets.certiSvg,
        title: "Upload Certificate",
        isEdit: showEdit,
        value: "Uploaded Certificate",
      ),
      ProfileItemWidget(
        key: UniqueKey(),
        profileItemType: ProfileItemType.Multiline,
        assetName: AppAssets.extraCourseSvg,
        title: "Extra Course Details",
        isEdit: showEdit,
        value:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tincidunt leo a neque accumsan posuere. Nullam a purus congue,",
      ),
    ];
  }
}
