import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/_core/constants/hive_constant.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/constants/app_string.g.dart';
import 'package:flutter_projects/_core/constants/utils.dart';
import 'package:flutter_projects/_core/custom_widgets/api_loader.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';
import 'package:flutter_projects/_core/custom_widgets/app_button.dart';
import 'package:flutter_projects/_core/navigation.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/application/report/report_bloc.dart';
import 'package:flutter_projects/model/report/report_listing_model.dart';
import 'package:flutter_projects/presentation/drawer/screens/create_report.dart';
import 'package:flutter_projects/presentation/drawer/screens/report_detail.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;

import '../../dashboard/notification/screen/notification_screen.dart';

class ReportAndComplaint extends StatefulWidget {
  const ReportAndComplaint({super.key});

  @override
  State<ReportAndComplaint> createState() => _ReportAndComplaintState();
}

class _ReportAndComplaintState extends State<ReportAndComplaint> {
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  String dropdownvalue = 'Item 1';

  @override
  void initState() {
    // TODO: implement initState
    context.read<ReportBloc>().add(GetReportListCallApiEvent(
        userId: HiveConstants.instances.box1.get(HiveConstants.userIdKey)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: EazylifeAppBar(
          title: LocaleKeys.reportAndComplaint.tr(),
          leadIcon: AppAssets.backIcon,
          sideIcon: AppAssets.notifications,
          sideOnPressed: () {
            callNextScreen(context, const NotificationScreen());
          },
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: BlocListener<ReportBloc, Report1State>(
          listener: (context, state) {},
          child: BlocBuilder<ReportBloc, Report1State>(
            builder: (context, state) {
              print(state);
              return state.isLoading == true
                  ? const APILoader()
                  : state.getComplaints.isNotEmpty
                      ? renderBodyView(state.getComplaints)
                      : const Center(child: Text("No data Found"));
            },
          ),
        ));
  }

  renderBodyView(List<Getcomplaint> getcomplaints) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 18.sp,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            primary: false,
            itemCount: getcomplaints.length,
            shrinkWrap: true,
            itemBuilder: (context, i) {
              return Padding(
                padding: EdgeInsets.only(bottom: 8.sp),
                child: InkWell(
                  onTap: () {
                    callNextScreen(
                        context,
                        ReportAndComplaintDetailsScreen(
                          getcomplaint: getcomplaints[i],
                        ));
                  },
                  child: ReportAndComplaintWidget(
                      title: getcomplaints[i].jobTitle,
                      subTitle: getcomplaints[i].complaintsDesc,
                      date: getcomplaints[i].createdAt.formatDate(),
                      time: getcomplaints[i].createdAt.toFormattedTime(),
                      isSolved: i != 0 && i != 1),
                ),
              );
            },
          ),
          SizedBox(
            height: 2.h,
          ),
          AppButton(
            title: LocaleKeys.createComplaint.tr(),
            onPressed: () {
              callNextScreen(context, const CreateReportAndComplaintScreen());
            },
          ),
          SizedBox(
            height: 2.h,
          ),
        ],
      ),
    );
  }
}

class ReportAndComplaintWidget extends StatefulWidget {
  final String title;
  final String subTitle;
  final String date;
  final String time;
  final bool isSolved;
  const ReportAndComplaintWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.date,
    required this.time,
    required this.isSolved,
  });

  @override
  State<ReportAndComplaintWidget> createState() =>
      _ReportAndComplaintWidgetState();
}

class _ReportAndComplaintWidgetState extends State<ReportAndComplaintWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Stack(
        children: [
          Container(
              padding: EdgeInsets.only(
                  left: 10.sp, right: widget.isSolved ? 46.sp : 10.sp),
              decoration: BoxDecoration(
                color: AppTheme.lightGrey,
                borderRadius: BorderRadius.circular(8),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: widget.isSolved ? AppTheme.blue : AppTheme.lightGrey,
                  // strokeAlign: BorderSide.strokeAlignInside,
                  style: BorderStyle.solid,
                  width: widget.isSolved ? 2 : 0,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8.sp,
                  ),
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: AppTheme.black,
                      fontSize: 12.sp,
                      fontFamily: AppFonts.poppinsSemiBold,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 2.sp,
                  ),
                  Text(
                    widget.subTitle,
                    maxLines: 3,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: AppTheme.black,
                      fontSize: 8.sp,
                      fontFamily: AppFonts.poppins,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const Divider(
                    color: AppTheme.dividerBlack,
                  ),
                  SizedBox(
                    height: 2.sp,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 2, right: 6),
                        child: SvgPicture.asset(
                          AppAssets.calSvg,
                          height: 10.sp,
                          width: 10.sp,
                        ),
                      ),
                      SizedBox(
                        width: 2.sp,
                      ),
                      Text(
                        widget.date,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 9.sp,
                          fontFamily: AppFonts.poppins,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        width: 12.sp,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2, right: 6),
                        child: SvgPicture.asset(
                          AppAssets.time,
                          height: 10.sp,
                          width: 10.sp,
                        ),
                      ),
                      SizedBox(
                        width: 2.sp,
                      ),
                      Text(
                        widget.time,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 9.sp,
                          fontFamily: AppFonts.poppins,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.sp,
                  )
                ],
              )),
          if (widget.isSolved)
            Positioned(
              bottom: 10.sp,
              right: -20.sp,
              child: Transform.rotate(
                angle: -math.pi / 4,
                child: Container(
                  //height: 160,
                  width: 80.sp,
                  // margin: const EdgeInsets.only(left: 20, right: 20),
                  color: AppTheme.blue,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "SOLVED",
                        maxLines: 3,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: AppTheme.white,
                          fontSize: 8.sp,
                          fontFamily: AppFonts.poppins,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
