

import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class EazyLifeWidget extends StatefulWidget {
  final String title;
  final String? fontFamily;
  final double? fontSize;
  final Widget widget;
  final bool withoutBlue;
  const EazyLifeWidget(
      {super.key,
        required this.title,
        required this.widget,
         this.fontFamily,
         this.fontSize,
        this.withoutBlue = false});

  @override
  State<EazyLifeWidget> createState() => _EazyLifeWidgetState();
}

class _EazyLifeWidgetState extends State<EazyLifeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(

      children: widget.withoutBlue == false
          ? [
        Row(
          children: [
            Expanded(
              flex: 0,
              child: Container(
                width: 1.w,
                height: 3.h,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  //color: AppTheme.blue,
                  borderRadius: BorderRadius.circular(0),
                  shape: BoxShape.rectangle,
                ),
                child: SvgPicture.asset(AppAssets.sideBlueSvg),
              ),
            ),
             SizedBox(
              width: 3.w,
            ),
            Expanded(
              flex: 12,
              child: Text(
                widget.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10.sp,
                  fontFamily: AppFonts.poppins,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 0,
              child: Container(
                width: 7,
                height: 31,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            Expanded(flex: 12, child: widget.widget),
          ],
        )
      ]
          : [
        Text(
          widget.title,
          style: TextStyle(
            color: Colors.black,
            fontSize:widget.fontSize?? 10.sp,
            fontFamily: widget.fontFamily??AppFonts.poppins,
          ),
        ),
        widget.widget
      ],
    );
  }
}