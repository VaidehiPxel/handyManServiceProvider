import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';
import 'package:flutter_projects/_core/custom_widgets/expansion_tile.dart';
import 'package:flutter_projects/_core/custom_widgets/job_detail_view.dart';
import 'package:flutter_projects/_core/custom_widgets/job_listView.dart';
import 'package:flutter_projects/presentation/drawer/constants/string_constant.dart';
import 'package:flutter_projects/presentation/home/constants/string_constant.dart';
import 'package:sizer/sizer.dart';

class JobDeatilScreen extends StatelessWidget {
  final String? appBarTitle;
  const JobDeatilScreen({
    Key? key,this.appBarTitle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EazylifeAppBar(
        title: appBarTitle??"",
        leadIcon: ImageString.backIcon,
        onPressed: () {
          Navigator.pop(context);
        },
        sideIcon: null,
      ),
      body: Padding(
        padding:  EdgeInsets.all(18.sp),
        child:JobDetailView(),
      ),
    );
  }
}
