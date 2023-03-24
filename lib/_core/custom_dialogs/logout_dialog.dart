import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/Navigation.dart';
import 'package:flutter_projects/_core/constants/hive_constant.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:flutter_projects/_core/custom_widgets/app_dialog_button.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/presentation/auth/screens/login_screen.dart';
import 'package:sizer/sizer.dart';

class LogOutDialogBox extends StatefulWidget {
  const LogOutDialogBox({super.key});

  @override
  State<LogOutDialogBox> createState() => _LogOutDialogBoxState();
}

class _LogOutDialogBoxState extends State<LogOutDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(2.h),
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.circular(12),
          shape: BoxShape.rectangle,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Log Out",
              style: TextStyle(
                  color: AppTheme.black,
                  fontFamily: AppFonts.poppinsMed,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp),
            ),
            SizedBox(
              height: 6.sp,
            ),
            Text(
              "Are you sure want to Log Out?",
              style: TextStyle(
                  color: AppTheme.black,
                  fontFamily: AppFonts.poppins,
                  fontWeight: FontWeight.normal,
                  fontSize: 10.sp),
            ),
            SizedBox(
              height: 12.sp,
            ),
            SizedBox(
              height: 32.sp,
              width: 80.w,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 1,
                    child: AppDialogButton(
                      backgroundColor: AppTheme.dialogGrey,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      title: LocaleKeys.cancel,
                      titleColor: AppTheme.medGrey,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: AppDialogButton(
                      backgroundColor: AppTheme.blue,
                      onPressed: () {
                        HiveConstants.instances.box1
                            .put(HiveConstants.userIdKey, null);
                        callNextScreen(context, const LoginScreen());
                      },
                      title: LocaleKeys.yes,
                      titleColor: AppTheme.white,
                    ),
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
