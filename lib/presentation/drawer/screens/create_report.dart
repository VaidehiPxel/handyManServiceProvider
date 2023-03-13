import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/_core/Navigation.dart';
import 'package:flutter_projects/_core/constants/hive_constant.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:flutter_projects/_core/custom_widgets/api_loader.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';
import 'package:flutter_projects/_core/custom_widgets/app_button.dart';
import 'package:flutter_projects/_core/custom_widgets/eazylife_widget.dart';
import 'package:flutter_projects/application/report/report_bloc.dart';
import 'package:flutter_projects/model/report/report_listing_model.dart';
import 'package:flutter_projects/presentation/dashboard/home/screens/home_screen.dart';
import 'package:flutter_projects/presentation/dashboard/notification/screen/notification_screen.dart';
import 'package:sizer/sizer.dart';

class CreateReportAndComplaintScreen extends StatefulWidget {
  const CreateReportAndComplaintScreen({
    super.key,
  });

  @override
  State<CreateReportAndComplaintScreen> createState() =>
      _CreateReportAndComplaintScreenState();
}

class _CreateReportAndComplaintScreenState
    extends State<CreateReportAndComplaintScreen> {
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  String dropdownvalue = 'Item 1';
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: EazylifeAppBar(
          title: AppString.reportAndComplaint,
          leadIcon: AppAssets.backIcon,
          sideIcon: AppAssets.notifications,
          sideOnPressed: () {
            callNextScreen(context, const NotificationScreen());
          },
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: BlocListener<ReportBloc, Report1State>(
          listener: (context, state) {
            if (state is ReportSuccess) {
              ScaffoldMessenger.maybeOf(context)!.showSnackBar(
                  const SnackBar(content: Text("Complaint Successfull")));
              Future.delayed(const Duration(milliseconds: 1000), () {
                callNextScreen(context, const HomeScreen());
              });
            }
          },
          child: BlocBuilder<ReportBloc, Report1State>(
            builder: (context, state) {
              return renderBodyView(state);
            },
          ),
        ));
  }

  Widget renderBodyView(Report1State state) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          EazyLifeWidget(
            title: AppString.selectUser,
            widget: Padding(
              padding: EdgeInsets.only(top: 0.5.h),
              child: Container(
                height: 6.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(5.sp),
                  shape: BoxShape.rectangle,
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          value: dropdownvalue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              dropdownvalue = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          EazyLifeWidget(
            title: AppString.selectJob,
            widget: Padding(
              padding: EdgeInsets.only(top: 0.5.h),
              child: Container(
                height: 6.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(5.sp),
                  shape: BoxShape.rectangle,
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          value: dropdownvalue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              dropdownvalue = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          EazyLifeWidget(
            title: AppString.addComplaint,
            widget: Container(
              height: 20.h,
              decoration: BoxDecoration(
                color: const Color(0xFFF6F6F6),
                borderRadius: BorderRadius.circular(5.sp),
                shape: BoxShape.rectangle,
              ),
              child: Center(
                child: TextFormField(
                  controller: descriptionController,
                  enableIMEPersonalizedLearning: true,
                  enableSuggestions: true,
                  minLines: 50,
                  maxLines: 100,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: AppString.addComplaint,
                    contentPadding: EdgeInsets.all(14),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          state is CreateReportLoading
              ? const APILoader()
              : AppButton(
                  title: AppString.raiseAComplaint,
                  onPressed: () {
                    context.read<ReportBloc>().add(CreateReportCallApiEvent(
                          userId: 26,
                          jobId: 25,
                          jobTitle: "ghggh",
                          description: descriptionController.text,
                        ));
                  },
                ),
        ],
      ),
    );
  }
}
