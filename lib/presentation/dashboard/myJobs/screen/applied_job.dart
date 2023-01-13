import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/custom_dialogs/dialog_icon.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';
import 'package:flutter_projects/_core/custom_widgets/job_status_widget.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class AppliedJobDetail extends StatefulWidget {
  const AppliedJobDetail({Key? key}) : super(key: key);

  @override
  State<AppliedJobDetail> createState() => _AppliedJobDetailState();
}

class _AppliedJobDetailState extends State<AppliedJobDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EazylifeAppBar(
        title: "Sofa Cleaning",
        leadIcon: AppAssets.backIcon,
        onPressed: () {
          Navigator.pop(context);
        },
        sideIcon: null,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(18.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              setTitle(),
              SizedBox(
                height: 0.5.h,
              ),
              _putDivider(),
              _setDescription(),
              _putDivider(),
              _setAddress(),
              _putDivider(),
              _cancelApplication(),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Divider _putDivider() {
    return const Divider(
      color: AppTheme.grey,
      thickness: 1,
    );
  }

  Widget setTitle() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 7,
              child: Text(
                "Sofa Cleaning",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontFamily: AppFonts.poppinsSemiBold,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:  EdgeInsets.only( right: 2.w),
                    child: SvgPicture.asset(
                      AppAssets.calSvg,
                      height: 10.sp,
                      width: 10.sp,
                    ),
                  ),
                  Text(
                    "24 Sep",
                    style: TextStyle(
                      color: AppTheme.medGrey,
                      fontSize: 10.sp,
                      fontFamily: AppFonts.poppins,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(
          height: 0.5.h,
        ),
        Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 7,
              child: Text(
                "Lorem ipsum dolor sit amet, adipiscing elit",
                softWrap: true,
                style: TextStyle(
                  color: AppTheme.medGrey,
                  fontSize: 10.sp,
                  fontFamily: AppFonts.poppins,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:  EdgeInsets.only( right: 2.w),
                    child: SvgPicture.asset(
                      AppAssets.time,
                      height: 10.sp,
                      width: 10.sp,
                    ),
                  ),
                  Text(
                    "60 Mins",
                    style: TextStyle(
                      color: AppTheme.medGrey,
                      fontSize: 10.sp,
                      fontFamily: AppFonts.poppins,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 0.5.h,
        ),
        EazyLifeJobStatusWidget(
          fontSize: 12.sp,
          size: 3,
          status: EazyLifeJobStatus.Applied,
        )
      ],
    );
  }

  Widget _setDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 0.5.h,
        ),
        Text(
          AppString.description,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
            fontFamily: AppFonts.poppinsSemiBold,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 2.sp,
        ),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tincidunt leo a neque accumsan posuere. Nullam a purus congue, ultricies sapien vitae, tempus purus\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Ut cidunt leo a neque accumsan posuere.",
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: AppTheme.medGrey,
            fontSize: 10.sp,
            fontFamily: AppFonts.poppins,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          height: 0.5.h,
        ),
      ],
    );
  }

  Widget _setAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 0.5.h,
        ),
        Text(
          AppString.address,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
            fontFamily: AppFonts.poppinsSemiBold,
          ),
        ),
        SizedBox(
          height: 2.sp,
        ),
        Text(
          "1231, Paradise Lane, Opp. San Diego, CA 92103",
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: AppTheme.medGrey,
            fontSize: 10.sp,
            fontFamily: AppFonts.poppins,
          ),
        ),
        SizedBox(
          height: 0.5.h,
        ),
      ],
    );
  }

  Widget _cancelApplication() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 0.5.h,
        ),
        Text(
          "Cancel the application",
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
            fontFamily: AppFonts.poppinsSemiBold,
          ),
        ),
        SizedBox(
          height: 1.5.h,
        ),
        _keyValueRow("Status", "Payment Requested"),
        _keyValueRow("Amount in Escrow", "₹ 199"),
        _keyValueRow("Original Amount", "₹ 199"),
        _keyValueRow("Amount Requested", "₹ 399"),
        SizedBox(
          height: 2.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return DialogBoxWithIcon(
                      icon: AppAssets.cancel,
                      content: Text(
                        "You Canceled this Application",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppTheme.black,
                            fontFamily: AppFonts.poppins,
                            fontWeight: FontWeight.normal,
                            fontSize: 10.sp),
                      ),
                      onCancelPressed: () {
                        Navigator.of(context)
                          ..pop()
                          ..pop();
                      },
                      onOkPressed: () {
                        Navigator.of(context).pop();
                      },
                      title: "Cancel Application",
                      titleYes: "Done",
                      colorYes: AppTheme.white,
                      sizeNo: 10.sp,
                      titleFamily: AppFonts.poppinsMed,
                    );
                  });
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(8.sp),
              decoration: BoxDecoration(
                color: AppTheme.lightRed,
                borderRadius: BorderRadius.circular(4.sp),
              ),
              child: Center(
                child: Text(
                  "Cancel Application",
                  style: TextStyle(
                      color: AppTheme.red,
                      fontSize: 14.sp,
                      fontFamily: AppFonts.poppinsMed),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _keyValueRow(String key, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              key,
              style: TextStyle(
                  color: AppTheme.black,
                  fontSize: 10.sp,
                  fontFamily: AppFonts.poppins),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value,
              style: TextStyle(
                color: AppTheme.medGrey,
                fontSize: 10.sp,
                fontFamily: AppFonts.poppinsMed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
