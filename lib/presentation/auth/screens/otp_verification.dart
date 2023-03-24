import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/_core/Navigation.dart';
import 'package:flutter_projects/_core/constants/app_string.g.dart';
import 'package:flutter_projects/_core/constants/hive_constant.dart';
import 'package:flutter_projects/_core/custom_widgets/api_loader.dart';
import 'package:flutter_projects/_core/custom_widgets/auth_button.dart';
import 'package:flutter_projects/_core/custom_widgets/eazylife_scaffold.dart';
import 'package:flutter_projects/_core/custom_widgets/otp_text_field.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/application/auth/auth_bloc.dart';
import 'package:flutter_projects/application/auth/auth_event.dart';
import 'package:flutter_projects/application/auth/auth_state.dart';
import 'package:flutter_projects/presentation/auth/screens/set_new_password.dart';
import 'package:sizer/sizer.dart';

class OTPVerification extends StatefulWidget {
  final String mobileNo;
  const OTPVerification({super.key, required this.mobileNo});

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  String otpValue = "";
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is OtpVerifyMessage || state is OtpVerifyError) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(
                  (state is OtpVerifyMessage)
                      ? state.msg
                      : (state is OtpVerifyError)
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
        if (state is VerifyOtpSuccess) {
          callNextScreen(
              context,
              SetNewPasswordScreen(
                mobileNo: widget.mobileNo,
              ));
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return EazylifeScaffold(
            children: [
              SizedBox(
                height: 5.h,
              ),
              Center(
                child: Text(
                  LocaleKeys.otpVerification,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontFamily: AppFonts.poppinsBold,
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              RichText(
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
               // textDirection: TextDirection.ltr,
                softWrap: true,
                maxLines: 2,
                textScaleFactor: 1,
                text: TextSpan(
                  text: LocaleKeys.enterTheOtp,
                  style: TextStyle(
                      color: AppTheme.grey,
                      fontFamily: AppFonts.poppinsMed,
                      fontSize: 12.sp),
                  children: <TextSpan>[
                    TextSpan(
                        text: widget.mobileNo,
                        style: TextStyle(
                            color: AppTheme.black,
                            fontFamily: AppFonts.poppinsSemiBold,
                            fontSize: 14.sp)),
                  ],
                ),
              ),
              RichText(
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
               // textDirection: TextDirection.LTR,
                softWrap: true,
                maxLines: 2,
                textScaleFactor: 1,
                text: TextSpan(
                  text: "  OTP:  ",
                  style: TextStyle(
                      color: AppTheme.grey,
                      fontFamily: AppFonts.poppinsMed,
                      fontSize: 12.sp),
                  children: <TextSpan>[
                    TextSpan(
                        text: HiveConstants.instances.box1
                            .get(HiveConstants.userOTPKey),
                        style: TextStyle(
                            color: AppTheme.grey,
                            fontFamily: AppFonts.poppinsSemiBold,
                            fontSize: 10.sp)),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              OtpTextField(
                onSubmit: (value) {
                  setState(() {
                    otpValue = value;
                  });
                },
                borderColor: Colors.blue,
                showFieldAsBox: true,
                autoFocus: true,
                borderRadius: BorderRadius.circular(8.sp),
                borderWidth: 2,
                clearText: true,
                cursorColor: Colors.blue,
                fieldWidth: 12.w,
                fieldHeight: 6.h,
                onCodeChanged: (value) {},
                showCursor: true,
                textStyle: TextStyle(
                    fontSize: 20.sp,
                    fontFamily: AppFonts.poppinsSemiBold,
                    color: Colors.blue),
                obscureText: true,
              ),
              SizedBox(
                height: 3.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: RichText(
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.end,
                   // textDirection: TextDirection.RTL,
                    softWrap: true,
                    maxLines: 1,
                    textScaleFactor: 1,
                    text: TextSpan(
                      text: LocaleKeys.doNotReceive.tr(),
                      style: TextStyle(
                          color: AppTheme.grey,
                          fontFamily: AppFonts.poppinsMed,
                          fontSize: 12.sp),
                      children: <TextSpan>[
                        TextSpan(
                          text: LocaleKeys.resendOTP.tr(),
                          style: TextStyle(
                              color: AppTheme.blue,
                              fontFamily: AppFonts.poppinsMed,
                              fontSize: 12.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (state is! OtpVerifyLoading)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: AuthButton(
                      btnTitle: LocaleKeys.verifyNow.tr(),
                      onPressed: () {
                        if (otpValue.isNotEmpty) {
                          context.read<AuthBloc>().add(OtpVerifyApiEvent(
                              mobileNo: widget.mobileNo, otp: otpValue));
                        } else {
                          if (otpValue.isEmpty) {
                            ScaffoldMessenger.maybeOf(context)!.showSnackBar(
                                 SnackBar(
                                    content: Text(LocaleKeys.enterOtP.tr())));
                          }
                        }
                      }),
                )
              else
                const APILoader(),
            ],
          );
        },
      ),
    );
  }
}
