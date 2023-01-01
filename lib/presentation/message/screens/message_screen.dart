import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/Navigation.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/model/home/job_listing_model.dart';
import 'package:flutter_projects/model/home/message_model.dart';
import 'package:flutter_projects/presentation/auth/constants/image_constant.dart';
import 'package:flutter_projects/presentation/drawer/drawer_widget.dart';
import 'package:flutter_projects/presentation/home/constants/image_constant.dart';
import 'package:flutter_projects/presentation/home/constants/string_constant.dart';
import 'package:flutter_projects/presentation/dashboard/screens/bottom_appbar.dart';
import 'package:flutter_projects/presentation/home/widget/blue_box_text.dart';
import 'package:flutter_projects/_core/custom_widgets/job_listView.dart';
import 'package:flutter_projects/presentation/message/screens/chat_detail_screen.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  int currentIndex = 2;

  List<MessageModel> messageModel = [
    MessageModel(
      senderImage: "https://picsum.photos/id/237/200/300",
      senderMessage: "Excellent service and very fast",
      senderName: "Naman Bali",
      senderTime: "8 mins ago",
    ),
    MessageModel(
      senderImage: "https://picsum.photos/id/237/200/300",
      senderMessage: "Excellent service and very fast",
      senderName: "Naman Bali",
      senderTime: "8 mins ago",
    ),
    MessageModel(
      senderImage: "https://picsum.photos/id/237/200/300",
      senderMessage: "Excellent service and very fast",
      senderName: "Naman Bali",
      senderTime: "8 mins ago",
    ),
    MessageModel(
      senderImage: "https://picsum.photos/id/237/200/300",
      senderMessage: "Excellent service and very fast",
      senderName: "Naman Bali",
      senderTime: "8 mins ago",
    ),
    MessageModel(
      senderImage: "https://picsum.photos/id/237/200/300",
      senderMessage: "Excellent service and very fast",
      senderName: "Naman Bali",
      senderTime: "8 mins ago",
    ),
    MessageModel(
      senderImage: "https://picsum.photos/id/237/200/300",
      senderMessage: "Excellent service and very fast",
      senderName: "Naman Bali",
      senderTime: "8 mins ago",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: renderBodyView()); //HomeScreenWidget(),
  }

  Widget renderBodyView() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: kToolbarHeight * 2.3,
            ),
            Text(HomeString.message,
                style: TextStyle(
                    fontFamily: AppFonts.poppinsSemiBold,
                    fontSize: 16.sp,
                    color: AppTheme.black)),
            SizedBox(
              height: 1.5.h,
            ),
            ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 1.2.h,
                );
              },
              padding: EdgeInsets.zero,
              itemCount: messageModel.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return messageView(messageModel[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget messageView(MessageModel messageModel) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.lightGrey,
        borderRadius: BorderRadius.circular(7.sp),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 7.sp),
        child: InkWell(
          onTap: () {
            callNextScreen(context, const ChatDetailScreen());
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: SizedBox.fromSize(
                  size: Size.fromRadius(18.sp), // Image radius
                  child: Image.network(messageModel.senderImage!,
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
                        messageModel.senderName!,
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: AppFonts.poppinsSemiBold,
                          color: AppTheme.black,
                        ),
                      ),
                      SizedBox(
                        height: 0.3.h,
                      ),
                      Text(messageModel.senderMessage!,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontFamily: AppFonts.poppins,
                            color: AppTheme.medGrey,
                          )),
                    ],
                  ),
                ),
              ),
              Text(messageModel.senderTime!,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 9.sp,
                    fontFamily: AppFonts.poppinsMed,
                    color: AppTheme.buttonBlue,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
