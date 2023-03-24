import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/_core/Navigation.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/constants/app_string.g.dart';
import 'package:flutter_projects/_core/constants/utils.dart';
import 'package:flutter_projects/_core/custom_widgets/api_loader.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/application/message/message_bloc.dart';

import 'package:flutter_projects/model/message/message_list_model.dart';
import 'package:flutter_projects/presentation/dashboard/message/screens/chat_detail_screen.dart';
import 'package:sizer/sizer.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("message");
    context.read<MessageBloc>().add(const GetMessageListCallApiEvent());
  }

  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return BlocListener<MessageBloc, MessageState>(
      listener: (context, state) {},
      child: BlocBuilder<MessageBloc, MessageState>(
        builder: (context, state) {
          return state.isLoading == true
              ? const APILoader()
              : state.messageList.isNotEmpty
                  ? renderBodyView(state.messageList)
                  : const Center(child: Text("No data Found"));
        },
      ),
    ); //HomeScreenWidget(),
  }

  Widget renderBodyView(List<Getuserchatdetail> messageList) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: kToolbarHeight * 2.3,
            ),
            Text(LocaleKeys.message.tr(),
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
              itemCount: messageList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return messageView(messageList[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget messageView(Getuserchatdetail messageList) {
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
            callNextScreen(
                context,
                ChatDetailScreen(
                  userId: messageList.userId,
                  //tushar change here to handymanid
                  userName: messageList.name!,
                  userProfile: messageList.profilepics!,
                ));
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: SizedBox.fromSize(
                  size: Size.fromRadius(18.sp), // Image radius
                  child: messageList.profilepics.toString().contains("null") ||
                          messageList.profilepics.toString().contains("")
                      ? Image.asset(AppAssets.profileThumb)
                      : Image.network(messageList.profilepics!,
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
                        messageList.name!,
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
                      Text(messageList.description,
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
              Text(messageList.createdAt.timeAgo(),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 9.sp,
                    fontFamily: AppFonts.poppinsMed,
                    color: AppTheme.blue,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
