import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/constants/utils.dart';
import 'package:flutter_projects/_core/custom_dialogs/dialog_icon.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';
import 'package:flutter_projects/_core/custom_widgets/job_status_widget.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:flutter_projects/model/jobs/my_joblist_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class AppliedJobDetail extends StatefulWidget {
  final List<Joblist> jobData;
  final int index;
  final String title;
  const AppliedJobDetail(
      {Key? key,
      required this.jobData,
      required this.index,
      required this.title})
      : super(key: key);

  @override
  State<AppliedJobDetail> createState() => _AppliedJobDetailState();
}

class _AppliedJobDetailState extends State<AppliedJobDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EazylifeAppBar(
        title: widget.title,
        leadIcon: AppAssets.backIcon,
        onPressed: () {
          Navigator.pop(context);
        },
        sideIcon: null,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(18.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              setTitle(widget.jobData),
              SizedBox(
                height: 0.5.h,
              ),
              _putDivider(),
              _setDescription(widget.jobData),
              _putDivider(),
              _setAddress(widget.jobData),
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

  Widget setTitle(List<Joblist> jobData) {
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
                jobData[widget.index].title,
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
                    padding: EdgeInsets.only(right: 2.w),
                    child: SvgPicture.asset(
                      AppAssets.calSvg,
                      height: 10.sp,
                      width: 10.sp,
                    ),
                  ),
                  Text(
                    jobData[widget.index].jobdate.formatDate(),
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
                "Dummy text",
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
                    padding: EdgeInsets.only(right: 2.w),
                    child: SvgPicture.asset(
                      AppAssets.time,
                      height: 10.sp,
                      width: 10.sp,
                    ),
                  ),
                  Text(
                    jobData[widget.index].jobtime,
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
          status: EazyLifeJobStatus.applied,
        )
      ],
    );
  }

  Widget _setDescription(List<Joblist> jobData) {
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
          jobData[widget.index].description,
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

  Widget _setAddress(List<Joblist> jobData) {
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
