import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';

import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';
import 'package:flutter_projects/_core/custom_widgets/app_button.dart';

import 'package:flutter_projects/_core/custom_widgets/grey_textField.dart';
import 'package:flutter_projects/_core/custom_widgets/job_status_widget.dart';
import 'package:flutter_projects/_core/navigation.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/presentation/drawer/screens/report_complain.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';


class AcceptedJobDetail extends StatefulWidget {
  const AcceptedJobDetail({Key? key}) : super(key: key);

  @override
  State<AcceptedJobDetail> createState() => _AcceptedJobDetailState();
}

class _AcceptedJobDetailState extends State<AcceptedJobDetail> {
  int anyExtraTask = -1;
  static const countdownDuration = Duration(minutes: 56);
  Duration duration = const Duration();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      reset();
      timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
    });
  }

  void reset() {
    setState(() => duration = countdownDuration);
  }

  void addTime() {
    const addSeconds = -1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (timer != null) {
      timer!.cancel();
    }
  }

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
          padding: EdgeInsets.all(18.sp),
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
              _setTimerData(),
              SizedBox(
                height: 2.5.h,
              ),
              _setStartStopCTA(),
              _changeJobStatus(),
              _anyExtraWork(),
              _extraServiceCharge(),
              _setPaymentDetail(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _extraServiceCharge() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 8.sp,
        ),
        Text(
          AppString.extraServicesCharges,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
            fontFamily: AppFonts.poppinsSemiBold,
          ),
        ),
        SizedBox(height: 1.h,),
        GreyTextField(
          hintText: "Bathroom Cleaning",
          fontFamily: AppFonts.poppins,
          height: 6.h,
        ),
        SizedBox(height: 1.h,),
        Row(
          children: [
            Expanded(
              child: GreyTextField(
                hintText: "30 mins",
                fontFamily: AppFonts.poppins,
                height: 6.h,
              ),
            ),
            SizedBox(width: 2.w,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.lightGrey,
                  borderRadius: BorderRadius.all(Radius.circular(5.sp)),
                ),
                child: Center(
                  child: TextFormField(
                    maxLines: 1,
                    enableIMEPersonalizedLearning: true,
                    enableSuggestions: true,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          AppAssets.rupee,
                          fit: BoxFit.fitHeight,
                          height: 4.sp,
                          width: 4.sp,
                          allowDrawingOutsideViewBox: false,
                          cacheColorFilter: true,
                        ),
                      ),
                      border: InputBorder.none,
                      hintText: "199",
                      contentPadding: EdgeInsets.all(10.sp),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 2.h,),
      AppButton(title: "Update Amount",onPressed: (){},),
        SizedBox(height: 2.h,),
      ],
    );
  }

  Widget _anyExtraWork() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 8.sp,
        ),
        Text(
          AppString.anyExtraTask,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
            fontFamily: AppFonts.poppinsSemiBold,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Checkbox(
                  tristate: true,
                  fillColor: const MaterialStatePropertyAll(Colors.white),
                  checkColor: AppTheme.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  visualDensity: VisualDensity.compact,
                  value: anyExtraTask == 0,
                  side: MaterialStateBorderSide.resolveWith(
                    (states) => const BorderSide(
                      width: 1.0,
                      color: AppTheme.blue,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      if (anyExtraTask != 0) {
                        anyExtraTask = 0;
                      } else {
                        anyExtraTask = -1;
                      }
                    });
                  },
                ),
                Text(
                  "Yes",
                  style: TextStyle(
                    color: AppTheme.blue,
                    fontSize: 12.sp,
                    fontFamily: AppFonts.poppinsSemiBold,
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            ),
            SizedBox(
              width: 4.w,
            ),
            Expanded(
              child: Row(
                children: [
                  Checkbox(
                    tristate: true,
                    fillColor: const MaterialStatePropertyAll(Colors.white),
                    checkColor: AppTheme.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    visualDensity: VisualDensity.compact,
                    value: anyExtraTask == 1,
                    side: MaterialStateBorderSide.resolveWith(
                      (states) => const BorderSide(
                        width: 1.0,
                        color: AppTheme.blue,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        if (anyExtraTask != 1) {
                          anyExtraTask = 1;
                        } else {
                          anyExtraTask = -1;
                        }
                      });
                    },
                  ),
                  Text(
                    "No",
                    style: TextStyle(
                      color: AppTheme.blue,
                      fontSize: 12.sp,
                      fontFamily: AppFonts.poppinsSemiBold,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _setTimerData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 8.sp,
        ),
        Text(
          AppString.timeCounter,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
            fontFamily: AppFonts.poppinsSemiBold,
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _timerBox(duration.inHours.toString().padLeft(2, '0'),
                  AppString.hrs),
            ),
            colan(),
            Expanded(
              child: _timerBox(
                  duration.inMinutes.remainder(60).toString().padLeft(2, '0'),
                  AppString.min),
            ),
            colan(),
            Expanded(
              child: _timerBox(
                  duration.inSeconds.remainder(60).toString().padLeft(2, '0'),
                  AppString.sec),
            ),
          ],
        ),
      ],
    );
  }

  Widget _changeJobStatus() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 8.sp,
        ),
        Text(
          AppString.changeJobStatus,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
            fontFamily: AppFonts.poppinsSemiBold,
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
      ],
    );
  }

  Widget _timerBox(String title, String key) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: AppTheme.lightGrey,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
            child: Text(
              title,
              style: TextStyle(
                color: AppTheme.blue,
                fontSize: 22.sp,
                fontFamily: AppFonts.poppinsSemiBold,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(
          key,
          style: TextStyle(
            color: AppTheme.medGrey,
            fontSize: 16.sp,
            fontFamily: AppFonts.poppins,
          ),
        ),
      ],
    );
  }

  Widget colan() {
    return Padding(
      padding: EdgeInsets.only(top: 0.8.h),
      child: Text(
        ":",
        style: TextStyle(
          color: AppTheme.medGrey,
          fontSize: 28.sp,
          fontFamily: AppFonts.poppinsSemiBold,
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

  Widget _setStartStopCTA() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.lightGrey,
                  minimumSize: const Size.fromHeight(40),
                  elevation: 0,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
                  child: Text(
                    AppString.stop,
                    style: TextStyle(
                        color: AppTheme.medGrey,
                        fontSize: 14.sp,
                        fontFamily: AppFonts.poppinsMed),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 4.w,
            ),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.blue,
                  minimumSize: const Size.fromHeight(40),
                  elevation: 0,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
                  child: Text(
                    AppString.start,
                    style: TextStyle(
                        color: AppTheme.white,
                        fontSize: 14.sp,
                        fontFamily: AppFonts.poppinsMed),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
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
                    padding: EdgeInsets.only(right: 2.w),
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
                    padding: EdgeInsets.only(right: 2.w),
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
          status: EazyLifeJobStatus.Accepted,
        )
      ],
    );
  }

  Widget _setDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 0.3.h,
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
          height: 8.sp,
        ),
      ],
    );
  }

  Widget _setAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 8.sp,
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
          height: 8.sp,
        ),
      ],
    );
  }

  Widget _setPaymentDetail() {
    return Column(
      children: [
        SizedBox(height: 1.h,),
        _keyValueRow("Past Amount", "799"),
        _keyValueRow("Extra Services", "199"),
        _keyValueBigSize("Total Amount", "998"),
        SizedBox(height: 1.5.h,),

        AppButton(title: "Complete Job",onPressed: (){},),
        SizedBox(
          height: 0.6.h,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              callNextScreen(context, const ReportComplaintScreen());
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Text(
                AppString.complaintQ,
                style: TextStyle(
                  color: AppTheme.red,
                  fontSize: 10.sp,
                  fontFamily: AppFonts.poppinsMed,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
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
                  fontFamily: AppFonts.poppinsMed),
            ),
          ),
          Expanded(
            flex: 2,
            child: RichText(
              overflow: TextOverflow.clip,
              textAlign: TextAlign.right,
              textDirection: TextDirection.ltr,
              softWrap: true,
              maxLines: 2,
              textScaleFactor: 1,
              text: TextSpan(
                text: "₹",
                style: TextStyle(
                    color: AppTheme.blue,
                    fontFamily: AppFonts.poppinsMed,
                    fontSize: 10.sp),
                children: <TextSpan>[
                  TextSpan(
                      text: value,
                      style: TextStyle(
                          color: AppTheme.black,
                          fontFamily: AppFonts.poppinsMed,
                          fontSize: 10.sp)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _keyValueBigSize(String key, String value) {
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
                  fontSize: 12.sp,
                  fontFamily: AppFonts.poppinsMed),
            ),
          ),
          Expanded(
            flex: 2,
            child: RichText(
              overflow: TextOverflow.clip,
              textAlign: TextAlign.right,
              textDirection: TextDirection.ltr,
              softWrap: true,
              maxLines: 2,
              textScaleFactor: 1,
              text: TextSpan(
                text: "₹",
                style: TextStyle(
                    color: AppTheme.blue,
                    fontFamily: AppFonts.poppinsMed,
                    fontSize: 12.sp),
                children: <TextSpan>[
                  TextSpan(
                      text: value,
                      style: TextStyle(
                          color: AppTheme.black,
                          fontFamily: AppFonts.poppinsMed,
                          fontSize: 12.sp)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
