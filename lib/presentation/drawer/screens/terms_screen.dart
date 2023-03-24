import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/constants/app_string.g.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/application/terms/terms_bloc.dart';
import 'package:sizer/sizer.dart';

class TAndCScreen extends StatefulWidget {
  const TAndCScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TAndCScreen> createState() => _TAndCScreenState();
}

class _TAndCScreenState extends State<TAndCScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TermsConditionBloc>().add(const TermsConditionCallApiEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TermsConditionBloc, TermsConditionState>(
      listener: (context, state) {},
      child: BlocBuilder<TermsConditionBloc, TermsConditionState>(
        builder: (context, state) {
          return Scaffold(
              appBar: EazylifeAppBar(
                title: LocaleKeys.termsCondition.tr(),
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
                  : (state.isLoading == false &&
                          (state is TermsConditionSuccess))
                      ? Padding(
                          padding: EdgeInsets.all(18.sp),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  LocaleKeys.termsCondition.tr(),
                                  style: TextStyle(
                                    color: AppTheme.black,
                                    fontSize: 16.sp,
                                    fontFamily: AppFonts.poppinsBold,
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  state.mTermsConditions,
                                  style: TextStyle(
                                    color: AppTheme.medGrey,
                                    fontSize: 12.sp,
                                    fontFamily: AppFonts.poppins,
                                  ),
                                ),
                              ],
                            ),
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
