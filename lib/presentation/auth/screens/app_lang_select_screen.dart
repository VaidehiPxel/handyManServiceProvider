import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/navigation.dart';
import 'package:flutter_projects/presentation/auth/constants/image_constant.dart';
import 'package:flutter_projects/presentation/auth/constants/string_constant.dart';
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
            Expanded(flex: 2, child: Image.asset(AuthImageString.appLogo)),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                   Text(
                    AuthString.selectLang,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CTA(
                        onTap: () {
                          setState(() {
                            selectedLang = 0;
                            callNextScreen(context, const LoginScreen());
                          });
                        },
                        bgColor: Colors.white,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      CTA(
                        onTap: () {
                          setState(() {
                            selectedLang = 1;
                            callNextScreen(context, const LoginScreen());
                          });
                        },
                        bgColor: Colors.black,
                        title: AuthString.french,
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
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
  const CTA({Key? key, this.bgColor, this.onTap, this.title, this.textColor})
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
          title ?? AuthString.english,
          style: TextStyle(
            color: textColor ?? Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
