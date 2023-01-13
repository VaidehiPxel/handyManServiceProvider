import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/_core/Navigation.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/application/auth/auth_bloc.dart';
import 'package:flutter_projects/application/auth/auth_state.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:flutter_projects/presentation/auth/screens/otp_verification.dart';
import 'package:flutter_projects/presentation/auth/widget/app_bg_widget.dart';
import 'package:sizer/sizer.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final AuthBloc _authBloc = AuthBloc();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (_) => _authBloc,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {},
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
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
                              height: 13.h,
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
                                height: 3.h,
                              ),
                              _setTitle(),
                              _setMobileNumber(),
                              SizedBox(
                                height: 1.h,
                              ),
                              SizedBox(
                                height: 2.5.h,
                              ),
                              _loginCTA(context),
                              SizedBox(
                                height: 2.5.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ));
          },
        ),
      ),
    );


  }

  Widget _setTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppString.forgetPassword,
          style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontFamily: AppFonts.poppinsBold),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
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
        )
      ],
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
            labelText: AppString.entermobileNumber,
            focusColor: AppTheme.authGrey,
            labelStyle: const TextStyle(
                color:AppTheme.authGrey, fontFamily: AppFonts.poppinsMed),
            prefixIcon: Image.asset(AppAssets.phone),
        prefixIconColor: AppTheme.authGrey),
      ),
    );
  }

  Widget _loginCTA(BuildContext context) {

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.sp),
        ),
      ),
      onPressed: () {
        callNextScreen(context, const OTPVerification());
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 1.5.h),
        child: Text(
          AppString.getOtp,
          style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontFamily: AppFonts.poppinsMed),
        ),
      ),
    );
  }
}
