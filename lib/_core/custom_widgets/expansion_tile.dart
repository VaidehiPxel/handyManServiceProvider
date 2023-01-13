import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:sizer/sizer.dart';

class EazylifeExpansionTile extends StatefulWidget {
  final String title;
  final String subTitle;
  const EazylifeExpansionTile(
      {super.key, required this.title, required this.subTitle});

  @override
  State<EazylifeExpansionTile> createState() => _EazylifeExpansionTileState();
}

class _EazylifeExpansionTileState extends State<EazylifeExpansionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal:3.5.w),
      decoration: BoxDecoration(
        color: AppTheme.lightGrey,
        borderRadius: BorderRadius.circular(10.sp),
        shape: BoxShape.rectangle,
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Row(
            children: [
              Container(
                width: 1.w,
                height: 4.h,
                padding: EdgeInsets.zero,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage(AppAssets.sideBlue),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
               SizedBox(
                width: 4.w,
              ),
              Text(
                widget.title,
                style:  TextStyle(
                  color: Colors.black,
                  fontSize: 12.sp,
                 fontFamily: AppFonts.poppinsMed
                ),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          collapsedBackgroundColor: Colors.transparent,
          collapsedIconColor: Colors.black,
          collapsedTextColor: Colors.black,
          iconColor: Colors.black,
          textColor: Colors.black,
          maintainState: true,
          childrenPadding: EdgeInsets.zero,
          tilePadding: EdgeInsets.zero,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 3.w),
              child: Text(
                widget.subTitle,
                style:  TextStyle(
                  color:AppTheme.medGrey,
                  fontSize: 12.sp,
                    fontFamily: AppFonts.poppins
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
