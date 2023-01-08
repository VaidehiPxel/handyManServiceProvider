import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:sizer/sizer.dart';

enum EazyLifeJobStatus { Active, Completed, UnderProcess, Applied, Accepted }

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
    if (status == EazyLifeJobStatus.Active) {
      return AppTheme.green;
    } else if (status == EazyLifeJobStatus.Completed) {
      return AppTheme.blue;
    } else if (status == EazyLifeJobStatus.UnderProcess) {
      return AppTheme.amber;
    }
    else if (status == EazyLifeJobStatus.Applied) {
      return AppTheme.amber;
    }
    else if (status == EazyLifeJobStatus.Accepted) {
      return AppTheme.green;
    }
    return AppTheme.green;
  }

  String getStatusTitle(status) {
    if (status == EazyLifeJobStatus.Active) {
      return "Active";
    } else if (status == EazyLifeJobStatus.Completed) {
      return "Completed";
    } else if (status == EazyLifeJobStatus.UnderProcess) {
      return "Under Process";
    }
    else if (status == EazyLifeJobStatus.Applied) {
      return "Applied";
    }
    else if (status == EazyLifeJobStatus.Accepted) {
      return "Accepted";
    }

    return "Active";
  }
}