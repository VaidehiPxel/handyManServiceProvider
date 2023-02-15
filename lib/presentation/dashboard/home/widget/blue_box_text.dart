import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:sizer/sizer.dart';

class BlueBoxText extends StatefulWidget {
  final void Function()? onTap;
  final String text;
  final bool showBold;
  final bool showBlueBox;
  final bool showSelected;
  const BlueBoxText(
      {super.key,
      required this.text,
      required this.showBold,
      required this.showBlueBox,
      required this.showSelected,
      required this.onTap});

  @override
  State<BlueBoxText> createState() => _BlueBoxTextState();
}

class _BlueBoxTextState extends State<BlueBoxText> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.only(left: 5.w, bottom: 0.7.h),
        child: Row(
          children: [
            if (widget.showBlueBox)
              Container(
                width: 1.w,
                height: 3.h,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  //color: Colors.blue.shade700,
                  borderRadius: BorderRadius.circular(0),
                  shape: BoxShape.rectangle,
                  image: const DecorationImage(
                    image: AssetImage(AppAssets.sideBlue),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            if (!widget.showBlueBox)
              const SizedBox(
                width: 7,
                height: 31,
              ),
            SizedBox(
              width: 3.w,
            ),
            Text(
              widget.text,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 14.sp,
                  color: widget.showSelected ? Colors.blue : Colors.black,
                  fontFamily: AppFonts.poppinsSemiBold),
            ),
          ],
        ),
      ),
    );
  }
}
