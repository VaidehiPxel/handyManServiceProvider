import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/Navigation.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/constants/app_string.g.dart';
import 'package:flutter_projects/_core/custom_dialogs/dialog_icon.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';
import 'package:flutter_projects/_core/custom_widgets/side_blue_container.dart';

import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/presentation/payment/add_bank_details.dart';
import 'package:flutter_projects/presentation/payment/withdrawal_money.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: EazylifeAppBar(
        title: LocaleKeys.payment.tr(),
        leadIcon: AppAssets.backIcon,
        onPressed: () {
          Navigator.pop(context);
        },
        sideIcon: null,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(14.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        LocaleKeys.internetBanking.tr(),
                        style: TextStyle(
                            fontFamily: AppFonts.poppinsSemiBold,
                            color: AppTheme.black,
                            fontSize: 16.sp),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.sp),
                          color: AppTheme.blue.withOpacity(0.1)),
                      child: GestureDetector(
                        onTap: () {
                          callNextScreen(
                              context, const AddBankDetails(isEdit: false));
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.5.w, vertical: 1.h),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.add,
                                color: AppTheme.blue,
                                size: 9.sp,
                              ),
                              Text(
                                LocaleKeys.addBankDetailCap.tr(),
                                style: TextStyle(
                                    fontFamily: AppFonts.poppinsMed,
                                    color: AppTheme.blue,
                                    fontSize: 8.sp),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppTheme.lightGrey,
                    borderRadius: BorderRadius.circular(7.sp),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  callNextScreen(context,
                                      const AddBankDetails(isEdit: true));
                                },
                                child: Text(
                                  LocaleKeys.edit.tr(),
                                  style: TextStyle(
                                      fontFamily: AppFonts.poppinsMed,
                                      color: AppTheme.blue,
                                      fontSize: 12.sp),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 1.5.w),
                                child: Container(
                                  height: 9.sp,
                                  width: 0.5.w,
                                  color: AppTheme.greyDivider,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return DialogBoxWithIcon(
                                          icon: AppAssets.delete,
                                          content: Text(
                                            LocaleKeys.removeDetail.tr(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: AppTheme.black,
                                                fontFamily: AppFonts.poppins,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 10.sp),
                                          ),
                                          iconColor: AppTheme.red,
                                          onCancelPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          onOkPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          title: LocaleKeys.areYouSure.tr(),
                                          titleNo: LocaleKeys.cancel.tr(),
                                          titleYes: LocaleKeys.remove.tr(),
                                          colorNo: AppTheme.black,
                                          colorYes: AppTheme.white,
                                          colorYesBtn: AppTheme.red,
                                          sizeNo: 10.sp,
                                          titleFamily: AppFonts.poppinsMed,
                                        );
                                      });
                                },
                                child: Text(
                                  LocaleKeys.remove.tr(),
                                  style: TextStyle(
                                      fontFamily: AppFonts.poppinsMed,
                                      color: AppTheme.red,
                                      fontSize: 12.sp),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 0.7.h,
                        ),
                        RichText(
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          textScaleFactor: 1,
                          text: TextSpan(
                            text: LocaleKeys.bank.tr(),
                            style: TextStyle(
                                fontFamily: AppFonts.poppinsMed,
                                color: AppTheme.black,
                                fontSize: 11.sp),
                            children: <TextSpan>[
                              TextSpan(
                                  text: LocaleKeys.bankNameHint.tr(),
                                  style: TextStyle(
                                      fontFamily: AppFonts.poppins,
                                      color: AppTheme.black,
                                      fontSize: 11.sp)),
                            ],
                          ),
                        ),
                        RichText(
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          textScaleFactor: 1,
                          text: TextSpan(
                            text: "${LocaleKeys.bankAccountNumber.tr()} : ",
                            style: TextStyle(
                                fontFamily: AppFonts.poppinsMed,
                                color: AppTheme.black,
                                fontSize: 11.sp),
                            children: <TextSpan>[
                              TextSpan(
                                  text: LocaleKeys.bankAccountNumberHint.tr(),
                                  style: TextStyle(
                                      fontFamily: AppFonts.poppins,
                                      color: AppTheme.black,
                                      fontSize: 11.sp)),
                            ],
                          ),
                        ),
                        RichText(
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          textScaleFactor: 1,
                          text: TextSpan(
                            text: "${LocaleKeys.beneficiaryName.tr()} : ",
                            style: TextStyle(
                                fontFamily: AppFonts.poppinsMed,
                                color: AppTheme.black,
                                fontSize: 11.sp),
                            children: <TextSpan>[
                              TextSpan(
                                  text: LocaleKeys.beneficiaryNameHint.tr(),
                                  style: TextStyle(
                                      fontFamily: AppFonts.poppins,
                                      color: AppTheme.black,
                                      fontSize: 11.sp)),
                            ],
                          ),
                        ),
                        RichText(
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          textScaleFactor: 1,
                          text: TextSpan(
                            text: "${LocaleKeys.paymentReference.tr()} : ",
                            style: TextStyle(
                                fontFamily: AppFonts.poppinsMed,
                                color: AppTheme.black,
                                fontSize: 11.sp),
                            children: <TextSpan>[
                              TextSpan(
                                  text: LocaleKeys.paymentReferenceHint.tr(),
                                  style: TextStyle(
                                      fontFamily: AppFonts.poppins,
                                      color: AppTheme.black,
                                      fontSize: 11.sp)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppTheme.blue,
                    borderRadius: BorderRadius.circular(7.sp),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(7.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 1.w,
                            ),
                            SvgPicture.asset(
                              AppAssets.wallet,
                            ),
                            SizedBox(
                              width: 3.5.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  LocaleKeys.availableBalance.tr(),
                                  style: TextStyle(
                                      fontFamily: AppFonts.poppinsMed,
                                      color: AppTheme.white,
                                      fontSize: 11.sp),
                                ),
                                Text(
                                  "${LocaleKeys.rs.tr()}50000",
                                  style: TextStyle(
                                      fontFamily: AppFonts.poppinsSemiBold,
                                      color: AppTheme.white,
                                      fontSize: 14.sp),
                                ),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            callNextScreen(context, const WithdrawalMoney());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.sp),
                                color: AppTheme.lightWhiteBlue),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4.5.w, vertical: 1.h),
                              child: Text(
                                LocaleKeys.withdraw.tr(),
                                style: TextStyle(
                                    fontFamily: AppFonts.poppinsSemiBold,
                                    color: AppTheme.black,
                                    fontSize: 9.sp),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  LocaleKeys.paymentHistory.tr(),
                  style: TextStyle(
                      fontFamily: AppFonts.poppinsSemiBold,
                      color: AppTheme.black,
                      fontSize: 16.sp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    const SideBlueContainer(),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      "November 2020",
                      style: TextStyle(
                          fontFamily: AppFonts.poppinsSemiBold,
                          color: AppTheme.black,
                          fontSize: 13.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppTheme.lightGrey,
                    borderRadius: BorderRadius.circular(7.sp),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys.settlementSummary.tr(),
                          style: TextStyle(
                              fontFamily: AppFonts.poppinsSemiBold,
                              color: AppTheme.black,
                              fontSize: 12.sp),
                        ),
                        Text(
                          LocaleKeys.totalPayment.tr(),
                          style: TextStyle(
                              fontFamily: AppFonts.poppins,
                              color: AppTheme.black,
                              fontSize: 10.sp),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildColumn(LocaleKeys.collection.tr(),
                                "${LocaleKeys.rs.tr()}5,000"),
                            Container(
                              color: AppTheme.grey,
                              width: 0.3.w,
                              height: 4.h,
                            ),
                            buildColumn(LocaleKeys.deductions.tr(),
                                "${LocaleKeys.rs.tr()}132.57"),
                            Container(
                              color: AppTheme.grey,
                              width: 0.3.w,
                              height: 4.h,
                            ),
                            buildColumn(LocaleKeys.netSettlement.tr(),
                                "${LocaleKeys.rs.tr()}4867.25"),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppTheme.lightGrey,
                    borderRadius: BorderRadius.circular(7.sp),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${LocaleKeys.last3Transactions.tr()}November 2020",
                          style: TextStyle(
                              fontFamily: AppFonts.poppinsSemiBold,
                              color: AppTheme.black,
                              fontSize: 12.sp),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        ListView.separated(
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 2.h,
                            );
                          },
                          itemCount: 3,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 0.9.h),
                                      child: SvgPicture.asset(
                                        AppAssets.chargeSvg,
                                        height: 1.5.h,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          LocaleKeys.paymentFromPaypal.tr(),
                                          style: TextStyle(
                                              fontFamily:
                                                  AppFonts.poppinsSemiBold,
                                              color: AppTheme.black,
                                              fontSize: 12.sp),
                                        ),
                                        SizedBox(
                                          height: 0.3.h,
                                        ),
                                        Text(
                                          "30 Nov, 08:32 PM",
                                          style: TextStyle(
                                              fontFamily: AppFonts.poppins,
                                              color: AppTheme.black,
                                              fontSize: 12.sp),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Text(
                                  "${LocaleKeys.rs.tr()}1,500",
                                  style: TextStyle(
                                      fontFamily: AppFonts.poppinsSemiBold,
                                      color: AppTheme.black,
                                      fontSize: 12.sp),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  buildColumn(String key, String value) {
    return Column(
      children: [
        Text(
          key,
          style: TextStyle(
              fontFamily: AppFonts.poppins,
              color: AppTheme.black,
              fontSize: 10.sp),
        ),
        Text(
          value,
          style: TextStyle(
              fontFamily: AppFonts.poppinsSemiBold,
              color: AppTheme.black,
              fontSize: 10.sp),
        ),
      ],
    );
  }
}
