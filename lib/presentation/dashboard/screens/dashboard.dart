import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/Navigation.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';
import 'package:flutter_projects/presentation/dashboard/home/screens/home_screen.dart';
import 'package:flutter_projects/presentation/dashboard/message/screens/message_screen.dart';
import 'package:flutter_projects/presentation/dashboard/myJobs/screen/my_jobs_screen.dart';
import 'package:flutter_projects/presentation/dashboard/notification/screen/notification_screen.dart';
import 'package:flutter_projects/presentation/dashboard/profile/screens/profile_screen.dart';
import 'package:flutter_projects/presentation/dashboard/screens/bottom_appbar.dart';
import 'package:flutter_projects/presentation/drawer/drawer_widget.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();

    print("fhdghf");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: EazylifeAppBar(
        title: currentIndex == 0
            ? AppString.welcome
            : currentIndex == 1
                ? AppString.myJobs
                : currentIndex == 2
                    ? AppString.message
                    : AppString.profile,
        leadIcon: AppAssets.humBurgerSvg,
        sideIcon: currentIndex == 1
            ? AppAssets.filter
            : currentIndex == 2
                ? AppAssets.searchSvg
                : AppAssets.notificationSvg,
        sideOnPressed: () {
          callNextScreen(context, const NotificationScreen());
        },
      ),
      drawer: DrawerWidget(
        currentIndex: currentIndex,
      ),
      body: buildPageView(),
      bottomNavigationBar: EazylifeBottomAppBar(
        onTap: (int currentIndex) {
          setState(() {
            print(currentIndex);
            this.currentIndex = currentIndex;
            pageController.jumpToPage(currentIndex);
            // pageController.animateToPage(currentIndex,
            //     duration: const Duration(milliseconds: 500),
            //     curve: Curves.ease);
          });
        },
        currentIndex: currentIndex,
      ),
    );
  }

  PageController pageController = PageController(
    initialPage: 0,
  );

  Widget buildPageView() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: const [
        HomeScreen(),
        MyJobsScreen(),
        MessageScreen(),
        ProfileScreen(),
      ],
    );
  }
}
