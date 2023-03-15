import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/constants/utils.dart';
import 'package:flutter_projects/_core/custom_widgets/api_loader.dart';
import 'package:flutter_projects/_core/custom_widgets/grey_textField.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/application/message/message_bloc.dart';
import 'package:flutter_projects/model/message/message_list_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class ChatDetailScreen extends StatefulWidget {
  final int userId;
  final String userProfile;
  final String userName;
  const ChatDetailScreen(
      {Key? key,
      required this.userId,
      required this.userName,
      required this.userProfile})
      : super(key: key);

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class ChatMessage {
  String? messageContent;
  String? messageType;
  String? time;
  ChatMessage(
      {@required this.messageContent,
      @required this.messageType,
      @required this.time});
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  TextEditingController messageController = TextEditingController();
  @override
  void initState() {
    super.initState();
    context
        .read<MessageBloc>()
        .add(GetMessageHistoryApiEvent(userId: widget.userId));
  }

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
                image: AssetImage(AppAssets.appBg),
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
                      child: widget.userProfile.toString().contains("null") ||
                              widget.userProfile.toString().contains("")
                          ? Image.asset(AppAssets.profileThumb)
                          : Image.network(widget.userProfile,
                              fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    width: 2.5.w,
                  ),
                  Text(widget.userName,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: AppFonts.poppinsSemiBold,
                          color: Colors.white)),
                ],
              ),
              titleSpacing: 0,
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                    onPressed: () {}, icon: SvgPicture.asset(AppAssets.call))
              ],
              leading: Builder(builder: (context) {
                return IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(AppAssets.backIcon),
                );
              }),
            ),
          ),
        ),
        body: BlocListener<MessageBloc, MessageState>(
          listener: (context, state) {
            if (state is SendMessageSuccess) {
              ScaffoldMessenger.maybeOf(context)!.showSnackBar(
                  const SnackBar(content: Text("Message send successfully")));
            }
          },
          child: BlocBuilder<MessageBloc, MessageState>(
            builder: (context, state) {
              return state.isLoading == true
                  ? const APILoader()
                  : (state is GetHistorySuccess)
                      ? renderBodyView(state.historyList)
                      : const Center(child: Text("No data Found"));
            },
          ),
        ));
  }

  renderBodyView(List<Getuserchatdetail> historyList) {
    return Stack(
      children: [
        ListView.builder(
          itemCount: historyList.length,
          shrinkWrap: true,
          padding: EdgeInsets.all(5.sp),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
              child: Align(
                alignment: (historyList[index].usertype == "user"
                    ? Alignment.topLeft
                    : Alignment.topRight),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        historyList[index].usertype == "serviceprovider"
                            ? BorderRadius.only(
                                topLeft: Radius.circular(7.sp),
                                topRight: Radius.circular(7.sp),
                                bottomRight: Radius.circular(7.sp))
                            : BorderRadius.only(
                                topLeft: Radius.circular(7.sp),
                                topRight: Radius.circular(7.sp),
                                bottomLeft: Radius.circular(7.sp)),
                    color: (historyList[index].usertype == "serviceprovider"
                        ? AppTheme.lightGrey
                        : AppTheme.blue),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        historyList[index].description,
                        style: historyList[index].usertype == "serviceprovider"
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
                        historyList[index].createdAt.toFormattedTime(),
                        style: historyList[index].usertype == "serviceprovider"
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
              padding: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 2.h),
              child: Container(
                height: 6.h,
                decoration: BoxDecoration(
                  color: AppTheme.lightGrey,
                  borderRadius: BorderRadius.circular(5.sp),
                  shape: BoxShape.rectangle,
                ),
                child: TextFormField(
                  maxLines: 1,
                  controller: messageController,
                  enableSuggestions: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Send Message",
                    suffixIcon: InkWell(
                        onTap: () {
                          context.read<MessageBloc>().add(
                              SendMessageCallApiEvent(
                                  userId: widget.userId,
                                  message: messageController.text));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: SvgPicture.asset(AppAssets.sendSvg),
                        )),
                    hintStyle: TextStyle(
                        fontFamily: AppFonts.poppinsMed,
                        fontSize: 12.sp,
                        color: AppTheme.medGrey),
                    contentPadding: EdgeInsets.all(10.sp),
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
