import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/constants/hive_constant.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/presentation/auth/screens/login_screen.dart';
import 'package:flutter_projects/presentation/auth/widget/app_bg_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../_core/navigation.dart';

class AppLangSelectScreen extends StatefulWidget {
  const AppLangSelectScreen({super.key});

  @override
  State<AppLangSelectScreen> createState() => _AppLangSelectScreenState();
}

class _AppLangSelectScreenState extends State<AppLangSelectScreen> {
  int selectedLang = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBGWidget(
        body: Column(
          children: [
            Expanded(flex: 2, child: Image.asset(AppAssets.appLogo)),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    LocaleKeys.selectLang.tr(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFonts.poppinsBold,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CTA(
                        onTap: () async {
                          print(context.locale.toString());
                          if (context.locale.toString().compareTo("fr") == 0) {
                            await context.setLocale(const Locale('en'));
                          }
                          setState(() {
                            selectedLang = 0;
                          });
                        },
                        bgColor:
                            selectedLang == 0 ? Colors.white : AppTheme.black,
                        textColor:
                            selectedLang == 0 ? Colors.black : AppTheme.white,
                        title: LocaleKeys.english.tr(),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      CTA(
                        onTap: () async {
                          print(context.locale.toString());
                          if (context.locale.toString().compareTo("en") == 0) {
                            await context.setLocale(const Locale('fr'));
                          }
                          setState(() {
                            selectedLang = 1;
                          });
                          print(context.locale.toString());
                        },
                        bgColor:
                            selectedLang == 1 ? Colors.white : AppTheme.black,
                        textColor:
                            selectedLang == 1 ? Colors.black : AppTheme.white,
                        title: LocaleKeys.french.tr(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  _SelectLangCTA(context)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _SelectLangCTA(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        onPressed: () {
          HiveConstants.instances.box1
              .put(HiveConstants.langKey, context.locale.languageCode);
          callNextScreen(context, const LoginScreen());
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 1.h),
          child: Text(
            LocaleKeys.continueS.tr(),
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontFamily: AppFonts.poppinsMed),
          ),
        ),
      ),
    );
  }
}

class CTA extends StatelessWidget {
  final Color? bgColor;
  final VoidCallback? onTap;
  final String? title;
  final Color? textColor;
  final double? elevation;
  const CTA(
      {Key? key,
      this.bgColor,
      this.onTap,
      this.title,
      this.textColor,
      this.elevation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor ?? Colors.white,
        elevation: elevation ?? 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onTap ?? () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.2.h),
        child: Text(
          title.toString(),
          style: TextStyle(
            color: textColor ?? Colors.black,
            fontSize: 14.sp,
            fontFamily: AppFonts.poppinsMed,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
