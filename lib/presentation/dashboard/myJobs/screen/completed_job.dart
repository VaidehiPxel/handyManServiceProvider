import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/constants/app_string.g.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';
import 'package:flutter_projects/_core/custom_widgets/job_status_widget.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/model/jobs/my_joblist_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class CompletedJobDetail extends StatefulWidget {
  final List<Joblist> jobData;
  final String title;
  const CompletedJobDetail(
      {Key? key, required this.jobData, required this.title})
      : super(key: key);

  @override
  State<CompletedJobDetail> createState() => _CompletedJobDetailState();
}

class _CompletedJobDetailState extends State<CompletedJobDetail> {
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
              SizedBox(
                height: 12.sp,
              ),
              setTitle(),
              SizedBox(
                height: 8.sp,
              ),
              _putDivider(),
              _setDescription(),
              _putDivider(),
              _setAddress(),
              _putDivider(),
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
          status: EazyLifeJobStatus.completed,
        )
      ],
    );
  }

  Widget _setDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 8.sp,
        ),
        Text(
          LocaleKeys.description.tr(),
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
          LocaleKeys.address.tr(),
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
}
