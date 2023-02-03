import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/_core/Navigation.dart';
import 'package:flutter_projects/_core/custom_widgets/api_loader.dart';
import 'package:flutter_projects/_core/custom_widgets/auth_button.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:flutter_projects/application/auth/auth_bloc.dart';
import 'package:flutter_projects/application/auth/auth_event.dart';
import 'package:flutter_projects/application/auth/auth_state.dart';
import 'package:flutter_projects/presentation/auth/widget/app_bg_widget.dart';
import 'package:flutter_projects/presentation/dashboard/screens/dashboard.dart';
import 'package:sizer/sizer.dart';

class SetNewPasswordScreen extends StatefulWidget {
  final String mobileNo;
  const SetNewPasswordScreen({super.key, required this.mobileNo});

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  bool obscureText = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SetPasswordShowMessage || state is SetPasswordError) {
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
        if (state is SetPasswordSuccess) {
          callNextScreen(context, const DashBoard());
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
                                controller: passwordController,
                                style: const TextStyle(
                                    color: AppTheme.blue,
                                    fontFamily: AppFonts.poppinsMed),
                                decoration: InputDecoration(
                                  labelText: AppString.newPassword,
                                  focusColor: AppTheme.blue,
                                  labelStyle: const TextStyle(
                                      color: AppTheme.authGrey,
                                      fontFamily: AppFonts.poppinsMed),
                                  prefixIcon: Image.asset(
                                    AppAssets.password,
                                    color: AppTheme.authGrey,
                                  ),
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
                                      color: AppTheme.blue,
                                    ),
                                  ),
                                ),
                                obscureText: obscureText,
                              ),
                            ),
                            Theme(
                              data: ThemeData(primaryColor: Colors.blue),
                              child: TextFormField(
                                controller: confirmPasswordController,
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontFamily: AppFonts.poppinsMed),
                                decoration: InputDecoration(
                                  labelText: AppString.confirmPassword,
                                  focusColor: Colors.blue,
                                  labelStyle: const TextStyle(
                                      color: AppTheme.authGrey,
                                      fontFamily: AppFonts.poppinsMed),
                                  prefixIcon: Image.asset(
                                    AppAssets.password,
                                    color: AppTheme.authGrey,
                                  ),
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
                            if (state is! OtpVerifyLoading)
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: AuthButton(
                                    btnTitle: AppString.save,
                                    onPressed: () {
                                      if (passwordController.text.isNotEmpty &&
                                          confirmPasswordController
                                              .text.isNotEmpty) {
                                        context.read<AuthBloc>().add(
                                            SetPasswordApiEvent(
                                                mobileNo: widget.mobileNo,
                                                password:
                                                    passwordController.text,
                                                confirmPassword:
                                                    confirmPasswordController
                                                        .text));
                                      } else {
                                        if (passwordController.text.isEmpty) {
                                          ScaffoldMessenger.maybeOf(context)!
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      "Please Enter Password")));
                                        } else if (confirmPasswordController
                                            .text.isEmpty) {
                                          ScaffoldMessenger.maybeOf(context)!
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      "Please Enter Confirm Password")));
                                        }
                                      }
                                    }),
                              )
                            else
                              const APILoader(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
