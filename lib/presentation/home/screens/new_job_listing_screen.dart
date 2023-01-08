import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/Navigation.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';
import 'package:flutter_projects/_core/custom_widgets/job_listView.dart';
import 'package:flutter_projects/model/jobs/job_listing_model.dart';
import 'package:flutter_projects/presentation/home/constants/string_constant.dart';
import 'package:flutter_projects/presentation/notification/screen/notification_screen.dart';
import 'package:sizer/sizer.dart';

class NewJobList extends StatefulWidget {
  const NewJobList({Key? key}) : super(key: key);

  @override
  State<NewJobList> createState() => _NewJobListState();
}

class _NewJobListState extends State<NewJobList> {

  List<JobListingModel> jobModel = [
    JobListingModel(
        jobImage: "https://picsum.photos/id/237/200/300",
        jobTitle: "Sink Cleaning",
        jobAddress: "543 Main ST, Apt. 12 Chicago",
        jobDesc: "Lorem ipsum dolor sit amet,.....",
        jobFee: "99",
        jobTime: "60 mins"),
    JobListingModel(
        jobImage: "https://picsum.photos/id/238/200/300",
        jobTitle: "Bathroom Cleaning",
        jobAddress: "543 Main ST, Apt. 12 Chicago",
        jobDesc: "Lorem ipsum dolor sit amet,.....",
        jobFee: "450",
        jobTime: "60 mins"),
    JobListingModel(
        jobImage: "https://picsum.photos/id/239/200/300",
        jobTitle: "Fan Repairing",
        jobAddress: "543 Main ST, Apt. 12 Chicago",
        jobDesc: "Lorem ipsum dolor sit amet,.....",
        jobFee: "99",
        jobTime: "40 mins"),
    JobListingModel(
        jobImage: "https://picsum.photos/id/240/200/300",
        jobTitle: "Plumbing",
        jobAddress: "543 Main ST, Apt. 12 Chicago",
        jobDesc: "Lorem ipsum dolor sit amet,.....",
        jobFee: "699",
        jobTime: "60 mins"),
    JobListingModel(
        jobImage: "https://picsum.photos/id/244/200/300",
        jobTitle: "Sink Cleaning",
        jobAddress: "543 Main ST, Apt. 12 Chicago",
        jobDesc: "Lorem ipsum dolor sit amet,.....",
        jobFee: "99",
        jobTime: "20 mins"),
    JobListingModel(
        jobImage: "https://picsum.photos/id/243/200/300",
        jobTitle: "Sink Cleaning",
        jobAddress: "543 Main ST, Apt. 12 Chicago",
        jobDesc: "Lorem ipsum dolor sit amet,.....",
        jobFee: "799",
        jobTime: "10 mins"),
    JobListingModel(
        jobImage: "https://picsum.photos/id/213/200/300",
        jobTitle: "Cleaning",
        jobAddress: "543 Main ST, Apt. 12 Chicago",
        jobDesc: "Lorem ipsum dolor sit amet,.....",
        jobFee: "220",
        jobTime: "5 mins"),
    JobListingModel(
        jobImage: "https://picsum.photos/id/230/200/300",
        jobTitle: "Sink Cleaning",
        jobAddress: "543 Main ST, Apt. 12 Chicago",
        jobDesc: "Lorem ipsum dolor sit amet,.....",
        jobFee: "499",
        jobTime: "45 mins")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: EazylifeAppBar(
        title:  HomeString.myJobs,
        leadIcon: ImageString.backIcon,
        onPressed: (){
          Navigator.pop(context);
        },
        sideIcon:  ImageString.notificationSvg,
        sideOnPressed: () {
          callNextScreen(context, const NotificationScreen());
        },
      ),
      body: SingleChildScrollView(
        child:   Padding(
          padding:  EdgeInsets.all(12.sp),
          child: Column(
            children: [
               SizedBox(
                height: kToolbarHeight +7.h,
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
          ),
        ),
      ),
    );
  }
}
