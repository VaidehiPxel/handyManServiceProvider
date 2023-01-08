
import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';
import 'package:flutter_projects/_core/custom_widgets/rating_widget.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/presentation/drawer/constants/string_constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class RatingAndReviewScreen extends StatefulWidget {
  const RatingAndReviewScreen({super.key});

  @override
  State<RatingAndReviewScreen> createState() => _RatingAndReviewScreenState();
}

class _RatingAndReviewScreenState extends State<RatingAndReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: EazylifeAppBar(
        title: DrawerString.reviewAndRating,
        leadIcon: ImageString.backIcon,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: ListView(
        padding:  EdgeInsets.symmetric(horizontal: 12.sp),
        children: [
          SizedBox(
            height: 3.h,
          ),
          Center(
            child: Text(
              "4.0",
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
            value: 4,
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
              "538 Review",
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

          // ListView.separated(
          //   separatorBuilder: (context, index) {
          //     return SizedBox(
          //       height: 1.2.h,
          //     );
          //   },
          //   padding: EdgeInsets.zero,
          //   itemCount: messageModel.length,
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   itemBuilder: (context, index) {
          //     return messageView(messageModel[index]);
          //   },
          // ),
          for (int i = 0; i < 6; i++) const CustomerReviewsListItem(),
          SizedBox(
            height: 1.h,
          ),
        ],
      ),
    );
  }

}


class CustomerReviewsListItem extends StatefulWidget {
  const CustomerReviewsListItem({super.key});

  @override
  State<CustomerReviewsListItem> createState() =>
      _CustomerReviewsListItemState();
}

class _CustomerReviewsListItemState extends State<CustomerReviewsListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.lightGrey,
        borderRadius: BorderRadius.circular(6.sp),
        border: Border.all(color: AppTheme.greyBorderContainer),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding:  EdgeInsets.all(10.sp),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(flex: 0, child: CircleAvatar()),
                SizedBox(width: 3 .w,),
                Expanded(
                  flex: 2,
                  child:
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Abhithi Maheshvari",
                                style: TextStyle(
                                  color: AppTheme.black,
                                  fontSize: 12.sp,
                                  fontFamily: AppFonts.poppinsSemiBold,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 0.5.h,),
                              Row(
                                children: [
                                  RatingsWidget(
                                    value: 4,
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
                                  SizedBox(width: 3 .w,),
                                  Text(
                                    "4.0",
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
                                    SvgPicture.asset(ImageString.calSvg),
                                    SizedBox(width: 2 .w,),
                                    Text(
                                      "24 Sep",
                                      style: TextStyle(
                                        color: AppTheme.messageGrey,
                                        fontSize: 10.sp,
                                        fontFamily: AppFonts.poppins,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 0.5.h,),
                                Row(
                                  children: [
                                    SvgPicture.asset(ImageString.time),
                                    SizedBox(width: 2 .w,),
                                    Text(
                                      "60 mins",
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
                     SizedBox(height: 1.h,),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Text(
                            "Excellent service and very fast dispatch and good customer service and wide number.",
                            style: TextStyle(
                              color: AppTheme.messageGrey,
                              fontSize: 10.sp,
                              fontFamily: AppFonts.poppins,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          RichText(
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            softWrap: true,
                            maxLines: 1,
                            textScaleFactor: 1,
                            text: TextSpan(
                              text: "Job Title :",
                              style: TextStyle(
                                color: AppTheme.black,
                                fontFamily: AppFonts.poppinsSemiBold,
                                fontSize: 12.sp,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "  Sofa Cleaning",
                                    style: TextStyle(
                                      color: AppTheme.messageGrey,
                                      fontFamily: AppFonts.poppins,
                                      fontWeight: FontWeight.w400,
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
    );
  }
}