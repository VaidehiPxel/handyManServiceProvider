import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/model/home/job_listing_model.dart';
import 'package:flutter_projects/presentation/auth/constants/image_constant.dart';
import 'package:flutter_projects/presentation/drawer/drawer_widget.dart';
import 'package:flutter_projects/presentation/home/constants/image_constant.dart';
import 'package:flutter_projects/presentation/home/constants/string_constant.dart';
import 'package:flutter_projects/presentation/dashboard/screens/bottom_appbar.dart';
import 'package:flutter_projects/presentation/home/widget/blue_box_text.dart';
import 'package:flutter_projects/_core/custom_widgets/job_listView.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<JobListingModel> jobModel=[JobListingModel(
      jobImage: "https://picsum.photos/id/237/200/300",
      jobTitle: "Sink Cleaning",
      jobAddress: "543 Main ST, Apt. 12 Chicago",
      jobDesc: "Lorem ipsum dolor sit amet,.....",
      jobFee: "99",
      jobTime: "60 mins"),JobListingModel(
      jobImage: "https://picsum.photos/id/237/200/300",
      jobTitle: "Sink Cleaning",
      jobAddress: "543 Main ST, Apt. 12 Chicago",
      jobDesc: "Lorem ipsum dolor sit amet,.....",
      jobFee: "99",
      jobTime: "60 mins"),JobListingModel(
      jobImage: "https://picsum.photos/id/237/200/300",
      jobTitle: "Sink Cleaning",
      jobAddress: "543 Main ST, Apt. 12 Chicago",
      jobDesc: "Lorem ipsum dolor sit amet,.....",
      jobFee: "99",
      jobTime: "60 mins")];
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
      physics: const AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: kToolbarHeight * 2.3,
            ),
            _searchTextField(),
            SizedBox(
              height: 2.5.h,
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
                      suffixIcon: Image.asset(HomeAsset.search),
                      border: InputBorder.none,
                      hintText: HomeString.searchText,
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
            Expanded(child: _blueContainer(HomeString.totalReviews, 538)),
            SizedBox(
              width: 3.w,
            ),
            Expanded(child: _blueContainer(HomeString.todayJob, 56)),
          ],
        ),
        SizedBox(
          height: 1.5.h,
        ),
        Row(
          children: [
            Expanded(child: _blueContainer(HomeString.completedJob, 67)),
            SizedBox(
              width: 3.w,
            ),
            Expanded(child: _blueContainer(HomeString.totalEarning, 399)),
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
                color: AppTheme.buttonBlue),
          ),
          Text(
            count.toString(),
            style: TextStyle(
                fontSize: 26.sp,
                fontFamily: AppFonts.poppinsSemiBold,
                color: AppTheme.buttonBlue),
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
                child: Image.network('https://picsum.photos/id/237/200/300',
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
          Text(
            "4.0 out of 5 stars",
            style: TextStyle(
                fontFamily: AppFonts.poppinsMed,
                fontSize: 12.sp,
                color: AppTheme.buttonBlue),
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
            progressColor: AppTheme.buttonBlue,
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
        Text(
          HomeString.jobRequest,
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
          itemCount: jobModel.length,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return JobListView(
              jobListingModel: jobModel[index],
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
        Text(HomeString.newJob,
            style: TextStyle(
                fontFamily: AppFonts.poppinsBold,
                fontSize: 14.sp,
                color: AppTheme.black)),
        SizedBox(
          height: 1.h,
        ),
        ListView.builder(
          itemCount: 1,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return JobListView(
              jobListingModel: JobListingModel(
                  jobImage: "https://picsum.photos/id/237/200/300",
                  jobTitle: "Sink Cleaning",
                  jobAddress: "543 Main ST, Apt. 12 Chicago",
                  jobDesc: "Lorem ipsum dolor sit amet,.....",
                  jobFee: "99",
                  jobTime: "60 mins"),
            );
          },
        ),
      ],
    );
  }
}
