
import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/presentation/notification/constants/string_constant.dart';
import 'package:sizer/sizer.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar:  EazylifeAppBar(
        title:NotificationString.notification ,
        leadIcon: ImageString.backIcon,
        onPressed: () {
          Navigator.pop(context);
        },

      ),
      body: ListView(
        children: List.generate(10, (index) => NotificationListItem()),
      ),
    );
  }
}



class NotificationListItem extends StatelessWidget {
  const NotificationListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 6.sp,horizontal: 12.sp),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.lightGrey,
          borderRadius: BorderRadius.circular(15),
          shape: BoxShape.rectangle,
        ),
        child: Padding(
          padding:  EdgeInsets.only(left:7.sp,right :7.sp,bottom: 12.sp,top: 7.sp),
          child: Row(
            children: [
              Column(
                children: [
                  Text("",
                      style: TextStyle(
                          fontSize: 8.sp,
                          color: AppTheme.blue,
                          fontWeight: FontWeight.normal)),
                  Container(

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      shape: BoxShape.rectangle,
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(8.sp),
                      child: const Icon(
                        Icons.notifications,
                        color: AppTheme.blue,
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(width: 3.w,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text("8 mins ago",
                          style: TextStyle(
                              fontSize: 8.sp,
                              color: AppTheme.blue,
                              fontWeight: FontWeight.normal)),
                    ),
                    Text(
                      "New Invitation",
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                         fontFamily: AppFonts.poppinsSemiBold)),
                    Text(
                        "Lorem ipsum dolor sit amet, consectetur",
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: AppTheme.medGrey,
                            fontFamily: AppFonts.poppins)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}