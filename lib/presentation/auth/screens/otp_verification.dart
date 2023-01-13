
import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/Navigation.dart';
import 'package:flutter_projects/_core/custom_widgets/eazylife_scaffold.dart';
import 'package:flutter_projects/_core/custom_widgets/otp_text_field.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:flutter_projects/presentation/auth/screens/set_new_password.dart';
import 'package:sizer/sizer.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({super.key});

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  @override
  Widget build(BuildContext context) {
    return EazylifeScaffold(
      children: [
          SizedBox(
          height: 5.h,
        ),
          Center(
          child: Text(
            AppString.otpverification,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
             fontFamily: AppFonts.poppinsBold,
            ),
          ),
        ),
         SizedBox(
          height: 2.h,
        ),
        RichText(
          overflow: TextOverflow.clip,
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
          softWrap: true,
          maxLines: 2,
          textScaleFactor: 1,
          text:  TextSpan(
            text: AppString.otpsubString,
            style: TextStyle(color: AppTheme.grey,fontFamily: AppFonts.poppinsMed,fontSize: 12.sp),
            children: <TextSpan>[
              TextSpan(
                  text: "+91 72858 31282",
                  style: TextStyle(color: AppTheme.black,fontFamily: AppFonts.poppinsSemiBold,fontSize: 14.sp)),
            ],
          ),
        ),
         SizedBox(
          height: 3.h,
        ),
        OtpTextField(
          borderColor: Colors.blue,
          showFieldAsBox: true,
          autoFocus: true,
          borderRadius: BorderRadius.circular(18),
          borderWidth: 2,
          clearText: true,
          cursorColor: Colors.blue,
          fieldWidth: 20.w,
          onCodeChanged: (value) {},
          showCursor: true,
          textStyle:  TextStyle(
              fontSize: 26.sp,fontFamily: AppFonts.poppinsSemiBold, color: Colors.blue),
          obscureText: true,
        ),
         SizedBox(
          height: 3.h,
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: RichText(
              overflow: TextOverflow.clip,
              textAlign: TextAlign.end,
              textDirection: TextDirection.rtl,
              softWrap: true,
              maxLines: 1,
              textScaleFactor: 1,
              text:  TextSpan(
                text: AppString.dontreceive,
                style: TextStyle(color: AppTheme.grey,fontFamily: AppFonts.poppinsMed,fontSize: 12.sp),
                children: <TextSpan>[
                  TextSpan(
                      text: AppString.resenotp,
                style: TextStyle(color: AppTheme.blue,fontFamily: AppFonts.poppinsMed,fontSize: 12.sp),),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),

        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.w),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.sp),
              ),
            ),
            onPressed: () {
              callNextScreen(context, const SetNewPasswordScreen());
            },
            child:   Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 2.h),
              child: Text(
                AppString.verifyNow,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}