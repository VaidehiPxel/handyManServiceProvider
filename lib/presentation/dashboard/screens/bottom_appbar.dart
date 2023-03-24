import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';

class EazylifeBottomAppBar extends StatefulWidget {
  final void Function(int)? onTap;
  final int currentIndex;
  const EazylifeBottomAppBar(
      {super.key, this.currentIndex = 0, required this.onTap});

  @override
  State<EazylifeBottomAppBar> createState() => _EazylifeBottomAppBarState();
}

class _EazylifeBottomAppBarState extends State<EazylifeBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: widget.currentIndex,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            onTap: widget.onTap,
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(
                    AppAssets.home,
                    height: 30,
                    width: 30,
                  ),
                  label: LocaleKeys.home.tr(),
                  activeIcon: Image.asset(
                    AppAssets.homehover,
                    height: 30,
                    width: 30,
                  ),
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    AppAssets.myJobs,
                    height: 30,
                    width: 30,
                  ),
                  label: LocaleKeys.myJobs.tr(),
                  activeIcon: Image.asset(
                    AppAssets.myJobshover,
                    height: 30,
                    width: 30,
                  ),
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    AppAssets.message,
                    height: 30,
                    width: 30,
                  ),
                  label: LocaleKeys.message.tr(),
                  activeIcon: Image.asset(
                    AppAssets.messagehover,
                    height: 30,
                    width: 30,
                  ),
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    AppAssets.profile,
                    height: 30,
                    width: 30,
                  ),
                  label: LocaleKeys.profile.tr(),
                  activeIcon: Image.asset(
                    AppAssets.profilehover,
                    height: 30,
                    width: 30,
                  ),
                  backgroundColor: Colors.white),
            ]),
      ),
    );
  }
}
