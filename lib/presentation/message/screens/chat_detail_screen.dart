import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/presentation/auth/constants/image_constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({Key? key}) : super(key: key);

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class ChatMessage {
  String? messageContent;
  String? messageType;
  String? time;
  ChatMessage({@required this.messageContent, @required this.messageType,@required this.time});
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver",time: "10:20 am"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver",time: "10:20 am"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender",time: "10:20 am"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver",time: "10:20 am"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender",time: "10:20 am"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight * 0.16.h),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.blue.shade700,
            borderRadius: BorderRadius.circular(18),
            shape: BoxShape.rectangle,
            image: const DecorationImage(
              image: AssetImage(AuthImageString.appBg),
              fit: BoxFit.cover,
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Row(
              children: [
                ClipOval(
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(16.sp), // Image radius
                    child: Image.network("https://picsum.photos/id/237/200/300",
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  width: 2.5.w,
                ),
                Text("Theertha Arera",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: AppFonts.poppinsSemiBold,
                        color: Colors.white)),
              ],
            ),
            titleSpacing: 0,
            automaticallyImplyLeading: false,
            leading: Builder(builder: (context) {
              return IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset(ImageString.backIcon),
              );
            }),
          ),
        ),
      ),
      body: Stack(
        children: [

          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: EdgeInsets.all(5.sp),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
                child: Align(
                  alignment: (messages[index].messageType == "receiver"
                      ? Alignment.topLeft
                      : Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: messages[index].messageType == "receiver"
                          ? BorderRadius.only(
                              topLeft: Radius.circular(7.sp),
                              topRight: Radius.circular(7.sp),
                              bottomRight: Radius.circular(7.sp))
                          : BorderRadius.only(
                              topLeft: Radius.circular(7.sp),
                              topRight: Radius.circular(7.sp),
                              bottomLeft: Radius.circular(7.sp)),
                      color: (messages[index].messageType == "receiver"
                          ? AppTheme.lightGrey
                          : AppTheme.buttonBlue),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 3.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          messages[index].messageContent!,
                          style: messages[index].messageType == "receiver"
                              ? TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: AppFonts.poppins,
                                  color: AppTheme.medGrey)
                              : TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: AppFonts.poppins,
                                  color: AppTheme.white),
                        ),
                        Text(
                          messages[index].time!,
                          style: messages[index].messageType == "receiver"
                              ? TextStyle(
                              fontSize: 9.sp,
                              fontFamily: AppFonts.poppins,
                              color: AppTheme.medGrey)
                              : TextStyle(
                              fontSize: 9.sp,
                              fontFamily: AppFonts.poppins,
                              color: AppTheme.white),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:  EdgeInsets.only(left: 5.w,right:  5.w,bottom: 2.h),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppTheme.lightGrey,
                  borderRadius: BorderRadius.circular(7.sp),
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: 1.7.h,horizontal: 3.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Send Message", style:TextStyle(
                          fontSize: 14.sp,
                          fontFamily: AppFonts.poppinsMed,
                          color: AppTheme.messageGrey)),
                      SvgPicture.asset(ImageString.sendSvg)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
