import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/Navigation.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/custom_dialogs/dialog_icon.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';
import 'package:flutter_projects/_core/custom_widgets/app_button.dart';
import 'package:flutter_projects/_core/custom_widgets/eazylife_widget.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:flutter_projects/presentation/payment/payment_detail.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class WithdrawalMoney extends StatefulWidget {
  const WithdrawalMoney({
    Key? key,
  }) : super(key: key);

  @override
  State<WithdrawalMoney> createState() => _WithdrawalMoneyState();
}

class _WithdrawalMoneyState extends State<WithdrawalMoney> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: EazylifeAppBar(
        title: AppString.withdrawalMoney,
        leadIcon: AppAssets.backIcon,
        onPressed: () {
          if(currentIndex==2){
            currentIndex=1;
          }else if(currentIndex==1){
            currentIndex=0;
          }else{
            Navigator.pop(context);

          }
          setState(() {

          });
        },
        sideIcon: null,
      ),
      body: Padding(
        padding: EdgeInsets.all(14.sp),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: currentIndex == 0
                    ? setMoneyWithdrawal()
                    : currentIndex == 1
                        ? selectBank()
                        : currentIndex == 2
                            ? sendingMoneyFrom()
                            : Container()),
            currentIndex == 1
                ? Container()
                : AppButton(
                    title: currentIndex == 0
                        ? AppString.proceed
                        : currentIndex == 2
                            ? AppString.pay
                            : AppString.save,
                    onPressed: () {
                     setState(() {
                       if (currentIndex == 0) {
                         currentIndex = 1;
                       }
                       else if (currentIndex == 2) {
                         showDialog(
                             context: context,
                             builder: (BuildContext context) {
                               return DialogBoxWithIcon(
                                 icon: AppAssets.save,
                                 content: Text(
                                   "₹100",
                                   textAlign: TextAlign.center,
                                   style: TextStyle(
                                       color: AppTheme.black,
                                       fontFamily: AppFonts.poppinsBold,
                                       fontSize: 14.sp),
                                 ),
                                 iconColor: AppTheme.dialogGreen,
                                 onOkPressed: () {
                                   Navigator.of(context).pop();
                                   callNextScreen(context, PaymentDetail());
                                 },
                                 title:  AppString.moneyBankToSuccess,
                                 titleYes: AppString.viewDetails,
                                 colorYes: AppTheme.white,
                                 sizeNo: 10.sp,
                                 titleFamily: AppFonts.poppinsMed,
                                 onCancelPressed: () {},
                               );
                             });
                       }
                     });
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

  Widget setMoneyWithdrawal() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.moneyWithdrawal,
          style: TextStyle(
              fontFamily: AppFonts.poppinsSemiBold,
              color: AppTheme.black,
              fontSize: 16.sp),
        ),
        SizedBox(
          height: 1.5.h,
        ),
        Text(
          AppString.moneyWithdrawalDes,
          style: TextStyle(
              fontFamily: AppFonts.poppins,
              color: AppTheme.medGrey,
              fontSize: 10.sp),
        ),
        SizedBox(
          height: 2.5.h,
        ),
        TextFormField(
          style: TextStyle(
              fontFamily: AppFonts.poppinsMed,
              color: AppTheme.black,
              fontSize: 18.sp),
          decoration: InputDecoration(
              focusColor: Colors.black,
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppTheme.amountGrey),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppTheme.amountGrey),
              ),
              contentPadding: EdgeInsets.all(10.sp),
              hintText: AppString.amount,
              hintStyle: TextStyle(
                  fontFamily: AppFonts.poppinsMed,
                  color: AppTheme.amountGrey,
                  fontSize: 18.sp),
              prefixIcon: SvgPicture.asset(AppAssets.rupee,
                  color: AppTheme.amountGrey)),
        ),
      ],
    );
  }

  Widget selectBank() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                AppString.selectBankAccount,
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
            )
          ],
        ),
        SizedBox(
          height: 1.5.h,
        ),
        ListView.separated(
          separatorBuilder: (context, index) {
            return Divider(
              color: AppTheme.grey,
              thickness: 0.1.h,
            );
          },
          itemCount: 2,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 7.sp),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 2;
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppString.bankNameHint,
                      style: TextStyle(
                          fontFamily: AppFonts.poppinsSemiBold,
                          color: AppTheme.black,
                          fontSize: 11.sp),
                    ),
                    Text(AppString.acNo + AppString.bankAccountNumberHint,
                        style: TextStyle(
                            color: AppTheme.black,
                            fontFamily: AppFonts.poppins,
                            fontSize: 11.sp)),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget sendingMoneyFrom() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                AppString.sendingMoneyFrom,
                style: TextStyle(
                    fontFamily: AppFonts.poppinsSemiBold,
                    color: AppTheme.black,
                    fontSize: 16.sp),
              ),
            ),
            Container(
              width: 5.w,
            )
          ],
        ),
        SizedBox(
          height: 2.5.h,
        ),
        Text(
          AppString.bankNameHint,
          style: TextStyle(
              fontFamily: AppFonts.poppinsSemiBold,
              color: AppTheme.black,
              fontSize: 11.sp),
        ),
        Text(AppString.acNo + AppString.bankAccountNumberHint,
            style: TextStyle(
                color: AppTheme.black,
                fontFamily: AppFonts.poppins,
                fontSize: 11.sp)),
        SizedBox(height: 1.h,),
        Divider(
          color: AppTheme.grey,
        ),
        SizedBox(height: 1.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppString.amountToBeSent,
                style: TextStyle(
                    color: AppTheme.black,
                    fontFamily: AppFonts.poppinsMed,
                    fontSize: 11.sp)),
            SizedBox(height: 0.6.h,),
            Text("₹100",
                style: TextStyle(
                    color: AppTheme.black,
                    fontFamily: AppFonts.poppinsMed,
                    fontSize: 11.sp)),
          ],
        ),
        SizedBox(height: 1.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppString.charges,
                style: TextStyle(
                    color: AppTheme.black,
                    fontFamily: AppFonts.poppinsMed,
                    fontSize: 11.sp)),
            Text("₹0",
                style: TextStyle(
                    color: AppTheme.black,
                    fontFamily: AppFonts.poppinsMed,
                    fontSize: 11.sp)),
          ],
        ),
        SizedBox(height: 1.h,),
        Divider(
          color: AppTheme.grey,
        ),
        SizedBox(height: 1.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppString.totalPayable,
                style: TextStyle(
                    color: AppTheme.black,
                    fontFamily: AppFonts.poppinsSemiBold,
                    fontSize: 13.sp)),
            Text("₹100",
                style: TextStyle(
                    color: AppTheme.black,
                    fontFamily: AppFonts.poppinsSemiBold,
                    fontSize: 13.sp)),
          ],
        ),
      ],
    );
  }
}
