import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:sizer/sizer.dart';

class JobDetailView extends StatefulWidget {
  const JobDetailView({Key? key}) : super(key: key);

  @override
  State<JobDetailView> createState() => _JobDetailViewState();
}

class _JobDetailViewState extends State<JobDetailView> {
  @override
  Widget build(BuildContext context) {
    return _setTitle();
  }

  Column _setTitle() {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Sofa Cleaning",style: TextStyle(
        fontFamily: AppFonts.poppinsSemiBold,
        fontSize: 16.sp,
        color: AppTheme.black

      ),),
      Text("Lorem ipsum dolor sit amet, adipiscing elit",style: TextStyle(
          fontFamily: AppFonts.poppinsMed,
          fontSize: 12.sp,
          color: AppTheme.detailGrey

      ),),
      Divider(
        color: AppTheme.medGrey,
      )
    ],
  );
  }
}
