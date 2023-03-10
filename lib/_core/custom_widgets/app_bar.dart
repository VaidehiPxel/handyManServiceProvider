import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../constants/image_constants.dart';

class EazylifeAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final String leadIcon;
  final String? sideIcon;
  final VoidCallback? onPressed;
  final VoidCallback? sideOnPressed;
  const EazylifeAppBar(
      {super.key,
      required this.title,
      required this.leadIcon,
      this.sideIcon,
      this.onPressed,
      this.sideOnPressed});

  @override
  State<EazylifeAppBar> createState() => _EazylifeAppBarState();

  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight * 0.16.h);
}

class _EazylifeAppBarState extends State<EazylifeAppBar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(double.infinity, kToolbarHeight * 0.16.h),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.blue.shade700,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12.sp),
              bottomRight: Radius.circular(12.sp)),
          shape: BoxShape.rectangle,
          image: const DecorationImage(
            image: AssetImage(AppAssets.appBg),
            fit: BoxFit.cover,
          ),
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(widget.title),
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: widget.onPressed ??
                  () {
                    Scaffold.of(context).openDrawer();
                  },
              icon: SvgPicture.asset(widget.leadIcon),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          }),
          actions: [
            IconButton(
                onPressed: widget.sideOnPressed,
                icon: SvgPicture.asset(
                    widget.sideIcon ?? AppAssets.notifications))
          ],
        ),
      ),
    );
  }
}
