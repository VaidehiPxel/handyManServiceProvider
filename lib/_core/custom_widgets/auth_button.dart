import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:sizer/sizer.dart';

class AuthButton extends StatelessWidget {
  final String btnTitle;
  final VoidCallback onPressed;
  const AuthButton({
    Key? key,
    required this.btnTitle,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 3.w),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          minimumSize: const Size.fromHeight(50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.sp),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 1.5.h),
          child: Text(
            btnTitle,
            style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontFamily: AppFonts.poppinsMed),
          ),
        ),
      ),
    );
  }
}
