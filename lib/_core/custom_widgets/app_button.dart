import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:sizer/sizer.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  const AppButton({Key? key,required this.title,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 3.w),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.blue,
          minimumSize: const Size.fromHeight(50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),

          ),
        ),
        onPressed: onPressed,
        child:  Padding(
          padding: EdgeInsets.all(10.sp),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontFamily: AppFonts.poppinsMed,
            ),
          ),
        ),
      ),
    );
  }
}
