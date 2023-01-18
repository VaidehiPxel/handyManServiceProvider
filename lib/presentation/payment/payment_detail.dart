import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/Navigation.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';

import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
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
        title: AppString.paymentDetails,
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
              AppString.paymentDetails,
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
                  AppString.to + AppString.beneficiaryNameHint,
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
              AppString.bankAcNo + AppString.bankAccountNumberHint,
              style: TextStyle(
                  fontFamily: AppFonts.poppinsMed,
                  color: AppTheme.black,
                  fontSize: 13.sp),
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              AppString.transferDetailCap,
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
                Text(AppString.amountToBeSent,
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
                Text(AppString.charges,
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
                Text(AppString.totalAmount,
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
              AppString.withdrawalId + AppString.paymentReferenceHint,
              style: TextStyle(
                  fontFamily: AppFonts.poppinsMed,
                  color: AppTheme.black,
                  fontSize: 12.sp),
            ),
            SizedBox(
              height: 0.8.h,
            ),
            Text(
              AppString.bankId + AppString.bankAccountNumberHint,
              style: TextStyle(
                  fontFamily: AppFonts.poppinsMed,
                  color: AppTheme.black,
                  fontSize: 12.sp),
            ),
            SizedBox(
              height: 0.8.h,
            ),
            Text(
              AppString.dateTimeHint,
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
