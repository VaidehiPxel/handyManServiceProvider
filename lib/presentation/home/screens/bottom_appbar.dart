import 'package:flutter/material.dart';
import 'package:flutter_projects/presentation/auth/constants/image_constant.dart';
import 'package:flutter_projects/presentation/auth/constants/string_constant.dart';
import 'package:flutter_projects/presentation/home/constants/image_constant.dart';
import 'package:flutter_projects/presentation/home/constants/string_constant.dart';


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
                    HomeAsset.home,
                    height: 30,
                    width: 30,
                  ),
                  label: HomeString.home,
                  activeIcon: Image.asset(
                    HomeAsset.homehover,
                    height: 30,
                    width: 30,
                  ),
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    HomeAsset.myJobs,
                    height: 30,
                    width: 30,
                  ),
                  label: HomeString.myJobs,
                  activeIcon: Image.asset(
                    HomeAsset.myJobshover,
                    height: 30,
                    width: 30,
                  ),
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    HomeAsset.message,
                    height: 30,
                    width: 30,
                  ),
                  label: HomeString.message,
                  activeIcon: Image.asset(
                    HomeAsset.messagehover,
                    height: 30,
                    width: 30,
                  ),
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    HomeAsset.profile,
                    height: 30,
                    width: 30,
                  ),
                  label: HomeString.profile,
                  activeIcon: Image.asset(
                    HomeAsset.profilehover,
                    height: 30,
                    width: 30,
                  ),
                  backgroundColor: Colors.white),
            ]),
      ),
    );
  }
}
