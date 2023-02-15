import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/_core/Navigation.dart';
import 'package:flutter_projects/_core/constants/app_constants.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/custom_widgets/rating_widget.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/application/dashboard/dashboard_bloc.dart';
import 'package:flutter_projects/model/home/dashboard_model.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:flutter_projects/_core/custom_widgets/job_listView.dart';
import 'package:flutter_projects/presentation/dashboard/home/screens/new_job_listing_screen.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DashboardBloc>().add(const DashboardCallApiEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DashboardBloc, DashboardState>(
      listener: (context, state) {},
      child: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return state.isLoading == true
              ? const Center(
                  child: CircularProgressIndicator(
                  backgroundColor: AppTheme.lightBlue,
                ))
              : (state.isLoading == false && (state is DashboardSuccess))
                  ? renderBodyView(state)
                  : const Center(
                      child: CircularProgressIndicator(
                      backgroundColor: AppTheme.lightBlue,
                    ));
        },
      ),
    );
  }

  Widget renderBodyView(DashboardSuccess state) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: kToolbarHeight * 2.3,
            ),
            SizedBox(
              height: 1.5.h,
            ),
            setUserDetail(state.dashboardModel.usersdetails),
            Center(
              child: Text(
                "${state.dashboardModel.totalreview} out of 5 stars",
                style: TextStyle(
                    fontFamily: AppFonts.poppinsMed,
                    fontSize: 12.sp,
                    color: AppTheme.blue),
              ),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            ratingBar(
                "5 stars", serPercentage(state.dashboardModel.total5Star)),
            ratingBar(
                "4 stars", serPercentage(state.dashboardModel.total4Star)),
            ratingBar(
                "3 stars", serPercentage(state.dashboardModel.total3Star)),
            ratingBar(
                "2 stars", serPercentage(state.dashboardModel.total2Star)),
            ratingBar("1 star", serPercentage(state.dashboardModel.total1Star)),
            SizedBox(
              height: 3.3.h,
            ),
            dashboardValue(state.dashboardModel),
            SizedBox(
              height: 2.h,
            ),
            state.dashboardModel.jobrequest.isEmpty
                ? Container()
                : jobRequest(state.dashboardModel.jobrequest),
            state.dashboardModel.newjobs.isEmpty
                ? Container()
                : newJob(state.dashboardModel.newjobs),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }

  // Container _searchTextField() {
  //   return Container(
  //     height: 6.5.h,
  //     decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(10.sp),
  //         shape: BoxShape.rectangle,
  //         boxShadow: const [
  //           BoxShadow(
  //             color: AppTheme.dropShadow,
  //             blurRadius: 5.0,
  //           ),
  //         ]),
  //     child: Center(
  //       child: Column(
  //         children: [
  //           TextFormField(
  //             maxLines: 1,
  //             enableIMEPersonalizedLearning: true,
  //             enableSuggestions: true,
  //             decoration: InputDecoration(
  //               suffixIcon: Image.asset(AppAssets.search),
  //               border: InputBorder.none,
  //               hintText: AppString.searchText,
  //               contentPadding: const EdgeInsets.all(14),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget dashboardValue(DashboardModel dashboardModel) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: _blueContainer(
                    AppString.totalReviews, dashboardModel.totalreview)),
            SizedBox(
              width: 3.w,
            ),
            Expanded(
                child: _blueContainer(
                    AppString.todayJob, dashboardModel.todayjob)),
          ],
        ),
        SizedBox(
          height: 1.5.h,
        ),
        Row(
          children: [
            Expanded(
                child: _blueContainer(
                    AppString.completedJob, dashboardModel.completedjob)),
            SizedBox(
              width: 3.w,
            ),
            Expanded(
                child: _blueContainer(
                    AppString.totalEarning, dashboardModel.totalearning)),
          ],
        ),
      ],
    );
  }

  Container _blueContainer(String title, int count) {
    return Container(
      height: 12.h,
      decoration: BoxDecoration(
        color: AppTheme.containerBlue,
        borderRadius: BorderRadius.circular(7.sp),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 12.sp,
                fontFamily: AppFonts.poppinsMed,
                color: AppTheme.blue),
          ),
          Text(
            count.toString(),
            style: TextStyle(
                fontSize: 26.sp,
                fontFamily: AppFonts.poppinsSemiBold,
                color: AppTheme.blue),
          ),
        ],
      ),
    );
  }

  setUserDetail(List<Usersdetail> usersdetails) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(4.5.sp), // Border width
            decoration: const BoxDecoration(
                color: AppTheme.greyBorder, shape: BoxShape.circle),
            child: ClipOval(
              child: SizedBox.fromSize(
                size: Size.fromRadius(40.sp), // Image radius
                child: usersdetails[0].profilepics == null
                    ? Image.asset(AppAssets.profileThumb)
                    : Image.network(usersdetails[0].profilepics,
                        fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            "${usersdetails[0].name} ${usersdetails[0].lastname}",
            style: TextStyle(
                fontFamily: AppFonts.poppinsBold,
                fontSize: 18.sp,
                color: AppTheme.black),
          ),
          SizedBox(
            height: 1.h,
          ),
          RatingsWidget(
            value: 4,
            filledStar: Icon(
              Icons.star_rate_rounded,
              color: AppTheme.ratingsStarColor,
              size: 20.sp,
            ),
            halffilledStar: Icon(
              Icons.star_half_rounded,
              color: AppTheme.ratingsStarColor,
              size: 20.sp,
            ),
            unfilledStar: Icon(
              Icons.star_rate_rounded,
              color: AppTheme.greyStar,
              size: 20.sp,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
        ],
      ),
    );
  }

  Widget ratingBar(String text, double percent) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            text,
            style: TextStyle(
                fontFamily: AppFonts.poppinsMed,
                fontSize: 12.sp,
                color: AppTheme.black),
          ),
        ),
        Expanded(
          flex: 5,
          child: LinearPercentIndicator(
            animation: true,
            animationDuration: 1000,
            lineHeight: 2.h,
            percent: (percent / 100),
            center: Text(
              "${percent.toStringAsFixed(0)}%",
              style: TextStyle(
                  fontFamily: AppFonts.poppinsMed,
                  fontSize: 9.sp,
                  color: AppTheme.black),
            ),
            progressColor: AppTheme.blue,
            backgroundColor: AppTheme.white,
          ),
        ),
      ],
    );
  }

  Widget jobRequest(List<Jobrequest> jobrequest) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 1.h,
        ),
        Text(
          AppString.jobRequest,
          style: TextStyle(
              fontFamily: AppFonts.poppinsBold,
              fontSize: 14.sp,
              color: AppTheme.black),
        ),
        SizedBox(
          height: 1.h,
        ),
        ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 1.h,
            );
          },
          itemCount: jobrequest.length,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return JobListView(
              jobListingModel: jobrequest[index],
              jobType: JobType.jobRequest,
            );
          },
        ),
      ],
    );
  }

  Widget newJob(List<Jobrequest> newjobs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 2.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppString.newJob,
                style: TextStyle(
                    fontFamily: AppFonts.poppinsBold,
                    fontSize: 14.sp,
                    color: AppTheme.black)),
            newjobs.length > 3
                ? InkWell(
                    onTap: () {
                      callNextScreen(
                          context,
                          NewJobList(
                            jobModel: newjobs,
                          ));
                    },
                    child: Text(
                      AppString.viewAll,
                      style: TextStyle(
                        color: AppTheme.blue,
                        fontSize: 10.sp,
                        fontFamily: AppFonts.poppinsMed,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        ListView.builder(
          itemCount: newjobs.length > 3 ? 3 : newjobs.length,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return JobListView(
              jobListingModel: newjobs[index],
              jobType: JobType.newJob,
            );
          },
        ),
      ],
    );
  }

  double serPercentage(int value) {
    var percent = value * 20;
    return percent.toDouble();
  }
}
