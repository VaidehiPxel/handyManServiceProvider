import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/Navigation.dart';
import 'package:flutter_projects/_core/constants/app_constants.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/custom_widgets/rating_widget.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/model/jobs/job_listing_model.dart';
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
  int currentIndex = 0;
  List<JobListingModel> jobModel = [
    JobListingModel(
        jobImage: "https://picsum.photos/id/214/200/300",
        jobTitle: "Sink Cleaning",
        jobAddress: "543 Main ST, Apt. 12 Chicago",
        jobDesc: "Lorem ipsum dolor sit amet,.....",
        jobFee: "99",
        jobTime: "60 mins"),
    JobListingModel(
        jobImage: "https://picsum.photos/id/220/200/300",
        jobTitle: "Sink Cleaning",
        jobAddress: "543 Main ST, Apt. 12 Chicago",
        jobDesc: "Lorem ipsum dolor sit amet,.....",
        jobFee: "99",
        jobTime: "60 mins"),
    JobListingModel(
        jobImage: "https://picsum.photos/id/218/200/300",
        jobTitle: "Sink Cleaning",
        jobAddress: "543 Main ST, Apt. 12 Chicago",
        jobDesc: "Lorem ipsum dolor sit amet,.....",
        jobFee: "99",
        jobTime: "60 mins")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: renderBodyView(), //HomeScreenWidget(),
    );
  }

  Widget renderBodyView() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: kToolbarHeight * 2.3,
            ),
            //_searchTextField(),
            SizedBox(
              height: 1.5.h,
            ),
            setUserDetail(),
            SizedBox(
              height: 3.3.h,
            ),
            dashboardValue(),
            SizedBox(
              height: 2.h,
            ),
            jobRequest(),
            newJob(),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }

  Container _searchTextField() {
    return Container(
      height: 6.5.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.sp),
          shape: BoxShape.rectangle,
          boxShadow: const [
            BoxShadow(
              color: AppTheme.dropShadow,
              blurRadius: 5.0,
            ),
          ]),
      child: Center(
        child: Column(
          children: [
            TextFormField(
              maxLines: 1,
              enableIMEPersonalizedLearning: true,
              enableSuggestions: true,
              decoration: InputDecoration(
                suffixIcon: Image.asset(AppAssets.search),
                border: InputBorder.none,
                hintText: AppString.searchText,
                contentPadding: const EdgeInsets.all(14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dashboardValue() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _blueContainer(AppString.totalReviews, 538)),
            SizedBox(
              width: 3.w,
            ),
            Expanded(child: _blueContainer(AppString.todayJob, 56)),
          ],
        ),
        SizedBox(
          height: 1.5.h,
        ),
        Row(
          children: [
            Expanded(child: _blueContainer(AppString.completedJob, 67)),
            SizedBox(
              width: 3.w,
            ),
            Expanded(child: _blueContainer(AppString.totalEarning, 399)),
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

  setUserDetail() {
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
                child: Image.network('https://picsum.photos/id/218/200/300',
                    fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            "Saroj Chacko",
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
          Text(
            "4.0 out of 5 stars",
            style: TextStyle(
                fontFamily: AppFonts.poppinsMed,
                fontSize: 12.sp,
                color: AppTheme.blue),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          ratingBar("5 stars", 0.2, "20%"),
          ratingBar("4 stars", 0.4, "40%"),
          ratingBar("3 stars", 0.15, "15%"),
          ratingBar("2 stars", 0, "0%"),
          ratingBar("1 star", 0, "0%"),
        ],
      ),
    );
  }

  Widget ratingBar(String text, double percent, String percentText) {
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
            percent: percent,
            center: Text(
              percentText,
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

  Widget jobRequest() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 1.h,),
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
          itemCount: 1,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return JobListView(
              jobListingModel: jobModel[index],
              jobType: JobType.jobRequest,
            );
          },
        ),
      ],
    );
  }

  Widget newJob() {
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
            InkWell(
              onTap: (){
                callNextScreen(context, NewJobList());
              },
              child: Text(
                AppString.viewAll,
                style: TextStyle(
                  color: AppTheme.blue,
                  fontSize: 10.sp,
                  fontFamily: AppFonts.poppinsMed,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        ListView.builder(
          itemCount: jobModel.length>3?3: jobModel.length,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return JobListView(
              jobListingModel: jobModel[index],
              jobType: JobType.newJob,
            );
          },
        ),
      ],
    );
  }
}
