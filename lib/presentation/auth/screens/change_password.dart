import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/constants/app_string.g.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';
import 'package:flutter_projects/_core/custom_widgets/app_button.dart';
import 'package:flutter_projects/_core/custom_widgets/eazylife_widget.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:sizer/sizer.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({
    Key? key,
  }) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: EazylifeAppBar(
        title: LocaleKeys.changePassword.tr(),
        leadIcon: AppAssets.backIcon,
        onPressed: () {
          Navigator.pop(context);
        },
        sideIcon: null,
      ),
      body: Padding(
        padding: EdgeInsets.all(18.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              EazyLifeWidget(
                title: LocaleKeys.oldPassword.tr(),
                widget: _customTextField(6.h, LocaleKeys.oldPassword.tr(), 1),
              ),
              SizedBox(
                height: 1.h,
              ),
              EazyLifeWidget(
                title: LocaleKeys.newPassword.tr(),
                widget: _customTextField(6.h, LocaleKeys.newPassword.tr(), 1),
              ),
              SizedBox(
                height: 1.h,
              ),
              EazyLifeWidget(
                title: LocaleKeys.confirmPassword.tr(),
                widget: _customTextField(6.h, LocaleKeys.confirmPassword.tr(), 1),
              ),
              SizedBox(
                height: 4.h,
              ),
              AppButton(
                title: LocaleKeys.save.tr(),
                onPressed: () {},
              ),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customTextField(double height, String hintText, int maxLine) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: AppTheme.lightGrey,
        borderRadius: BorderRadius.circular(8.sp),
        shape: BoxShape.rectangle,
      ),
      child: Center(
        child: TextFormField(
          maxLines: maxLine,
          enableIMEPersonalizedLearning: true,
          enableSuggestions: true,
          style: TextStyle(fontFamily: AppFonts.poppins, fontSize: 12.sp),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            contentPadding: EdgeInsets.all(12.sp),
            hintStyle: TextStyle(
                fontFamily: AppFonts.poppins,
                color: AppTheme.medGrey,
                fontSize: 12.sp),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              child: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          obscureText: obscureText,
        ),
      ),
    );
  }
}
