import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/_core/Navigation.dart';
import 'package:flutter_projects/_core/constants/hive_constant.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/constants/app_string.g.dart';
import 'package:flutter_projects/_core/custom_widgets/api_loader.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';
import 'package:flutter_projects/_core/custom_widgets/app_button.dart';
import 'package:flutter_projects/_core/custom_widgets/eazylife_widget.dart';
import 'package:flutter_projects/application/report/report_bloc.dart';
import 'package:flutter_projects/model/report/report_job_list.dart';
import 'package:flutter_projects/model/report/report_listing_model.dart';
import 'package:flutter_projects/model/report/report_service_provider.dart';
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
  List<GetServiceProvidersList> userItems = [];
  List<GetJobList> jobItems = [];
  GetServiceProvidersList? dropdownvalue;
  GetJobList? dropdownvalue1;
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ReportBloc>().add(const GetReportServiceListCallApiEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: EazylifeAppBar(
          title: LocaleKeys.reportAndComplaint.tr(),
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
            if (state is CreateReportSuccess) {
              ScaffoldMessenger.maybeOf(context)!.showSnackBar(
                  const SnackBar(content: Text("Complaint Successfull")));
              Future.delayed(const Duration(milliseconds: 1000), () {
                //TODO: check this
                //callNextScreen(context, const HomeScreen());
              });
            }

            if (state is ReportServiceListSuccess) {
              context
                  .read<ReportBloc>()
                  .add(const GetReportUserListCallApiEvent());
            }

            if (state is ReportSuccess) {
              userItems = state.getServiceProvidersList;
              jobItems = state.getJobList;
              setState(() {});
            }
          },
          child: BlocBuilder<ReportBloc, Report1State>(
            builder: (context, state) {
              return state.isLoading == true
                  ? const APILoader()
                  : renderBodyView(context, state);
            },
          ),
        ));
  }

  Widget renderBodyView(BuildContext context, Report1State state) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          EazyLifeWidget(
            title: LocaleKeys.selectUser.tr(),
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
                          items: userItems.map((GetServiceProvidersList items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items.name),
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
            title: LocaleKeys.selectJob.tr(),
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
                          value: dropdownvalue1,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: jobItems.map((GetJobList items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items.title),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              dropdownvalue1 = value!;
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
            title: LocaleKeys.addComplaint.tr(),
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
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: LocaleKeys.addComplaint.tr(),
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
                  title: LocaleKeys.raiseAComplaint.tr(),
                  onPressed: () {
                    if (descriptionController.text.isNotEmpty &&
                        dropdownvalue1 != null &&
                        dropdownvalue != null) {
                      context.read<ReportBloc>().add(CreateReportCallApiEvent(
                            userId: dropdownvalue!.id,
                            jobId: dropdownvalue1!.id,
                            jobTitle: dropdownvalue1!.title,
                            description: descriptionController.text,
                          ));
                    }
                  },
                ),
        ],
      ),
    );
  }
}
