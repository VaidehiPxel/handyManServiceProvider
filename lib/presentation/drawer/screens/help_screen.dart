import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';
import 'package:flutter_projects/_core/custom_widgets/app_button.dart';
import 'package:flutter_projects/_core/custom_widgets/eazylife_widget.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:sizer/sizer.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: EazylifeAppBar(
        title: AppString.help,
        leadIcon: AppAssets.backIcon,
        onPressed: () {
          Navigator.pop(context);
        },
        sideIcon: null,
      ),
      body: Padding(
        padding:  EdgeInsets.all(18.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              EazyLifeWidget(
                title: AppString.firstName,
                widget: _customTextField(6.h,AppString.firstNameHint,1),
              ),
              SizedBox(height: 1.h,),
              EazyLifeWidget(
                title: AppString.lastName,
                widget: _customTextField(6.h,AppString.lastNameHint,1),
              ),
              SizedBox(height: 1.h,),

              EazyLifeWidget(
                title: AppString.emailAddress,
                widget: _customTextField(6.h,AppString.emailAddressHint,1),
              ),
              SizedBox(height: 1.h,),

              EazyLifeWidget(
                title: AppString.mobileNumber,
                widget:_customTextField(6.h,AppString.mobileNumberHint,1),
              ),
              SizedBox(height: 1.h,),

              EazyLifeWidget(
                title: AppString.message,
                widget: _customTextField(25.h,AppString.messageHint,70),
              ),
               SizedBox(
                height: 2.5.h,
              ),
               AppButton(title: AppString.submit,onPressed: (){},),
              SizedBox(height: 2 .h,),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customTextField(double height,String hintText,int maxLine) {
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
                  style: TextStyle(
                      fontFamily: AppFonts.poppins,
                      fontSize: 12.sp
                  ),
                  decoration:  InputDecoration(
                    border: InputBorder.none,
                    hintText:hintText,
                    contentPadding: EdgeInsets.all(12.sp),
                    hintStyle: TextStyle(
                      fontFamily: AppFonts.poppins,
                          color: AppTheme.medGrey,
                          fontSize: 12.sp
                    )
                  ),
                ),
              ),
            );
  }
}