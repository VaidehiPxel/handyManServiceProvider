import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:sizer/sizer.dart';

enum EazyLifeJobStatus { active, completed, underProcess, applied, accepted }

class EazyLifeJobStatusWidget extends StatelessWidget {
  final EazyLifeJobStatus status;
  final double size;
  final double? fontSize;
  const EazyLifeJobStatusWidget(
      {super.key,
      required this.status,
      required this.size,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
              color: getStatusColor(status),
              borderRadius: BorderRadius.circular(18),
              shape: BoxShape.rectangle,
              border: Border.all(
                  style: BorderStyle.solid,
                  strokeAlign: StrokeAlign.outside,
                  width: size,
                  color: getStatusColor(status).withOpacity(0.2))),
          child: SizedBox(
            height: (size - 1).sp,
            width: (size - 1).sp,
          ),
        ),
        Text(
          getStatusTitle(status),
          style: TextStyle(
            color: getStatusColor(status),
            fontSize: fontSize,
            fontFamily: AppFonts.poppinsMed,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Color getStatusColor(status) {
    if (status == EazyLifeJobStatus.active) {
      return AppTheme.green;
    } else if (status == EazyLifeJobStatus.completed) {
      return AppTheme.blue;
    } else if (status == EazyLifeJobStatus.underProcess) {
      return AppTheme.amber;
    } else if (status == EazyLifeJobStatus.applied) {
      return AppTheme.amber;
    } else if (status == EazyLifeJobStatus.accepted) {
      return AppTheme.green;
    }
    return AppTheme.green;
  }

  String getStatusTitle(status) {
    if (status == EazyLifeJobStatus.active) {
      return "Active";
    } else if (status == EazyLifeJobStatus.completed) {
      return "Completed";
    } else if (status == EazyLifeJobStatus.underProcess) {
      return "Under Process";
    } else if (status == EazyLifeJobStatus.applied) {
      return "Applied";
    } else if (status == EazyLifeJobStatus.accepted) {
      return "Accepted";
    }

    return "Active";
  }
}
