import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:sizer/sizer.dart';

class AppDialogButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final double? elevation;
  final Color? titleColor;
  final double? titleSize;
  final String? titleFamily;
  final Color? backgroundColor;
  const AppDialogButton(
      {Key? key,
        required this.title,
        required this.onPressed,
        required this.titleColor,
         this.titleSize,
         this.titleFamily,
        required this.backgroundColor,
        this.elevation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.w),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          minimumSize: const Size.fromHeight(40),
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.all(2.sp),
          child: Text(
            title,
            style: TextStyle(
              color: titleColor,
              fontSize: titleSize ?? 10.sp,
              fontFamily: titleFamily??AppFonts.poppinsSemiBold,
            ),
          ),
        ),
      ),
    );
  }
}