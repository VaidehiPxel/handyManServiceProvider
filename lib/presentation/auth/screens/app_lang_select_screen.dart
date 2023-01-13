import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:flutter_projects/_core/navigation.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/presentation/auth/widget/app_bg_widget.dart';
import 'package:flutter_projects/presentation/auth/screens/login_screen.dart';
import 'package:sizer/sizer.dart';

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
                    AppString.selectLang,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontFamily: AppFonts.poppinsBold

                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SelectLangBtn(
                        onTap: () {
                          setState(() {
                            selectedLang = 0;
                          });
                        },
                        bgColor:
                        selectedLang == 0 ? Colors.white : AppTheme.black,
                        textColor:
                        selectedLang == 0 ? Colors.black : AppTheme.white,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SelectLangBtn(
                        onTap: () {
                          setState(() {
                            selectedLang = 1;
                          });
                        },
                        bgColor:
                        selectedLang == 1 ? Colors.white : AppTheme.black,
                        textColor:
                        selectedLang == 1 ? Colors.black : AppTheme.white,
                        title: AppString.french,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  _continueCTA(context)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _continueCTA(BuildContext context) {
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
          callNextScreen(context, const LoginScreen());
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 1.h),
          child: Text(
            AppString.continueS,
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

class SelectLangBtn extends StatelessWidget {
  final Color? bgColor;
  final VoidCallback? onTap;
  final String? title;
  final Color? textColor;
  const SelectLangBtn({Key? key, this.bgColor, this.onTap, this.title, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor ?? Colors.white,
      ),
      onPressed: onTap ?? () {},
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 1.2.h),
        child: Text(
          title ?? AppString.english,
          style: TextStyle(
            color: textColor ?? Colors.black,
            fontSize: 14.sp,
              fontFamily: AppFonts.poppinsMed
          ),
        ),
      ),
    );
  }
}
