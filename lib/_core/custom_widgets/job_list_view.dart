import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/Navigation.dart';
import 'package:flutter_projects/_core/constants/app_constants.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/model/home/dashboard_model.dart';
import 'package:flutter_projects/presentation/dashboard/home/screens/job_detail_view.dart';
import 'package:flutter_projects/presentation/dashboard/home/screens/job_request_view.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class JobListView extends StatelessWidget {
  final Jobrequest jobListingModel;
  final JobType jobType;

  const JobListView(
      {Key? key, required this.jobListingModel, required this.jobType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        jobType == JobType.jobRequest
            ? callNextScreen(
                context,
                JobRequestView(
                  appBarTitle: jobListingModel.title,
                ))
            : callNextScreen(
                context,
                JobDetailView(
                  appBarTitle: jobListingModel.title,
                  jobId: jobListingModel.id,
                ));
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 2.h),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppTheme.lightGrey,
            borderRadius: BorderRadius.circular(7.sp),
          ),
          child: Padding(
            padding: EdgeInsets.all(5.sp),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipOval(
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(20.sp), // Image radius
                    child: jobListingModel.image1 == null
                        ? Image.asset(AppAssets.profileThumb)
                        : Image.network(jobListingModel.image1!,
                            fit: BoxFit.cover),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 3.2.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          jobListingModel.title,
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: AppFonts.poppinsSemiBold,
                            color: AppTheme.black,
                          ),
                        ),
                        SizedBox(
                          height: 0.3.h,
                        ),
                        Text(jobListingModel.description,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontFamily: AppFonts.poppins,
                              color: AppTheme.medGrey,
                            )),
                        SizedBox(
                          height: 0.3.h,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(AppAssets.location),
                            SizedBox(
                              width: 2.w,
                            ),
                            Expanded(
                              child: Text(
                                  jobListingModel.address1 +
                                      jobListingModel.address2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontFamily: AppFonts.poppinsMed,
                                    color: AppTheme.blue,
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //  Row(
                    //           children: [
                    //             SvgPicture.asset(AppAssets.time),
                    //             SizedBox(
                    //               width: 1.w,
                    //             ),
                    //             Text(jobListingModel.jobtime,
                    //                 softWrap: true,
                    //                 style: TextStyle(
                    //                   fontSize: 10.sp,
                    //                   fontFamily: AppFonts.poppins,
                    //                   color: AppTheme.medGrey,
                    //                 ))
                    //           ],
                    //         ),
                    Text("₹ ${jobListingModel.amount ?? "0"}",
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: AppFonts.poppinsSemiBold,
                          color: AppTheme.black,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
