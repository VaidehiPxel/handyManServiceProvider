import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/Navigation.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';
import 'package:flutter_projects/presentation/drawer/drawer_widget.dart';
import 'package:flutter_projects/presentation/home/constants/image_constant.dart';
import 'package:flutter_projects/presentation/home/constants/string_constant.dart';
import 'package:flutter_projects/presentation/dashboard/screens/bottom_appbar.dart';
import 'package:flutter_projects/presentation/home/screens/home_Screen.dart';
import 'package:flutter_projects/presentation/message/screens/message_screen.dart';
import 'package:flutter_projects/presentation/myJobs/screen/my_job_detail_screen.dart';
import 'package:flutter_projects/presentation/myJobs/screen/myJobs_screen.dart';
import 'package:flutter_projects/presentation/notification/screen/notification_screen.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int currentIndex = 0;

  void pageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: EazylifeAppBar(
        title: currentIndex == 0
            ? HomeString.welcome
            : currentIndex == 1
                ? HomeString.myJobs
                : currentIndex == 2
                    ? HomeString.message
                    : HomeString.profile,
        leadIcon: ImageString.humBurgerSvg,
        sideIcon: currentIndex == 1
            ? ImageString.filter
            : currentIndex == 2
                ? HomeAsset.searchSvg
                : ImageString.notificationSvg,
        sideOnPressed: () {
          callNextScreen(context, NotificationScreen());
        },
      ),
      drawer: DrawerWidget(
        currentIndex: currentIndex,
      ),
      body: buildPageView(),
      bottomNavigationBar: EazylifeBottomAppBar(
        onTap: (int currentIndex) {
          setState(() {
            this.currentIndex = currentIndex;
            pageController.animateToPage(currentIndex,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
          });
        },
        currentIndex: currentIndex,
      ),
    );
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: const <Widget>[
        HomeScreen(),
        MyJobsScreen(),
        MessageScreen(),
        MessageScreen(),
      ],
    );
  }
}
