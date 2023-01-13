import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/custom_widgets/auth_button.dart';
import 'package:flutter_projects/_core/navigation.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:flutter_projects/presentation/auth/screens/login_screen.dart';
import 'package:flutter_projects/presentation/auth/widget/app_bg_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade700,
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 45.h,
                  child: AppBGWidget(
                      body: Center(
                        child: Image.asset(
                          AppAssets.appLogo,
                          height: 13.h,
                        ),
                      )),
                ),
                Stack(
                  children: [
                    ListView(
                      shrinkWrap: true,
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        SizedBox(
                          height:30.h,
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
                            child: ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              primary: false,
                              shrinkWrap: true,
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                Center(
                                  child: Text(
                                    AppString.signUp,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.sp,
                                        fontFamily: AppFonts.poppinsBold),
                                  ),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Center(
                                  child: Text(
                                    AppString.sublogin,
                                    maxLines: 2,
                                    softWrap: true,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppTheme.grey,
                                        fontSize: 10.sp,
                                        fontFamily: AppFonts.poppinsMed),
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
                                        labelText: AppString.firstName,
                                        focusColor: Colors.blue,
                                        labelStyle: const TextStyle(
                                          color: AppTheme.authGrey,
                                            fontFamily: AppFonts.poppinsMed
                                        ),
                                        prefixIcon:
                                        Padding(
                                          padding:  EdgeInsets.all(12.sp),
                                          child: SvgPicture.asset(AppAssets.person,
                                            color: AppTheme.authGrey,
                                          ),
                                        )),
                                  ),
                                ),
                                Theme(
                                  data: ThemeData(primaryColor: Colors.blue),
                                  child: TextFormField(
                                    style: const TextStyle(
                                      color: AppTheme.authGrey,
                                        fontFamily: AppFonts.poppinsMed
                                    ),
                                    decoration: InputDecoration(
                                        labelText: AppString.lastName,
                                        focusColor: Colors.blue,
                                        labelStyle: const TextStyle(
                                          color:AppTheme.authGrey,
                                            fontFamily: AppFonts.poppinsMed
                                        ),
                                        prefixIcon:
                                        Padding(
                                          padding:  EdgeInsets.all(12.sp),
                                          child: SvgPicture.asset(AppAssets.person,
                                            color: AppTheme.authGrey,
                                          ),
                                        )),
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
                                        labelText: AppString.email,
                                        focusColor: Colors.blue,
                                        labelStyle: const TextStyle(
                                          color:AppTheme.authGrey,
                                            fontFamily: AppFonts.poppinsMed
                                        ),
                                        prefixIcon:
                                            Padding(
                                              padding:  EdgeInsets.all(12.sp),
                                              child: SvgPicture.asset(AppAssets.emailSvg,
                                                color: AppTheme.authGrey,
                                         ),
                                            )),
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
                                        labelText: AppString.mobileNumber,
                                        focusColor: Colors.blue,
                                        labelStyle: const TextStyle(
                                          color:AppTheme.authGrey,
                                            fontFamily: AppFonts.poppinsMed
                                        ),
                                        prefixIcon:
                                        Padding(
                                          padding:  EdgeInsets.all(12.sp),
                                          child: SvgPicture.asset(AppAssets.callSvg,
                                            color: AppTheme.authGrey,
                                          ),
                                        )),
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
                                      labelText: AppString.password,
                                      focusColor: Colors.blue,
                                      labelStyle: const TextStyle(
                                        color: AppTheme.authGrey,
                                          fontFamily: AppFonts.poppinsMed
                                      ),
                                      prefixIcon:
                                          Image.asset(AppAssets.password),
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
                                      prefixIcon:
                                          Image.asset(AppAssets.password),
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
                                  padding:  EdgeInsets.symmetric(horizontal: 15.w),
                                  child: AuthButton(
                                      btnTitle: AppString.signUp,
                                      onPressed: () {
                                      }),
                                ),

                                const SizedBox(
                                  height: 20,
                                ),
                                const Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Text(
                                      AppString.or,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                          fontFamily: AppFonts.poppinsMed
                                      ),
                                    ),
                                  ),
                                ),
                                _signupWith(),
                                const SizedBox(
                                  height: 20,
                                ),
                                _alreadyAccount(context),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 3.4,
                      left: 0,
                      right: 0,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 180,
                            width: 180,
                            child: Center(
                              child: Container(
                                height: 110,
                                width: 110,
                                margin: const EdgeInsets.only(bottom: 70),
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(155.0)),
                                  color: Colors.amber,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 4,
                                    strokeAlign: StrokeAlign.outside,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            top: 30,
                            left: 0,
                            right: 0,
                            child: SizedBox(
                              height: 40,
                              width: 40,
                              child: Center(
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(155.0)),
                                    color: Colors.blue,
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Align _alreadyAccount(BuildContext context) {
    return
      Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: RichText(
            overflow: TextOverflow.clip,
            textAlign: TextAlign.end,
            textDirection: TextDirection.rtl,
            softWrap: true,
            maxLines: 1,
            textScaleFactor: 1,
            text: TextSpan(
              text: AppString.alreadyAmember,
              style: const TextStyle(
                  color: AppTheme.grey, fontFamily: AppFonts.poppinsMed),
              children: <TextSpan>[
                TextSpan(
                    text:AppString.log_in,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        callNextScreen(context, const LoginScreen());
                      },
                    style: const TextStyle(
                        color: Colors.blue, fontFamily: AppFonts.poppinsMed)),
              ],
            ),
          ),
        ),
      );
  }

  Center _signupWith() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Image.asset(AppAssets.facebook),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AppAssets.google),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Image.asset(AppAssets.linkedIn),
          // )
        ],
      ),
    );
  }
}
