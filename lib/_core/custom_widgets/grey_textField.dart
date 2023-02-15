import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:flutter_projects/_core/utils/theme_config.dart';

class GreyTextField extends StatelessWidget {
  final String hintText;
  final String? fontFamily;
  final double? height;
  const GreyTextField(
      {Key? key, required this.hintText, this.fontFamily, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 5.5.h,
      decoration: BoxDecoration(
          color: AppTheme.lightGrey,
          borderRadius: BorderRadius.circular(5.sp),
          shape: BoxShape.rectangle,
          boxShadow: const [
            BoxShadow(
              color: AppTheme.dropShadow,
              blurRadius: 5.0,
            ),
          ]),
      child: TextFormField(
        maxLines: 1,
        enableSuggestions: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
              fontFamily: fontFamily ?? AppFonts.poppinsMed,
              fontSize: 12.sp,
              color: AppTheme.medGrey),
          contentPadding: EdgeInsets.all(10.sp),
        ),
      ),
    );
  }
}
