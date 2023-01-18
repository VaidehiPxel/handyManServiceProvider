import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/Navigation.dart';
import 'package:flutter_projects/_core/custom_widgets/auth_button.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:flutter_projects/presentation/auth/widget/app_bg_widget.dart';
import 'package:flutter_projects/presentation/dashboard/screens/dashboard.dart';
import 'package:sizer/sizer.dart';



class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          SizedBox(
            height: 45.h,
            child: AppBGWidget(
                body: Center(
                  child: Image.asset(
                    AppAssets.appLogo,
                    height: 12.h,
                  ),
                )),
          ),
          ListView(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(55.0),
                      topRight: Radius.circular(55.0)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(

                    children: [
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        AppString.setNewPassword,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontFamily: AppFonts.poppinsBold),
                      ),


                      Theme(
                        data: ThemeData(primaryColor: Colors.blue),
                        child: TextFormField(
                          style: const TextStyle(
                            color: AppTheme.authGrey,
                              fontFamily: AppFonts.poppinsMed
                          ),
                          decoration: InputDecoration(
                            labelText: AppString.newPassword,
                            focusColor: Colors.blue,
                            labelStyle: const TextStyle(
                              color: AppTheme.authGrey,
                              fontFamily: AppFonts.poppinsMed
                            ),
                            prefixIcon: Image.asset(AppAssets.password,color: AppTheme.authGrey,),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              child: Icon(
                                obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppTheme.authGrey,
                              ),
                            ),
                          ),
                          obscureText: obscureText,
                        ),
                      ),
                      Theme(
                        data: ThemeData(primaryColor: Colors.blue),
                        child: TextFormField(
                          style: const TextStyle(
                            color: Colors.blue,
                              fontFamily: AppFonts.poppinsMed
                          ),
                          decoration: InputDecoration(
                            labelText: AppString.confirmPassword,
                            focusColor: Colors.blue,
                            labelStyle: const TextStyle(
                              color: AppTheme.authGrey,
                                fontFamily: AppFonts.poppinsMed

                            ),
                            prefixIcon: Image.asset(AppAssets.password,color: AppTheme.authGrey,),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              child: Icon(
                                obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppTheme.authGrey,
                              ),
                            ),
                          ),
                          obscureText: obscureText,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: AuthButton(
                        btnTitle: AppString.save,
                        onPressed: () {
                          callNextScreen(context, const DashBoard());
                        }),
                  )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
