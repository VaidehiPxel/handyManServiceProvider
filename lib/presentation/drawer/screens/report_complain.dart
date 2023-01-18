
import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';
import 'package:flutter_projects/_core/custom_widgets/app_button.dart';
import 'package:flutter_projects/_core/custom_widgets/eazylife_widget.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:sizer/sizer.dart';

class ReportComplaintScreen extends StatefulWidget {
  const ReportComplaintScreen({super.key});

  @override
  State<ReportComplaintScreen> createState() => _ReportComplaintScreenState();
}

class _ReportComplaintScreenState extends State<ReportComplaintScreen> {
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  String dropdownvalue = 'Item 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: EazylifeAppBar(
        title: AppString.reportAndComplaint,
        leadIcon: AppAssets.backIcon,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(12.sp),
          child: Column(
            children: [
               SizedBox(
                height: 2.h,
              ),
              EazyLifeWidget(
                title: AppString.selectComplaint,
                fontFamily: AppFonts.poppinsMed,
                fontSize: 16.sp,
                widget: Padding(
                  padding:  EdgeInsets.only(top:0.8.h),
                  child: Container(
                    height: 6.h,
                    margin:  EdgeInsets.symmetric(horizontal:2.w),
                    decoration: BoxDecoration(
                      color: AppTheme.lightGrey,
                      borderRadius: BorderRadius.circular(5.sp),
                      shape: BoxShape.rectangle,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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
              SizedBox(height: 2.h,),
              EazyLifeWidget(
                title: AppString.addComplaint,
                widget: Padding(
                  padding:  EdgeInsets.only(top:0.8.h),
                  child: Container(

                    margin:  EdgeInsets.symmetric(horizontal:2.w),
                    decoration: BoxDecoration(
                      color: AppTheme.lightGrey,
                      borderRadius: BorderRadius.circular(5.sp),
                      shape: BoxShape.rectangle,
                    ),
                    child: Center(
                      child: TextFormField(
                        enableIMEPersonalizedLearning: true,
                        enableSuggestions: true,
                        minLines: 10,
                        maxLines: 40,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: AppString.addComplaint,
                          contentPadding: EdgeInsets.all(14),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AppButton(
                title: AppString.raiseAComplaint,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}