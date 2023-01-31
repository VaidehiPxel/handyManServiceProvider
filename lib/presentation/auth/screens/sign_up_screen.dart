import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/_core/custom_widgets/auth_button.dart';
import 'package:flutter_projects/_core/navigation.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:flutter_projects/application/signup/signup_bloc.dart';
import 'package:flutter_projects/application/signup/signup_event.dart';
import 'package:flutter_projects/application/signup/signup_state.dart';
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
  GlobalKey<FormFieldState> mFirstNameKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> mLastNameKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> mMobileKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> mEmailKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> mPasswordKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> mConfirmPasswordKey = GlobalKey<FormFieldState>();

  TextEditingController mFirstNameController = TextEditingController();
  TextEditingController mLastNameController = TextEditingController();
  TextEditingController mMobileController = TextEditingController();
  TextEditingController mEmailController = TextEditingController();
  TextEditingController mPasswordController = TextEditingController();
  TextEditingController mConfirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state is SignupShowMessage || state is SignupStateError) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(
                  (state is SignupShowMessage)
                      ? state.msg
                      : (state is SignupStateError)
                          ? state.mErrorMsg.toString()
                          : "",
                  style: const TextStyle(color: Colors.black),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "ok",
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              );
            },
          );
        }
        if (state is SignupSuccess) {
          callNextScreen(context, const LoginScreen());
        }
      },
      child: BlocBuilder<SignupBloc, SignupState>(
        builder: (context, state) {
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
                                  child: ListView(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
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
                                          AppString.subLogin,
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
                                        data: ThemeData(
                                            primaryColor: Colors.blue),
                                        child: TextFormField(
                                          key: mFirstNameKey,
                                          controller: mFirstNameController,
                                          validator: validateName,
                                          style: const TextStyle(
                                              color: Colors.blue,
                                              fontFamily: AppFonts.poppinsMed),
                                          decoration: InputDecoration(
                                              labelText: AppString.firstName,
                                              focusColor: Colors.blue,
                                              labelStyle: const TextStyle(
                                                  color: AppTheme.authGrey,
                                                  fontFamily:
                                                      AppFonts.poppinsMed),
                                              prefixIcon: Padding(
                                                padding: EdgeInsets.all(12.sp),
                                                child: SvgPicture.asset(
                                                  AppAssets.person,
                                                  color: AppTheme.authGrey,
                                                ),
                                              )),
                                        ),
                                      ),
                                      Theme(
                                        data: ThemeData(
                                            primaryColor: Colors.blue),
                                        child: TextFormField(
                                          key: mLastNameKey,
                                          controller: mLastNameController,
                                          validator: validateName,
                                          style: const TextStyle(
                                              color: AppTheme.authGrey,
                                              fontFamily: AppFonts.poppinsMed),
                                          decoration: InputDecoration(
                                              labelText: AppString.lastName,
                                              focusColor: Colors.blue,
                                              labelStyle: const TextStyle(
                                                  color: AppTheme.authGrey,
                                                  fontFamily:
                                                      AppFonts.poppinsMed),
                                              prefixIcon: Padding(
                                                padding: EdgeInsets.all(12.sp),
                                                child: SvgPicture.asset(
                                                  AppAssets.person,
                                                  color: AppTheme.authGrey,
                                                ),
                                              )),
                                        ),
                                      ),
                                      Theme(
                                        data: ThemeData(
                                            primaryColor: Colors.blue),
                                        child: TextFormField(
                                          key: mEmailKey,
                                          controller: mEmailController,
                                          validator: validateEmail,
                                          style: const TextStyle(
                                              color: Colors.blue,
                                              fontFamily: AppFonts.poppinsMed),
                                          decoration: InputDecoration(
                                              labelText: AppString.email,
                                              focusColor: Colors.blue,
                                              labelStyle: const TextStyle(
                                                  color: AppTheme.authGrey,
                                                  fontFamily:
                                                      AppFonts.poppinsMed),
                                              prefixIcon: Padding(
                                                padding: EdgeInsets.all(12.sp),
                                                child: SvgPicture.asset(
                                                  AppAssets.emailSvg,
                                                  color: AppTheme.authGrey,
                                                ),
                                              )),
                                        ),
                                      ),
                                      Theme(
                                        data: ThemeData(
                                            primaryColor: Colors.blue),
                                        child: TextFormField(
                                          key: mMobileKey,
                                          controller: mMobileController,
                                          validator: validateMobile,
                                          style: const TextStyle(
                                              color: Colors.blue,
                                              fontFamily: AppFonts.poppinsMed),
                                          decoration: InputDecoration(
                                              labelText: AppString.mobileNumber,
                                              focusColor: Colors.blue,
                                              labelStyle: const TextStyle(
                                                  color: AppTheme.authGrey,
                                                  fontFamily:
                                                      AppFonts.poppinsMed),
                                              prefixIcon: Padding(
                                                padding: EdgeInsets.all(12.sp),
                                                child: SvgPicture.asset(
                                                  AppAssets.callSvg,
                                                  color: AppTheme.authGrey,
                                                ),
                                              )),
                                        ),
                                      ),
                                      Theme(
                                        data: ThemeData(
                                            primaryColor: Colors.blue),
                                        child: TextFormField(
                                          key: mPasswordKey,
                                          controller: mPasswordController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Please Enter New Password";
                                            } else if (value.length < 8) {
                                              return "Password must be atleast 8 characters long";
                                            } else {
                                              return null;
                                            }
                                          },
                                          style: const TextStyle(
                                              color: Colors.blue,
                                              fontFamily: AppFonts.poppinsMed),
                                          decoration: InputDecoration(
                                            labelText: AppString.password,
                                            focusColor: Colors.blue,
                                            labelStyle: const TextStyle(
                                                color: AppTheme.authGrey,
                                                fontFamily:
                                                    AppFonts.poppinsMed),
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
                                                color: AppTheme.authGrey,
                                              ),
                                            ),
                                          ),
                                          obscureText: obscureText,
                                        ),
                                      ),
                                      Theme(
                                        data: ThemeData(
                                            primaryColor: Colors.blue),
                                        child: TextFormField(
                                          key: mConfirmPasswordKey,
                                          controller:
                                              mConfirmPasswordController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Please Re-Enter New Password";
                                            } else if (value!.length < 8) {
                                              return "Password must be atleast 8 characters long";
                                            } else if (value! !=
                                                mPasswordController.text) {
                                              return "Password must be same as above";
                                            } else {
                                              return null;
                                            }
                                          },
                                          style: const TextStyle(
                                              color: Colors.blue,
                                              fontFamily: AppFonts.poppinsMed),
                                          decoration: InputDecoration(
                                            labelText:
                                                AppString.confirmPassword,
                                            focusColor: Colors.blue,
                                            labelStyle: const TextStyle(
                                                color: AppTheme.authGrey,
                                                fontFamily:
                                                    AppFonts.poppinsMed),
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
                                      if (state is! SignupLoading)
                                        Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.w),
                                        child: AuthButton(
                                            btnTitle: AppString.signUp,
                                            onPressed: () {
                                              bool mobile = mMobileKey
                                                  .currentState!
                                                  .validate();
                                              bool email = mEmailKey
                                                  .currentState!
                                                  .validate();
                                              bool password = mPasswordKey
                                                  .currentState!
                                                  .validate();
                                              bool cPassword =
                                                  mConfirmPasswordKey
                                                      .currentState!
                                                      .validate();
                                              if (mobile &&
                                                  email &&
                                                  password &&
                                                  cPassword) {
                                                context.read<SignupBloc>().add(
                                                    SignupCallApiEvent(
                                                      firstName: mFirstNameController.text.trim(),
                                                        lastName: mLastNameController.text.trim(),
                                                        mobileNo:
                                                            mMobileController.text
                                                                .trim(),
                                                        email: mEmailController
                                                            .text
                                                            .trim(),
                                                        password:
                                                            mPasswordController
                                                                .text
                                                                .trim(),
                                                        confirmPassword:
                                                            mConfirmPasswordController
                                                                .text
                                                                .trim()));
                                              }
                                            }),
                                      ),
                                      if (state is SignupLoading)
                                        const Center(
                                            child: CircularProgressIndicator(
                                              backgroundColor: AppTheme.lightBlue,
                                            )),
                                      SizedBox(
                                        height: 2.h,
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
                                                fontFamily:
                                                    AppFonts.poppinsMed),
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
        },
      ),
    );
  }

  Align _alreadyAccount(BuildContext context) {
    return Align(
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
            text: AppString.alreadyMember,
            style: const TextStyle(
                color: AppTheme.grey, fontFamily: AppFonts.poppinsMed),
            children: <TextSpan>[
              TextSpan(
                  text: AppString.logIn,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AppAssets.facebook),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AppAssets.google),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AppAssets.linkedIn),
          )
        ],
      ),
    );
  }

  String? validateName(String? value) {

    if (value!.isEmpty) {
      return 'Required';
    } else {
      return null;
    }
  }

  String? validateMobile(String? value) {
// Indian Mobile number are of 10 digit only
    if (RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
        .hasMatch(value!)) {
      return null;
    }
    if (value!.length != 10) {
      return 'Mobile Number must be of 10 digit';
    } else {
      return null;
    }
  }

  String? validateEmail(String? value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!regex.hasMatch(value!)) {
      return 'Enter Valid Email';
    } else {
      return null;
    }
  }
}
