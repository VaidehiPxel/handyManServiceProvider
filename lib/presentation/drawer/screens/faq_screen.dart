import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';
import 'package:flutter_projects/_core/custom_widgets/expansion_tile.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:sizer/sizer.dart';

class FAQSScreen extends StatelessWidget {
  const FAQSScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EazylifeAppBar(
        title: AppString.faqs,
        leadIcon: AppAssets.backIcon,
        onPressed: () {
          Navigator.pop(context);
        },
        sideIcon: null,
      ),
      body: Padding(
        padding:  EdgeInsets.all(18.sp),
        child: ListView(
          children: [
             EazylifeExpansionTile(
                title: AppString.faqTitle,
                subTitle: AppString.faqSubTitle),
            SizedBox(
              height: 2.h,
            ),
            const EazylifeExpansionTile(
                title: AppString.faqTitle,
                subTitle: AppString.faqSubTitle),
            SizedBox(
              height: 2.h,
            ),
            const EazylifeExpansionTile(
                title: AppString.faqTitle,
                subTitle: AppString.faqSubTitle),
            SizedBox(
              height: 2.h,
            ),
            const EazylifeExpansionTile(
                title: AppString.faqTitle,
                subTitle: AppString.faqSubTitle),
            SizedBox(
              height: 2.h,
            ),
            const EazylifeExpansionTile(
                title: AppString.faqTitle,
                subTitle: AppString.faqSubTitle),
          ],
        ),
      ),
    );
  }
}
