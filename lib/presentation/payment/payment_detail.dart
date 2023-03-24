import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/Navigation.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';

import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/presentation/dashboard/screens/dashboard.dart';
import 'package:sizer/sizer.dart';

class PaymentDetail extends StatefulWidget {
  const PaymentDetail({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentDetail> createState() => _PaymentDetailState();
}

class _PaymentDetailState extends State<PaymentDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: EazylifeAppBar(
        title: LocaleKeys.paymentDetails.tr(),
        leadIcon: AppAssets.backIcon,
        onPressed: () {
          callNextScreen(context, const DashBoard());
        },
        sideIcon: null,
      ),
      body: Padding(
        padding: EdgeInsets.all(14.sp),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.paymentDetails.tr(),
              style: TextStyle(
                  fontFamily: AppFonts.poppinsSemiBold,
                  color: AppTheme.black,
                  fontSize: 16.sp),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.to.tr() + LocaleKeys.beneficiaryNameHint.tr(),
                  style: TextStyle(
                      fontFamily: AppFonts.poppinsMed,
                      color: AppTheme.black,
                      fontSize: 11.5.sp),
                ),
                Text(
                  "₹ 100",
                  style: TextStyle(
                      fontFamily: AppFonts.poppinsMed,
                      color: AppTheme.black,
                      fontSize: 11.5.sp),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              LocaleKeys.bankAcNo.tr() + LocaleKeys.bankAccountNumberHint.tr(),
              style: TextStyle(
                  fontFamily: AppFonts.poppinsMed,
                  color: AppTheme.black,
                  fontSize: 13.sp),
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              LocaleKeys.transferDetailCap.tr(),
              style: TextStyle(
                  fontFamily: AppFonts.poppinsSemiBold,
                  color: AppTheme.black,
                  fontSize: 16.sp),
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(LocaleKeys.amountToBeSent.tr(),
                    style: TextStyle(
                        color: AppTheme.black,
                        fontFamily: AppFonts.poppinsMed,
                        fontSize: 12.sp)),
                SizedBox(
                  height: 0.6.h,
                ),
                Text("₹100",
                    style: TextStyle(
                        color: AppTheme.black,
                        fontFamily: AppFonts.poppinsMed,
                        fontSize: 12.sp)),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(LocaleKeys.charges.tr(),
                    style: TextStyle(
                        color: AppTheme.black,
                        fontFamily: AppFonts.poppinsMed,
                        fontSize: 12.sp)),
                Text("₹0",
                    style: TextStyle(
                        color: AppTheme.black,
                        fontFamily: AppFonts.poppinsMed,
                        fontSize: 12.sp)),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            const Divider(
              color: AppTheme.grey,
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(LocaleKeys.totalAmount.tr(),
                    style: TextStyle(
                        color: AppTheme.black,
                        fontFamily: AppFonts.poppinsSemiBold,
                        fontSize: 14.sp)),
                Text("₹100",
                    style: TextStyle(
                        color: AppTheme.black,
                        fontFamily: AppFonts.poppinsSemiBold,
                        fontSize: 14.sp)),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            const Divider(
              color: AppTheme.grey,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              LocaleKeys.withdrawalId.tr() + LocaleKeys.paymentReferenceHint.tr(),
              style: TextStyle(
                  fontFamily: AppFonts.poppinsMed,
                  color: AppTheme.black,
                  fontSize: 12.sp),
            ),
            SizedBox(
              height: 0.8.h,
            ),
            Text(
              LocaleKeys.bankId.tr()+ LocaleKeys.bankAccountNumberHint.tr(),
              style: TextStyle(
                  fontFamily: AppFonts.poppinsMed,
                  color: AppTheme.black,
                  fontSize: 12.sp),
            ),
            SizedBox(
              height: 0.8.h,
            ),
            Text(
              LocaleKeys.dateTimeHint.tr(),
              style: TextStyle(
                  fontFamily: AppFonts.poppinsMed,
                  color: AppTheme.black,
                  fontSize: 12.sp),
            ),
          ],
        ),
      ),
    );
  }
}
