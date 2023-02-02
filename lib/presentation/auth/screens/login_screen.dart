import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/_core/constants/validation.dart';
import 'package:flutter_projects/_core/custom_widgets/api_loader.dart';
import 'package:flutter_projects/_core/custom_widgets/auth_button.dart';
import 'package:flutter_projects/_core/navigation.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/application/login/login_bloc.dart';
import 'package:flutter_projects/application/login/login_event.dart';
import 'package:flutter_projects/application/login/login_state.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:flutter_projects/presentation/auth/widget/app_bg_widget.dart';
import 'package:flutter_projects/presentation/auth/screens/forgot_password.dart';
import 'package:flutter_projects/presentation/auth/screens/sign_up_screen.dart';
import 'package:flutter_projects/presentation/dashboard/screens/dashboard.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = false;

  TextEditingController mMobileEmailController = TextEditingController();
  TextEditingController mPasswordController = TextEditingController();

//+919979988592
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginScreenState>(
      listener: (context, state) {
        if (state is LoginScreenShowMessage || state is LoginScreenError) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(
                  (state is LoginScreenShowMessage)
                      ? state.msg
                      : (state is LoginScreenError)
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
        if (state is LoginScreenSuccess) {
          callNextScreen(context, const DashBoard());
        }
      },
      child: BlocBuilder<LoginBloc, LoginScreenState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
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
                            height: 12.h,
                          ),
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 35.h),
                        child: Container(
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
                                  height: 2.h,
                                ),
                                _setTitle(),
                                _setMobileNumber(),
                                _setPassword(),
                                SizedBox(
                                  height: 1.2.h,
                                ),
                                _forgotPassword(context),
                                SizedBox(
                                  height: 2.5.h,
                                ),
                                if (state is! LoginScreenLoading)
                                  _loginCTA(context)
                                else
                                  const APILoader(),
                                SizedBox(
                                  height: 2.5.h,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      AppString.or,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontFamily: AppFonts.poppinsMed),
                                    ),
                                  ),
                                ),
                                _loginWith(),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                _dontHaveAccount(context),
                              ],
                            ),
                          ),
                        ),
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

  Widget _setPassword() {
    return Theme(
      data: ThemeData(primaryColor: Colors.blue),
      child: TextFormField(
        controller: mPasswordController,
        style: const TextStyle(
          color: Colors.blue,
        ),
        decoration: InputDecoration(
          labelText: AppString.password,
          focusColor: Colors.blue,
          labelStyle: const TextStyle(
              color: AppTheme.authGrey, fontFamily: AppFonts.poppinsMed),
          prefixIcon: Image.asset(AppAssets.password),
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
    );
  }

  Widget _setMobileNumber() {
    return Theme(
      data: ThemeData(primaryColor: Colors.blue),
      child: TextFormField(
        controller: mMobileEmailController,
        style: const TextStyle(
          color: Colors.blue,
        ),
        decoration: InputDecoration(
            labelText: "${AppString.mobileNumber} / ${AppString.email}",
            focusColor: Colors.blue,
            labelStyle: const TextStyle(
                color: AppTheme.authGrey, fontFamily: AppFonts.poppinsMed),
            prefixIcon: Image.asset(
              AppAssets.phone,
              color: AppTheme.authGrey,
            )),
      ),
    );
  }

  Widget _loginCTA(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: AuthButton(
        btnTitle: AppString.login,
        onPressed: () async {
          if (mMobileEmailController.text.isNotEmpty &&
              mPasswordController.text.isNotEmpty) {
            context.read<LoginBloc>().add(LoginScreenCallApiEvent(
                username: mMobileEmailController.text.trim(),
                password: mPasswordController.text.trim(),
                isMobile: !mMobileEmailController.text.trim().contains("@")));
          } else {
            if (mMobileEmailController.text.isEmpty) {
              ScaffoldMessenger.maybeOf(context)!.showSnackBar(
                  const SnackBar(content: Text("Mobile/Email can't be empty")));
            } else if (mPasswordController.text.isEmpty) {
              ScaffoldMessenger.maybeOf(context)!.showSnackBar(
                  const SnackBar(content: Text("Password can't be empty")));
            }
          }
        },
      ),
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          callNextScreen(context, const ForgotPassword());
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "${AppString.forgetPassword}?",
            style: TextStyle(
                color: Colors.blue,
                fontSize: 10.sp,
                fontFamily: AppFonts.poppinsMed),
          ),
        ),
      ),
    );
  }

  Widget _setTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppString.login,
          style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontFamily: AppFonts.poppinsBold),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
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
        )
      ],
    );
  }

  Widget _dontHaveAccount(BuildContext context) {
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
            text: AppString.doNotHaveAccount,
            style: const TextStyle(
                color: AppTheme.grey, fontFamily: AppFonts.poppinsMed),
            children: <TextSpan>[
              TextSpan(
                  text: 'Sign Up',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      callNextScreen(context, const SignUpScreen());
                    },
                  style: const TextStyle(
                      color: Colors.blue, fontFamily: AppFonts.poppinsMed)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginWith() {
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
}
