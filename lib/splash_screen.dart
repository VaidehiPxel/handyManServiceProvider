import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/constants/hive_constant.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/presentation/auth/screens/app_lang_select_screen.dart';
import 'package:flutter_projects/presentation/auth/widget/app_bg_widget.dart';
import 'package:flutter_projects/presentation/dashboard/screens/dashboard.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => returnScreen())));
  }

  returnScreen() {
    // if (HiveConstants.instances.box1.get(box1.langKey) != null) {
    if (HiveConstants.instances.box1.get(HiveConstants.userIdKey) == null) {
      return const AppLangSelectScreen();
    } else {
      return const DashBoard();
    }
    // } else {
    //   return const AppLangSelectScreen();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: AppBGWidget(
        body: Column(
          children: [
            Expanded(flex: 2, child: Image.asset(AppAssets.appLogo)),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 12.h,
        child: Center(
          child: Text(
            "Version 1.00.00",
            style: TextStyle(
                color: Colors.white,
                fontSize: 10.sp,
                fontFamily: AppFonts.poppinsMed),
          ),
        ),
      ),
    );
  }
}
