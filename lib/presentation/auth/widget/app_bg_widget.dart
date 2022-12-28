import 'package:flutter/material.dart';
import 'package:flutter_projects/presentation/auth/constants/image_constant.dart';

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
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.blue.shade700,
              image:  const DecorationImage(
                  image: AssetImage(AuthImageString.appBg), fit: BoxFit.cover)),
        ),
        widget.body!
      ],
    );
  }
}
