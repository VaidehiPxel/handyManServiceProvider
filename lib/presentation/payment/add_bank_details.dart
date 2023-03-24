import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';
import 'package:flutter_projects/_core/custom_widgets/app_button.dart';
import 'package:flutter_projects/_core/custom_widgets/eazylife_widget.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:sizer/sizer.dart';

class AddBankDetails extends StatefulWidget {
  final bool isEdit;
  const AddBankDetails({
    Key? key,
    required this.isEdit,
  }) : super(key: key);

  @override
  State<AddBankDetails> createState() => _AddBankDetailsState();
}

class _AddBankDetailsState extends State<AddBankDetails> {
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: EazylifeAppBar(
        title: widget.isEdit
            ? LocaleKeys.editBankDetail.tr()
            : LocaleKeys.addBankDetail.tr(),
        leadIcon: AppAssets.backIcon,
        onPressed: () {
          Navigator.pop(context);
        },
        sideIcon: null,
      ),
      body: Padding(
        padding: EdgeInsets.all(14.sp),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: setDetailField()),
            AppButton(
              title: widget.isEdit ? LocaleKeys.update.tr() : LocaleKeys.save.tr(),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget _customTextField(String hintText, int maxLine) {
    return Container(
      height: 5.5.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppTheme.paymentBorder),
        borderRadius: BorderRadius.circular(5.sp),
        shape: BoxShape.rectangle,
      ),
      child: Center(
        child: TextFormField(
          maxLines: maxLine,
          enableIMEPersonalizedLearning: true,
          enableSuggestions: true,
          style: TextStyle(fontFamily: AppFonts.poppins, fontSize: 12.sp),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            contentPadding: EdgeInsets.all(10.sp),
            hintStyle: TextStyle(
                fontFamily: AppFonts.poppins,
                color: AppTheme.medGrey,
                fontSize: 12.sp),
          ),
          obscureText: obscureText,
        ),
      ),
    );
  }

  Widget setDetailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.isEdit ? LocaleKeys.editBankDetail.tr() : LocaleKeys.addBankDetail.tr(),
          style: TextStyle(
              fontFamily: AppFonts.poppinsSemiBold,
              color: AppTheme.black,
              fontSize: 16.sp),
        ),
        SizedBox(
          height: 1.5.h,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.sp),
              color: AppTheme.lightGrey),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
            child: Column(
              children: [
                EazyLifeWidget(
                  title: LocaleKeys.bankName.tr(),
                  widget: _customTextField(LocaleKeys.bankNameHint.tr(), 1),
                ),
                SizedBox(
                  height: 2.h,
                ),
                EazyLifeWidget(
                  title: LocaleKeys.bankAccountNumber.tr(),
                  widget: _customTextField(LocaleKeys.bankAccountNumberHint.tr(), 1),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: EazyLifeWidget(
                        title: LocaleKeys.beneficiaryName.tr(),
                        widget:
                            _customTextField(LocaleKeys.beneficiaryNameHint.tr(), 1),
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Expanded(
                      child: EazyLifeWidget(
                        title: LocaleKeys.paymentReference.tr(),
                        widget: _customTextField(
                            LocaleKeys.paymentReferenceHint.tr(), 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
