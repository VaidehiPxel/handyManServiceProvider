import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/Navigation.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/presentation/drawer/constants/string_constant.dart';
import 'package:flutter_projects/presentation/drawer/screens/faq_screen.dart';
import 'package:flutter_projects/presentation/drawer/screens/help_screen.dart';
import 'package:flutter_projects/presentation/drawer/screens/terms_screen.dart';
import 'package:flutter_projects/presentation/home/constants/string_constant.dart';
import 'package:flutter_projects/presentation/home/widget/blue_box_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class DrawerWidget extends StatelessWidget {
  final int currentIndex;
  const DrawerWidget({Key? key,required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width - 60,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
           SizedBox(
            height: kToolbarHeight-1.h,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
            },
            trailing: Padding(
              padding:  EdgeInsets.only(right: 2.w),
              child: SvgPicture.asset(ImageString.closeSvg),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 5.w,),
              CircleAvatar(
                radius: 25.sp,
              ),
            SizedBox(width: 3.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Lonnie Murphy",style: TextStyle(
                  color: Colors.black,
                  fontFamily: AppFonts.poppinsSemiBold,
                  fontSize: 14.sp
                ),),
                Text("Lonnie.murphy@gmail.com",style: TextStyle(
                    color: AppTheme.MedGrey,
                    fontFamily: AppFonts.poppins,
                    fontSize: 10.sp
                ),),
              ],
            )
            ],
          ),
          const SizedBox(
            height: kToolbarHeight,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlueBoxText(
              showBold: true,
              text: DrawerString.notification,
              onTap: () {
                callNextScreen(context, const FAQSScreen());
              },
              showBlueBox: currentIndex == 0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlueBoxText(
              showBold: true,
              text: DrawerString.payment,
              onTap: () {
                callNextScreen(context, const FAQSScreen());
              },
              showBlueBox: currentIndex == 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlueBoxText(
              showBold: true,
              text: DrawerString.changePassword,
              onTap: () {
                callNextScreen(context, const FAQSScreen());
              },
              showBlueBox: currentIndex == 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlueBoxText(
              showBold: true,
              text: DrawerString.faqs,
              onTap: () {
                callNextScreen(context, const FAQSScreen());
              },
              showBlueBox: currentIndex == 3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlueBoxText(
              showBold: true,
              text: DrawerString.help,
              onTap: () {
                callNextScreen(context, const HelpScreen());
              },
              showBlueBox: currentIndex == 4,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlueBoxText(
              showBold: true,
              text: DrawerString.tandc,
              onTap: () {
                callNextScreen(context, const TAndCScreen());
              },
              showBlueBox: currentIndex == 5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlueBoxText(
              showBold: true,
              text: DrawerString.logOut,
              onTap: () {},
              showBlueBox: currentIndex == 6,
            ),
          ),
        ],
      ),
    );
  }
}
