import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:sizer/sizer.dart';

class EazyLifeWidget extends StatefulWidget {
  final String title;
  final Widget widget;
  const EazyLifeWidget({super.key, required this.title, required this.widget});

  @override
  State<EazyLifeWidget> createState() => _EazyLifeWidgetState();
}

class _EazyLifeWidgetState extends State<EazyLifeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 1.w,
              height: 3.h,
              padding: EdgeInsets.zero,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage(ImageString.sideBlue),
                  fit: BoxFit.cover,
                ),
              ),
            ),
             SizedBox(
              width: 1.5.w,
            ),
            Padding(
              padding:  EdgeInsets.only(left: 2.w),
              child: Text(
                widget.title,
                style:  TextStyle(
                  color: Colors.black,
                  fontSize: 12.sp,
                  fontFamily: AppFonts.poppinsMed
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 1.h,),
        Row(
          children: [
           SizedBox(width: 3.w,),
           Expanded(child:  widget.widget),
          ],
        )
      ],
    );
  }
}
