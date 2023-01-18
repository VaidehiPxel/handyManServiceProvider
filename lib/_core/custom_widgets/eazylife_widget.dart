import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/custom_widgets/side_blue_container.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class EazyLifeWidget extends StatefulWidget {
  final String title;
  final String? fontFamily;
  final double? fontSize;
  final Widget widget;
  final bool withoutBlue;
  final bool? isLogoRounded;
  const EazyLifeWidget(
      {super.key,
      required this.title,
      required this.widget,
      this.fontFamily,
      this.fontSize,
      this.withoutBlue = false,
      this.isLogoRounded=false});

  @override
  State<EazyLifeWidget> createState() => _EazyLifeWidgetState();
}

class _EazyLifeWidgetState extends State<EazyLifeWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.withoutBlue == false) {
      return Column(
        children: [
          Row(
            children: [
              if (widget.isLogoRounded!)
                Container(
                    width: 1.w,
                    height: 3.h,
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      //color: AppTheme.blue,
                      borderRadius: BorderRadius.circular(0),
                      shape: BoxShape.rectangle,
                    ),
                    child: SvgPicture.asset(AppAssets.sideBlueSvg))
              else
                SideBlueContainer(),
              SizedBox(
                width: 1.5.w,
              ),
              Text(
                widget.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 11.sp,
                  fontFamily: AppFonts.poppinsMed,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width:widget.isLogoRounded!? 1.w:0,
                height:widget.isLogoRounded!? 3.h:0,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  shape: BoxShape.rectangle,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 1.h),
                  child: widget.widget,
                ),
              ),
            ],
          )
        ],
      );
    } else {
      return Column(
        children: [
          Text(
            widget.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: widget.fontSize ?? 10.sp,
              fontFamily: widget.fontFamily ?? AppFonts.poppins,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: widget.widget,
          )
        ],
      );
    }
  }
}
