import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/constants/app_string.g.dart';
import 'package:flutter_projects/_core/custom_widgets/api_loader.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';
import 'package:flutter_projects/_core/custom_widgets/app_button.dart';
import 'package:flutter_projects/_core/custom_widgets/eazylife_widget.dart';
import 'package:flutter_projects/_core/navigation.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/application/help/help_bloc.dart';
import 'package:flutter_projects/application/help/help_event.dart';
import 'package:flutter_projects/application/help/help_state.dart';
import 'package:flutter_projects/presentation/dashboard/screens/dashboard.dart';
import 'package:sizer/sizer.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<HelpBloc, HelpState>(
      listener: (context, state) {
        if (state is HelpShowMessage || state is HelpError) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(
                  (state is HelpShowMessage)
                      ? state.msg
                      : (state is HelpError)
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
        if (state is HelpSuccess) {
          ScaffoldMessenger.maybeOf(context)!.showSnackBar(
              const SnackBar(content: Text("Submitted successfully")));
          Future.delayed(const Duration(milliseconds: 1000), () {
            callNextScreen(context, const DashBoard());
          });
        }
      },
      child: BlocBuilder<HelpBloc, HelpState>(
        builder: (context, state) {
          return Scaffold(
              appBar: EazylifeAppBar(
                title: LocaleKeys.help.tr(),
                leadIcon: AppAssets.backIcon,
                onPressed: () {
                  Navigator.pop(context);
                },
                sideIcon: null,
              ),
              body: renderbodyView(state));
        },
      ),
    );
  }

  Widget renderbodyView(HelpState state) {
    return Padding(
      padding: EdgeInsets.all(18.sp),
      child: SingleChildScrollView(
        child: Column(
          children: [
            EazyLifeWidget(
              title: LocaleKeys.firstName.tr(),
              widget: _customTextField(
                  6.h, LocaleKeys.firstNameHint.tr(), 1, firstNameController),
            ),
            SizedBox(
              height: 1.h,
            ),
            EazyLifeWidget(
              title: LocaleKeys.lastName.tr(),
              widget: _customTextField(
                  6.h, LocaleKeys.lastNameHint.tr(), 1, lastNameController),
            ),
            SizedBox(
              height: 1.h,
            ),
            EazyLifeWidget(
              title: LocaleKeys.emailAddress.tr(),
              widget: _customTextField(
                  6.h, LocaleKeys.emailAddressHint.tr(), 1, emailController),
            ),
            SizedBox(
              height: 1.h,
            ),
            EazyLifeWidget(
              title: LocaleKeys.mobileNumber.tr(),
              widget: _customTextField(
                  6.h, LocaleKeys.mobileNumberHint.tr(), 1, mobileController),
            ),
            SizedBox(
              height: 1.h,
            ),
            EazyLifeWidget(
              title: LocaleKeys.message.tr(),
              widget: _customTextField(
                  25.h, LocaleKeys.messageHint.tr(), 70, messageController),
            ),
            SizedBox(
              height: 2.5.h,
            ),
            if (state is! HelpLoading)
              AppButton(
                title: LocaleKeys.submit.tr(),
                onPressed: () {
                  if (firstNameController.text.isNotEmpty &&
                      lastNameController.text.isNotEmpty &&
                      emailController.text.isNotEmpty &&
                      mobileController.text.isNotEmpty &&
                      messageController.text.isNotEmpty) {
                    context.read<HelpBloc>().add(HelpSubmitCallApiEvent(
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        email: emailController.text,
                        mobile: mobileController.text,
                        message: messageController.text));
                  } else {
                    if (firstNameController.text.isEmpty) {
                      ScaffoldMessenger.maybeOf(context)!.showSnackBar(
                          const SnackBar(
                              content: Text("FirstName can't be empty")));
                    } else if (lastNameController.text.isEmpty) {
                      ScaffoldMessenger.maybeOf(context)!.showSnackBar(
                          const SnackBar(
                              content: Text("LastName can't be empty")));
                    } else if (emailController.text.isEmpty) {
                      ScaffoldMessenger.maybeOf(context)!.showSnackBar(
                          const SnackBar(
                              content: Text("Email can't be empty")));
                    } else if (mobileController.text.isEmpty) {
                      ScaffoldMessenger.maybeOf(context)!.showSnackBar(
                          const SnackBar(
                              content: Text("Mobile can't be empty")));
                    } else if (messageController.text.isEmpty) {
                      ScaffoldMessenger.maybeOf(context)!.showSnackBar(
                          const SnackBar(
                              content: Text("Message can't be empty")));
                    }
                  }
                },
              )
            else
              const APILoader(),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget _customTextField(double height, String hintText, int maxLine,
      TextEditingController controller) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: AppTheme.lightGrey,
        borderRadius: BorderRadius.circular(8.sp),
        shape: BoxShape.rectangle,
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          maxLines: maxLine,
          enableIMEPersonalizedLearning: true,
          enableSuggestions: true,
          style: TextStyle(fontFamily: AppFonts.poppins, fontSize: 12.sp),
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              contentPadding: EdgeInsets.all(12.sp),
              hintStyle: TextStyle(
                  fontFamily: AppFonts.poppins,
                  color: AppTheme.medGrey,
                  fontSize: 12.sp)),
        ),
      ),
    );
  }
}
