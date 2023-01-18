import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/Navigation.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/custom_dialogs/dialog_icon.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';
import 'package:flutter_projects/_core/custom_widgets/side_blue_container.dart';

import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:flutter_projects/presentation/dashboard/screens/dashboard.dart';
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
        title: AppString.payment,
        leadIcon: AppAssets.backIcon,
        onPressed: () {
         Navigator.pop(context);
        },
        sideIcon: null,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(14.sp),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      AppString.internetBanking,
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
                      onTap: (){
                        callNextScreen(context, const AddBankDetails(isEdit: false));
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 1.h),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.add,
                              color: AppTheme.blue,
                              size: 9.sp,
                            ),
                            Text(
                              AppString.addBankDetailCap,
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
              SizedBox(height: 2.h,),
              Container(
                decoration: BoxDecoration(
                  color: AppTheme.lightGrey,
                  borderRadius: BorderRadius.circular(7.sp),
                ),
                child: Padding(
                  padding:  EdgeInsets.all(10.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap:(){
                                callNextScreen(context, AddBankDetails(isEdit: true));
                              },
                              child: Text(
                                AppString.edit,
                                style: TextStyle(
                                    fontFamily: AppFonts.poppinsMed,
                                    color: AppTheme.blue,
                                    fontSize: 12.sp),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 1.5.w),

                              child: Container(
                                height: 9.sp,
                                width: 0.5.w,
                                color: AppTheme.greyDivider,
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return DialogBoxWithIcon(
                                        icon: AppAssets.delete,
                                        content: Text(
                                          AppString.removeDetail,
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
                                        title: AppString.areYouSure,
                                        titleNo: AppString.cancel,
                                        titleYes: AppString.remove,
                                        colorNo: AppTheme.black,
                                        colorYes: AppTheme.white,
                                        colorYesBtn: AppTheme.red,
                                        sizeNo: 10.sp,
                                        titleFamily: AppFonts.poppinsMed,
                                      );
                                    });
                              },
                              child: Text(
                                AppString.remove,
                                style: TextStyle(
                                    fontFamily: AppFonts.poppinsMed,
                                    color: AppTheme.red,
                                    fontSize: 12.sp),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 0.7.h,),
                      RichText(
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        textScaleFactor: 1,
                        text:  TextSpan(
                          text:  AppString.bank,
                          style: TextStyle(
                              fontFamily: AppFonts.poppinsMed,
                              color: AppTheme.black,
                              fontSize: 11.sp),
                          children: <TextSpan>[
                            TextSpan(
                                text: AppString.bankNameHint,
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
                        text:  TextSpan(
                          text:  "${AppString.bankAccountNumber} : ",
                          style: TextStyle(
                              fontFamily: AppFonts.poppinsMed,
                              color: AppTheme.black,
                              fontSize: 11.sp),
                          children: <TextSpan>[
                            TextSpan(
                                text: AppString.bankAccountNumberHint,
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
                        text:  TextSpan(
                          text:  "${AppString.beneficiaryName} : ",
                          style: TextStyle(
                              fontFamily: AppFonts.poppinsMed,
                              color: AppTheme.black,
                              fontSize: 11.sp),
                          children: <TextSpan>[
                            TextSpan(
                                text: AppString.beneficiaryNameHint,
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
                        text:  TextSpan(
                          text:  "${AppString.paymentReference} : ",
                          style: TextStyle(
                              fontFamily: AppFonts.poppinsMed,
                              color: AppTheme.black,
                              fontSize: 11.sp),
                          children: <TextSpan>[
                            TextSpan(
                                text: AppString.paymentReferenceHint,
                                style: TextStyle(
                                    fontFamily: AppFonts.poppins,
                                    color: AppTheme.black,
                                    fontSize: 11.sp)),
                          ],
                        ),
                      ),
                      SizedBox(height: 2.h,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2.h,),
              Container(
                decoration: BoxDecoration(
                  color: AppTheme.blue,
                  borderRadius: BorderRadius.circular(7.sp),
                ),
                child: Padding(
                  padding:  EdgeInsets.all(7.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Row(
                       children: [
                         SizedBox(width: 1.w,),
                         SvgPicture.asset(AppAssets.wallet,
                        ),
                         SizedBox(width: 3.5.w,),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(
                               AppString.availableBalance,
                               style: TextStyle(
                                   fontFamily: AppFonts.poppinsMed,
                                   color: AppTheme.white,
                                   fontSize: 11.sp),
                             ),
                             Text(
                               "${AppString.rs}50000",
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
                        onTap: (){
                          callNextScreen(context, const WithdrawalMoney());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.sp),
                              color: AppTheme.lightWhiteBlue),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.5.w, vertical: 1.h),
                            child: Text(
                              AppString.withdraw,
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
              SizedBox(height: 2.h,),
              Text(
                AppString.paymentHistory,
                style: TextStyle(
                    fontFamily: AppFonts.poppinsSemiBold,
                    color: AppTheme.black,
                    fontSize: 16.sp),
              ),
              SizedBox(height: 2.h,),
              Row(
                children: [
                  const SideBlueContainer(),
                  SizedBox(width: 2.w,),
                  Text(
                    "November 2020",
                    style: TextStyle(
                        fontFamily: AppFonts.poppinsSemiBold,
                        color: AppTheme.black,
                        fontSize: 13.sp),
                  ),

                ],
              ),
              SizedBox(height: 2.h,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppTheme.lightGrey,
                  borderRadius: BorderRadius.circular(7.sp),
                ),
                child: Padding(
                  padding:  EdgeInsets.all(10.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppString.settlementSummary,
                        style: TextStyle(
                            fontFamily: AppFonts.poppinsSemiBold,
                            color: AppTheme.black,
                            fontSize: 12.sp),
                      ),
                      Text(
                        AppString.totalPayment,
                        style: TextStyle(
                            fontFamily: AppFonts.poppins,
                            color: AppTheme.black,
                            fontSize: 10.sp),
                      ),
                      SizedBox(height: 2.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildColumn(AppString.collection,"${AppString.rs}5,000"),
                          Container(
                            color: AppTheme.grey,
                            width: 0.3.w,
                            height: 4.h,
                          ),
                          buildColumn(AppString.deductions,"${AppString.rs}132.57"),
                          Container(
                            color: AppTheme.grey,
                            width: 0.3.w,
                            height: 4.h,
                          ),
                          buildColumn(AppString.netSettlement,"${AppString.rs}4867.25"),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2.h,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppTheme.lightGrey,
                  borderRadius: BorderRadius.circular(7.sp),
                ),
                child: Padding(
                  padding:  EdgeInsets.all(10.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${AppString.last3Transactions}November 2020",
                        style: TextStyle(
                            fontFamily: AppFonts.poppinsSemiBold,
                            color: AppTheme.black,
                            fontSize: 12.sp),
                      ),
                      SizedBox(height: 2.h,),
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
                                    padding:  EdgeInsets.only(top:0.9.h),
                                    child: SvgPicture.asset(AppAssets.chargeSvg,
                                    height: 1.5.h,),
                                  ),
                                  SizedBox(width: 3.w,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        AppString.paymentFromPaypal,
                                        style: TextStyle(
                                            fontFamily: AppFonts.poppinsSemiBold,
                                            color: AppTheme.black,
                                            fontSize: 12.sp),
                                      ),
                                      SizedBox(height: 0.3.h,),
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
                                "${AppString.rs}1,500",
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
          )
        ),
      ),
    );
  }

  buildColumn(String key,String value) {
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
