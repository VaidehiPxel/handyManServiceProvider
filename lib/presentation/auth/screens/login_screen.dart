import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/_core/navigation.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/application/login/login_bloc.dart';
import 'package:flutter_projects/application/login/login_state.dart';
import 'package:flutter_projects/presentation/auth/constants/image_constant.dart';
import 'package:flutter_projects/presentation/auth/constants/string_constant.dart';
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
  final LoginBloc _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _loginBloc,
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {},
        child: BlocBuilder<LoginBloc, LoginState>(
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
                          height: 40.h,
                          child: AppBGWidget(
                              body: Image.asset(AuthImageString.appLogo)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30.h),
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
                                    height: 3.h,
                                  ),
                                  _setTitle(),
                                  _setMobileNumber(),
                                  _setPassword(),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  _forgotPassword(context),
                                  SizedBox(
                                    height: 2.5.h,
                                  ),
                                  _loginCTA(context),
                                  SizedBox(
                                    height: 2.5.h,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        AuthString.or,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontFamily: AppFonts.poppinsMed),
                                      ),
                                    ),
                                  ),
                                  _loginWith(),
                                  const SizedBox(
                                    height: 20,
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
      ),
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
            text: AuthString.sign_up,
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
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Image.asset(AuthImageString.facebook),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AuthImageString.google),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Image.asset(AuthImageString.linkedIn),
          // )
        ],
      ),
    );
  }

  Widget _setPassword() {
    return Theme(
      data: ThemeData(primaryColor: Colors.blue),
      child: TextFormField(
        style: const TextStyle(
          color: Colors.blue,
        ),
        decoration: InputDecoration(
          labelText: AuthString.password,
          focusColor: Colors.blue,
          labelStyle: const TextStyle(
              color: Colors.blue, fontFamily: AppFonts.poppinsMed),
          prefixIcon: Image.asset(AuthImageString.password),
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
        style: const TextStyle(
          color: Colors.blue,
        ),
        decoration: InputDecoration(
            labelText: AuthString.mobileNumber,
            focusColor: Colors.blue,
            labelStyle: const TextStyle(
                color: Colors.blue, fontFamily: AppFonts.poppinsMed),
            prefixIcon: Image.asset(AuthImageString.phone)),
      ),
    );
  }

  Widget _loginCTA(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        onPressed: () {
          callNextScreen(context, const DashBoard());
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 1.h),
          child: Text(
            AuthString.log_in,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontFamily: AppFonts.poppinsMed),
          ),
        ),
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
            AuthString.forgetPasswordq,
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
          AuthString.login,
          style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontFamily: AppFonts.poppinsBold),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            AuthString.sublogin,
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
}
