import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/Navigation.dart';
import 'package:flutter_projects/_core/constants/hive_constant.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/constants/app_string.g.dart';
import 'package:flutter_projects/_core/custom_dialogs/logout_dialog.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/presentation/auth/screens/change_password.dart';
import 'package:flutter_projects/presentation/dashboard/home/widget/blue_box_text.dart';
import 'package:flutter_projects/presentation/dashboard/notification/screen/notification_screen.dart';
import 'package:flutter_projects/presentation/dashboard/screens/dashboard.dart';

import 'package:flutter_projects/presentation/drawer/screens/faq_screen.dart';
import 'package:flutter_projects/presentation/drawer/screens/help_screen.dart';
import 'package:flutter_projects/presentation/drawer/screens/lang_selection.dart';
import 'package:flutter_projects/presentation/drawer/screens/rating_review.dart';
import 'package:flutter_projects/presentation/drawer/screens/report_listing.dart';
import 'package:flutter_projects/presentation/drawer/screens/terms_screen.dart';
import 'package:flutter_projects/presentation/payment/payment_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class DrawerWidget extends StatelessWidget {
  final int currentIndex;
  const DrawerWidget({Key? key, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width - 60,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: kToolbarHeight - 1.h,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
            },
            trailing: Padding(
              padding: EdgeInsets.only(right: 2.w),
              child: SvgPicture.asset(AppAssets.closeSvg),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 5.w,
              ),
              Container(
                padding: EdgeInsets.all(4.5.sp), // Border width
                decoration: const BoxDecoration(
                    color: AppTheme.greyBorder, shape: BoxShape.circle),
                child: ClipOval(
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(25.sp), // Image radius
                    child: HiveConstants.instances.box1
                                .get(HiveConstants.userProfileKey) ==
                            null
                        ? Image.asset(AppAssets.profileThumb)
                        : Image.network(
                            HiveConstants.instances.box1
                                .get(HiveConstants.userProfileKey),
                            fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(
                width: 3.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    HiveConstants.instances.box1.get(HiveConstants.userNameKey),
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: AppFonts.poppinsSemiBold,
                        fontSize: 14.sp),
                  ),
                  Text(
                    HiveConstants.instances.box1
                        .get(HiveConstants.userEmailKey),
                    style: TextStyle(
                        color: AppTheme.medGrey,
                        fontFamily: AppFonts.poppins,
                        fontSize: 10.sp),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: kToolbarHeight - 20.sp,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlueBoxText(
              showBold: true,
              text: LocaleKeys.dashboard.tr(),
              onTap: () {
                callNextScreen(context, const DashBoard());
              },
              showBlueBox: currentIndex == 0,
              showSelected: currentIndex == 0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlueBoxText(
              showBold: true,
              text: LocaleKeys.notification.tr(),
              onTap: () {
                callNextScreen(context, const NotificationScreen());
              },
              showBlueBox: currentIndex == 1,
              showSelected: currentIndex == 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlueBoxText(
              showBold: true,
              text: LocaleKeys.payment.tr(),
              onTap: () {
                callNextScreen(context, const PaymentScreen());
              },
              showBlueBox: currentIndex == 2,
              showSelected: currentIndex == 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlueBoxText(
              showBold: true,
              text: LocaleKeys.reviewAndRating.tr(),
              onTap: () {
                callNextScreen(context, const RatingAndReviewScreen());
              },
              showBlueBox: currentIndex == 3,
              showSelected: currentIndex == 3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlueBoxText(
              showBold: true,
              text: LocaleKeys.myComplaints.tr(),
              onTap: () {
                callNextScreen(context, const ReportAndComplaint());
              },
              showBlueBox: currentIndex == 4,
              showSelected: currentIndex == 4,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlueBoxText(
              showBold: true,
              text: LocaleKeys.changePassword.tr(),
              onTap: () {
                callNextScreen(context, const ChangePassword());
              },
              showBlueBox: currentIndex == 5,
              showSelected: currentIndex == 5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlueBoxText(
              showBold: true,
              text: LocaleKeys.faqs.tr(),
              onTap: () {
                callNextScreen(context, const FAQSScreen());
              },
              showBlueBox: currentIndex == 6,
              showSelected: currentIndex == 6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlueBoxText(
              showBold: true,
              text: LocaleKeys.help.tr(),
              onTap: () {
                callNextScreen(context, const HelpScreen());
              },
              showBlueBox: currentIndex == 7,
              showSelected: currentIndex == 7,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlueBoxText(
              showBold: true,
              text: LocaleKeys.termsCondition.tr(),
              onTap: () {
                callNextScreen(context, const TAndCScreen());
              },
              showBlueBox: currentIndex == 8,
              showSelected: currentIndex == 8,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlueBoxText(
              showBold: true,
              text: LocaleKeys.langSelection.tr(),
              onTap: () {
                callNextScreen(context, const LanguageSelectionScreen());
              },
              showBlueBox: currentIndex == 9,
              showSelected: currentIndex == 9,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlueBoxText(
              showBold: true,
              text: LocaleKeys.logOut.tr(),
              onTap: () {
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const LogOutDialogBox();
                    });
              },
              showBlueBox: currentIndex == 10,
              showSelected: currentIndex == 10,
            ),
          ),
        ],
      ),
    );
  }
}
