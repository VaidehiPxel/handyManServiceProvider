import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';
import 'package:flutter_projects/_core/custom_widgets/expansion_tile.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/application/faq/faq_bloc.dart';
import 'package:flutter_projects/application/login/login_bloc.dart';
import 'package:flutter_projects/application/login/login_state.dart';
import 'package:sizer/sizer.dart';

class FAQSScreen extends StatefulWidget {
  const FAQSScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FAQSScreen> createState() => _FAQSScreenState();
}

class _FAQSScreenState extends State<FAQSScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FaqBloc>().add(const FaqCallApiEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FaqBloc, FaqState>(
      listener: (context, state) {
        print(state is FaqSuccess);
      },
      child: BlocBuilder<FaqBloc, FaqState>(
        builder: (context, state) {
          return Scaffold(
              appBar: EazylifeAppBar(
                title: AppString.faqs,
                leadIcon: AppAssets.backIcon,
                onPressed: () {
                  Navigator.pop(context);
                },
                sideIcon: null,
              ),
              body: state.isLoading == true
                  ? const Center(
                      child: CircularProgressIndicator(
                      backgroundColor: AppTheme.lightBlue,
                    ))
                  : (state.isLoading == false && (state is FaqSuccess))
                      ? Padding(
                          padding: EdgeInsets.all(18.sp),
                          child: ListView.builder(
                            itemCount: state.mFaqModel.length,
                            itemBuilder: (context, index) {
                              return EazylifeExpansionTile(
                                title: state.mFaqModel[index].question,
                                subTitle: state.mFaqModel[index].answer,
                              );
                            },
                          ),
                        )
                      : const Center(
                          child: CircularProgressIndicator(
                          backgroundColor: AppTheme.lightBlue,
                        )));
        },
      ),
    );
  }
}
