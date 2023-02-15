import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/custom_widgets/app_dialog_button.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class DialogBoxWithIcon extends StatefulWidget {
  final void Function()? onOkPressed;
  final void Function()? onCancelPressed;
  final String title;
  final String icon;
  final String? titleNo;
  final Color? colorNo;
  final double? sizeNo;
  final String? titleYes;
  final Color colorYes;
  final Color? colorYesBtn;
  final Widget content;
  final Color? iconColor;
  final String? titleFamily;
  const DialogBoxWithIcon(
      {super.key,
      required this.onOkPressed,
      required this.icon,
      required this.onCancelPressed,
      required this.title,
      this.titleNo,
      this.colorNo,
      this.colorYesBtn,
      this.sizeNo,
      this.titleFamily,
      required this.colorYes,
      this.titleYes,
      required this.content,
      this.iconColor});

  @override
  State<DialogBoxWithIcon> createState() => _DialogBoxWithIconState();
}

class _DialogBoxWithIconState extends State<DialogBoxWithIcon> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.sp),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(20.sp),
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.circular(12),
          shape: BoxShape.rectangle,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              widget.icon,
              height: 30.sp,
              width: 30.sp,
              color: widget.iconColor,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppTheme.black,
                  fontFamily: AppFonts.poppinsMed,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp),
            ),
            SizedBox(
              height: 6.sp,
            ),
            widget.content,
            SizedBox(
              height: 12.sp,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                widget.titleNo != null
                    ? Expanded(
                        flex: 1,
                        child: AppDialogButton(
                          backgroundColor: AppTheme.dialogGrey,
                          onPressed: widget.onCancelPressed,
                          title: widget.titleNo ?? "",
                          titleColor: widget.colorNo,
                          titleSize: widget.sizeNo ?? 10.sp,
                          titleFamily: widget.titleFamily,
                        ),
                      )
                    : Container(),
                Expanded(
                  flex: 1,
                  child: AppDialogButton(
                    backgroundColor: widget.colorYesBtn ?? AppTheme.blue,
                    onPressed: widget.onOkPressed,
                    title: widget.titleYes ?? "",
                    titleColor: widget.colorYes,
                    titleFamily: widget.titleFamily,
                    titleSize: widget.sizeNo ?? 10.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
