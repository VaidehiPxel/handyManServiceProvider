
import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';
import 'package:flutter_projects/_core/navigation.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/presentation/dashboard/notification/screen/notification_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class ReportAndComplaintDetailsScreen extends StatefulWidget {
  const ReportAndComplaintDetailsScreen({super.key});

  @override
  State<ReportAndComplaintDetailsScreen> createState() =>
      _ReportAndComplaintDetailsScreenState();
}

class _ReportAndComplaintDetailsScreenState
    extends State<ReportAndComplaintDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD7EAFC),
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: EazylifeAppBar(
        title: "Full Home Cleaning",
        leadIcon: AppAssets.backIcon,
        sideIcon: AppAssets.notificationSvg,
        sideOnPressed: (){
           callNextScreen(context, const NotificationScreen());
        },
      
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
            decoration: const BoxDecoration(
              color: AppTheme.white,
              shape: BoxShape.rectangle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 14.sp,
                ),
                Text(
                  "Full Home Cleaning",
                  style: TextStyle(
                    color: AppTheme.black,
                    fontSize: 14.sp,
                    fontFamily: AppFonts.poppinsSemiBold,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 12.sp,
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do... eiusmod tempor incididunt ut labore et dolore magna Ut. enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                  maxLines: 1000,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: AppTheme.black,
                    fontSize: 10.sp,
                    fontFamily: AppFonts.poppins,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: 8.sp,
                ),
                const Divider(
                  color: AppTheme.dividerBlack,
                ),
                SizedBox(
                  height: 6.sp,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 2, right: 6),
                      child: SvgPicture.asset(
                        AppAssets.calSvg,
                        height: 12.sp,
                        width: 12.sp,
                      ),
                    ),
                    SizedBox(
                      width: 4.sp,
                    ),
                    Text(
                      "24 Sep",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 10.sp,
                        fontFamily: AppFonts.poppins,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      width: 16.sp,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2, right: 6),
                      child: SvgPicture.asset(
                        AppAssets.time,
                        height: 12.sp,
                        width: 12.sp,
                      ),
                    ),
                    SizedBox(
                      width: 4.sp,
                    ),
                    Text(
                      "10:00 AM",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 10.sp,
                        fontFamily: AppFonts.poppins,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 22.sp,
                )
              ],
            ),
          ),
          SizedBox(
            height: 22.sp,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
            child: Text(
            AppString.expertSol,
              style: TextStyle(
                color: AppTheme.black,
                fontSize: 14.sp,
                fontFamily: AppFonts.poppinsSemiBold,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 22.sp,
          ),
          Container(
            margin: EdgeInsets.only(left: 20.sp, right: 20.sp),
            padding: EdgeInsets.all(12.sp),
            decoration: BoxDecoration(
              color: AppTheme.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 0.0,
                  spreadRadius: 0.3,
                  color: Colors.black12,
                ),
              ],
            ),
            child: Column(
              children: [
                Text(AppString.thankYou, style: TextStyle(
                    color: AppTheme.black,
                    fontSize: 16.sp,
                    fontFamily: AppFonts.poppinsSemiBold,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 4.sp,
                ),
                Text(
                AppString.yourMsg,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    color: AppTheme.black,
                    fontSize: 10.sp,
                    fontFamily: AppFonts.poppins,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
