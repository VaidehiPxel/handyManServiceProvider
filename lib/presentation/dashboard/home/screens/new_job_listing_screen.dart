import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/Navigation.dart';
import 'package:flutter_projects/_core/constants/app_constants.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';
import 'package:flutter_projects/_core/custom_widgets/job_listView.dart';
import 'package:flutter_projects/model/home/dashboard_model.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:flutter_projects/presentation/dashboard/notification/screen/notification_screen.dart';
import 'package:sizer/sizer.dart';

class NewJobList extends StatefulWidget {
  final List<Jobrequest> jobModel;
  const NewJobList({Key? key, required this.jobModel}) : super(key: key);

  @override
  State<NewJobList> createState() => _NewJobListState();
}

class _NewJobListState extends State<NewJobList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: EazylifeAppBar(
        title: AppString.myJobs,
        leadIcon: AppAssets.backIcon,
        onPressed: () {
          Navigator.pop(context);
        },
        sideIcon: AppAssets.notificationSvg,
        sideOnPressed: () {
          callNextScreen(context, const NotificationScreen());
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.sp),
          child: Column(
            children: [
              SizedBox(
                height: kToolbarHeight + 7.h,
              ),
              ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 1.h,
                  );
                },
                itemCount: widget.jobModel.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return JobListView(
                    jobListingModel: widget.jobModel[index],
                    jobType: JobType.newJob,
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
