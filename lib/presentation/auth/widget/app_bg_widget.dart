import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:sizer/sizer.dart';

class AppBGWidget extends StatefulWidget {
  final Widget? body;
  const AppBGWidget({super.key, required this.body});

  @override
  State<AppBGWidget> createState() => _AppBGWidgetState();
}

class _AppBGWidgetState extends State<AppBGWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Container(
          decoration: const BoxDecoration(
              color: AppTheme.blue,
              image:  DecorationImage(
                  image: AssetImage(AppAssets.appBg),
                  fit: BoxFit.cover)),
        ),
        Padding(
          padding:  EdgeInsets.only(bottom: 3.h),
          child: widget.body!,
        )
      ],
    );
  }
}
