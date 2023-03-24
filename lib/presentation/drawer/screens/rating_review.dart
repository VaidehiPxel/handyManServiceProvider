import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/constants/app_string.g.dart';
import 'package:flutter_projects/_core/constants/utils.dart';
import 'package:flutter_projects/_core/custom_widgets/api_loader.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';
import 'package:flutter_projects/_core/custom_widgets/rating_widget.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/application/jobReviewRating/job_review_rating_bloc.dart';
import 'package:flutter_projects/application/jobReviewRating/job_review_rating_event.dart';
import 'package:flutter_projects/application/jobReviewRating/job_review_rating_state.dart';
import 'package:flutter_projects/model/job_review_rating/job_review_rating_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class RatingAndReviewScreen extends StatefulWidget {
  const RatingAndReviewScreen({super.key});

  @override
  State<RatingAndReviewScreen> createState() => _RatingAndReviewScreenState();
}

class _RatingAndReviewScreenState extends State<RatingAndReviewScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<JobReviewRatingBloc>().add(const FetchJobReviewRating());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: EazylifeAppBar(
          title: LocaleKeys.reviewAndRating.tr(),
          leadIcon: AppAssets.backIcon,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: BlocListener<JobReviewRatingBloc, JobReviewRatingState>(
          listener: (context, state) {
            if (state is JobReviewRatingError) {
              ScaffoldMessenger.maybeOf(context)!.showSnackBar(
                  SnackBar(content: Text(state.message.toString())));
            }
          },
          child: BlocBuilder<JobReviewRatingBloc, JobReviewRatingState>(
            builder: (context, state) {
              return state is JobReviewRatingLoading
                  ? const APILoader()
                  : (state is JobReviewRatingLoaded)
                      ? renderBodyView(state.jobReviewRating)
                      : const Center(child: Text("No Data Found"));
            },
          ),
        ));
  }

  renderBodyView(JobReviewRatingModel jobReviewRating) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 12.sp),
      children: [
        SizedBox(
          height: 3.h,
        ),
        Center(
          child: Text(
            jobReviewRating.totalavaragerateing.toStringAsFixed(1),
            style: TextStyle(
              color: AppTheme.blue,
              fontSize: 16.sp,
              fontFamily: AppFonts.poppinsSemiBold,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 0.5.h,
        ),
        RatingsWidget(
          value: jobReviewRating.totalavaragerateing.toDouble(),
          filledStar: Icon(
            Icons.star_rate_rounded,
            color: AppTheme.ratingsStarColor,
            size: 30.sp,
          ),
          halffilledStar: Icon(
            Icons.star_half_rounded,
            color: AppTheme.ratingsStarColor,
            size: 30.sp,
          ),
          unfilledStar: Icon(
            Icons.star_rate_rounded,
            color: AppTheme.greyStar,
            size: 30.sp,
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Center(
          child: Text(
            "${jobReviewRating.result.length} Review",
            style: TextStyle(
              color: AppTheme.black,
              fontSize: 12.sp,
              fontFamily: AppFonts.poppinsMed,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
        ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 1.2.h,
            );
          },
          padding: EdgeInsets.zero,
          itemCount: jobReviewRating.result.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return CustomerReviewsListItem(
                result: jobReviewRating.result[index]);
          },
        ),
        SizedBox(
          height: 1.h,
        ),
      ],
    );
  }
}

class CustomerReviewsListItem extends StatefulWidget {
  final jobReviewRatingList result;
  const CustomerReviewsListItem({required this.result, super.key});

  @override
  State<CustomerReviewsListItem> createState() =>
      _CustomerReviewsListItemState();
}

class _CustomerReviewsListItemState extends State<CustomerReviewsListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.lightGrey,
          borderRadius: BorderRadius.circular(6.sp),
          border: Border.all(color: AppTheme.greyBorderContainer),
          shape: BoxShape.rectangle,
        ),
        child: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(flex: 0, child: CircleAvatar()),
                  SizedBox(
                    width: 3.w,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.result.customerName,
                                  style: TextStyle(
                                    color: AppTheme.black,
                                    fontSize: 12.sp,
                                    fontFamily: AppFonts.poppinsSemiBold,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Row(
                                  children: [
                                    RatingsWidget(
                                      value:
                                          widget.result.ratingValue.toDouble(),
                                      filledStar: Icon(
                                        Icons.star_rate_rounded,
                                        color: AppTheme.ratingsStarColor,
                                        size: 14.sp,
                                      ),
                                      halffilledStar: Icon(
                                        Icons.star_half_rounded,
                                        color: AppTheme.ratingsStarColor,
                                        size: 14.sp,
                                      ),
                                      unfilledStar: Icon(
                                        Icons.star_rate_rounded,
                                        color: AppTheme.greyStar,
                                        size: 14.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Text(
                                      widget.result.ratingValue
                                          .toStringAsFixed(1),
                                      style: TextStyle(
                                        color: AppTheme.blue,
                                        fontSize: 12.sp,
                                        fontFamily: AppFonts.poppinsSemiBold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(AppAssets.calSvg),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text(
                                        widget.result.createdAt.formatDate(),
                                        style: TextStyle(
                                          color: AppTheme.messageGrey,
                                          fontSize: 10.sp,
                                          fontFamily: AppFonts.poppins,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(AppAssets.time),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text(
                                        widget.result.createdAt
                                            .toFormattedTime(),
                                        style: TextStyle(
                                          color: AppTheme.messageGrey,
                                          fontSize: 10.sp,
                                          fontFamily: AppFonts.poppins,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              widget.result.ratingDesc,
                              style: TextStyle(
                                color: AppTheme.messageGrey,
                                fontSize: 10.sp,
                                fontFamily: AppFonts.poppinsMed,
                              ),
                            ),
                            RichText(
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.center,
                              //textDirection: TextDirection.rtl,
                              softWrap: true,
                              maxLines: 1,
                              textScaleFactor: 1,
                              text: TextSpan(
                                text: "Job Title :  ",
                                style: TextStyle(
                                  color: AppTheme.black,
                                  fontFamily: AppFonts.poppinsSemiBold,
                                  fontSize: 12.sp,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: widget.result.jobTitle,
                                      style: TextStyle(
                                        color: AppTheme.messageGrey,
                                        fontFamily: AppFonts.poppinsMed,
                                        fontSize: 10.sp,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 0.5.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
