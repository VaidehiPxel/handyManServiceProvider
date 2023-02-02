import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/_core/Navigation.dart';
import 'package:flutter_projects/_core/constants/validation.dart';
import 'package:flutter_projects/_core/custom_widgets/api_loader.dart';
import 'package:flutter_projects/_core/custom_widgets/auth_button.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/application/auth/auth_bloc.dart';
import 'package:flutter_projects/application/auth/auth_event.dart';
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
  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is GetOtpShowMessage || state is GetOtpError) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(
                  (state is GetOtpShowMessage)
                      ? state.msg
                      : (state is GetOtpError)
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
        if (state is GetOtpSuccess) {
          callNextScreen(
              context,
              OTPVerification(
                mobileNo: mobileController.text,
              ));
        }
      },
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
                              height: 3.h,
                            ),
                            _setTitle(),
                            SizedBox(
                              height: 1.h,
                            ),
                            _setMobileNumber(),
                            SizedBox(
                              height: 1.h,
                            ),
                            SizedBox(
                              height: 3.5.h,
                            ),
                            if (state is! GetOtpLoading)
                              _getOtpCTA(context)
                            else
                              const APILoader(),
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

  Widget _setMobileNumber() {
    return Theme(
      data: ThemeData(primaryColor: Colors.blue),
      child: TextFormField(
        controller: mobileController,
        style: const TextStyle(
          color: Colors.blue,
        ),
        decoration: InputDecoration(
            labelText: AppString.enterMobileNumber,
            focusColor: AppTheme.authGrey,
            labelStyle: const TextStyle(
                color: AppTheme.authGrey, fontFamily: AppFonts.poppinsMed),
            prefixIcon: Image.asset(AppAssets.phone),
            prefixIconColor: AppTheme.authGrey),
      ),
    );
  }

  Widget _getOtpCTA(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: AuthButton(
          btnTitle: AppString.getOtp,
          onPressed: () {
            if (mobileController.text.isEmpty) {
              ScaffoldMessenger.maybeOf(context)!.showSnackBar(
                  const SnackBar(content: Text("Mobile can't be empty")));
            } else if (validateMobile(mobileController.text) == false) {
              ScaffoldMessenger.maybeOf(context)!.showSnackBar(
                  const SnackBar(content: Text("Mobile no is not valid")));
            } else {
              context.read<AuthBloc>().add(
                  GetOTPCallApiEvent(mobileNo: mobileController.text.trim()));
            }
          }),
    );
  }
}
