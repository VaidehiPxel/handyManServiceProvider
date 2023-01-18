import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:sizer/sizer.dart';

class SideBlueContainer extends StatelessWidget {
  const SideBlueContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.7.w,
      height: 2.h,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: AppTheme.blue,
        borderRadius: BorderRadius.circular(0),
        shape: BoxShape.rectangle,
      ),

    );
  }
}
