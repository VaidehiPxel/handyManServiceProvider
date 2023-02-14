import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/_core/constants/app_constants.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/custom_widgets/api_loader.dart';
import 'package:flutter_projects/_core/custom_widgets/job_status_widget.dart';
import 'package:flutter_projects/_core/navigation.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:flutter_projects/application/myJobList/my_job_list_bloc.dart';
import 'package:flutter_projects/model/jobs/my_joblist_model.dart';
import 'package:flutter_projects/presentation/dashboard/myJobs/screen/accepted_job.dart';
import 'package:flutter_projects/presentation/dashboard/myJobs/screen/applied_job.dart';
import 'package:flutter_projects/presentation/dashboard/myJobs/screen/completed_job.dart';

import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class MyJobsScreen extends StatefulWidget {
  const MyJobsScreen({
    super.key,
  });

  @override
  State<MyJobsScreen> createState() => _MyJobsScreenState();
}

class _MyJobsScreenState extends State<MyJobsScreen>
    with TickerProviderStateMixin {
  int currentIndex = 0;
  TabController? _tabController;
  PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  int userId2 = box1.get(AppString.userIdKey);

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
    _pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );

    context
        .read<MyJobListBloc>()
        .add(MyJobListCallApiEvent(userId: userId2, status: "1"));
  }

  @override
  void dispose() {
    _tabController!.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MyJobListBloc, MyJobListState>(
      listener: (context, state) {
        if (state is MyJobListError) {
          ScaffoldMessenger.maybeOf(context)!.showSnackBar(
              SnackBar(content: Text(state.mErrorMsg.toString())));
        }

        if (state is MyJobListSuccess) {
          print("success");
        }
      },
      child: BlocBuilder<MyJobListBloc, MyJobListState>(
        builder: (context, state) {
          return DefaultTabController(
              length: 3,
              initialIndex: currentIndex,
              child: CustomScrollView(slivers: [
                SliverAppBar(
                  floating: true,
                  backgroundColor: Colors.white,
                  pinned: true,
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  foregroundColor: Colors.white,
                  stretch: false,
                  toolbarHeight: 22.w,
                  title: Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(top: 4.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.sp),
                        color: Colors.grey.shade200,
                      ),
                      child: TabBar(
                        unselectedLabelColor: Colors.black38,
                        automaticIndicatorColorAdjustment: false,
                        splashBorderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        isScrollable: false,
                        labelColor: Colors.white,
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 10.sp,
                          fontFamily: AppFonts.poppinsMed,
                        ),
                        unselectedLabelStyle: const TextStyle(
                          color: Colors.white,
                          fontFamily: AppFonts.poppinsMed,
                        ),
                        controller: _tabController,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor: AppTheme.blue,
                        indicator: BoxDecoration(
                          borderRadius: currentIndex == 0
                              ? BorderRadius.only(
                                  bottomLeft: Radius.circular(7.sp),
                                  topLeft: Radius.circular(7.sp),
                                )
                              : currentIndex == 2
                                  ? BorderRadius.only(
                                      bottomRight: Radius.circular(7.sp),
                                      topRight: Radius.circular(7.sp),
                                    )
                                  : BorderRadius.zero,
                          color: AppTheme.blue,
                        ),
                        labelPadding: const EdgeInsets.only(left: 4, right: 4),
                        onTap: (i) {
                          setState(() {
                            currentIndex = i;
                            _pageController.jumpToPage(i);
                            if (currentIndex == 0) {
                              context.read<MyJobListBloc>().add(
                                  MyJobListCallApiEvent(
                                      userId: userId2, status: "1"));
                            } else if (currentIndex == 1) {
                              context.read<MyJobListBloc>().add(
                                  MyJobListCallApiEvent(
                                      userId: 26, status: "3"));
                            } else {
                              context.read<MyJobListBloc>().add(
                                  MyJobListCallApiEvent(
                                      userId: userId2, status: "5"));
                            }
                          });
                        },
                        tabs: const [
                          Tab(
                            text: AppString.acceptedJob,
                          ),
                          Tab(
                            text: AppString.appliedJob,
                          ),
                          Tab(
                            text: AppString.completedJob,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverFillRemaining(
                    child: (state is MyJobsStateLoading)
                        ? (state.isLoading)
                            ? const Center(child: APILoader())
                            : const SizedBox.shrink()
                        : setPageView(state.myJobsModel)),
              ]));
        },
      ),
    );
  }

  Widget setPageView(List<Joblist> myJobListModel) {
    print("jjjj");
    print(myJobListModel.length);
    return PageView(
      controller: _pageController,
      children: [
        setAcceptedJob(myJobListModel),
        setAppliedJob(myJobListModel),
        setCompletedJob(myJobListModel),
      ],
    );
  }

  String getTitle(int currentIndex) {
    if (currentIndex == 0) {
      return AppString.acceptedJob;
    } else if (currentIndex == 1) {
      return AppString.appliedJob;
    } else if (currentIndex == 2) {
      return AppString.completedJob;
    }
    return AppString.acceptedJob;
  }

  setAcceptedJob(List<Joblist> myJobListModel) {
    return myJobListModel.isEmpty
        ? Container(
            child: Center(child: Text("No Accepted Job Found")),
          )
        : ListView.builder(
            itemCount: myJobListModel.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return MyJobListView(
                index: index,
                nextScreen: const AcceptedJobDetail(),
                jobList: myJobListModel,
              );
            },
          );
  }

  setAppliedJob(List<Joblist> myJobListModel) {
    return myJobListModel.isEmpty
        ? Container(
            child: Center(child: Text("No Applied Job Found")),
          )
        : ListView.builder(
            itemCount: myJobListModel.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return MyJobListView(
                index: index,
                nextScreen: const AcceptedJobDetail(),
                jobList: myJobListModel,
              );
            },
          );
  }

  setCompletedJob(List<Joblist> myJobListModel) {
    return myJobListModel.isEmpty
        ? Container(
            child: Center(child: Text("No Completed Job Found")),
          )
        : ListView.builder(
            itemCount: myJobListModel.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return MyJobListView(
                index: index,
                nextScreen: const AcceptedJobDetail(),
                jobList: myJobListModel,
              );
            },
          );
  }
}

class MyJobListView extends StatelessWidget {
  final int index;
  final Widget nextScreen;
  final List<Joblist> jobList;
  const MyJobListView({
    required this.index,
    required this.nextScreen,
    required this.jobList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("kkkkk");
    print(nextScreen);
    return GestureDetector(
      onTap: () {
        callNextScreen(context, nextScreen);
      },
      child: Container(
        //padding: const EdgeInsets.only(top: 12),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppTheme.lightGrey,
          borderRadius: BorderRadius.circular(18),
          shape: BoxShape.rectangle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  ClipOval(
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(18.sp), // Image radius
                      child: Image.network(
                          "https://picsum.photos/id/237/200/300",
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.sp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sofa Cleaning",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontFamily: AppFonts.poppins,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet,.....",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 10.sp,
                            fontFamily: AppFonts.poppins,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        EazyLifeJobStatusWidget(
                          fontSize: 8.sp,
                          size: 2.5,
                          status: nextScreen.toString().contains("Applied")
                              ? EazyLifeJobStatus.Applied
                              : nextScreen.toString().contains("Completed")
                                  ? EazyLifeJobStatus.Completed
                                  : EazyLifeJobStatus.Accepted,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.calSvg),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        "24 Sep",
                        style: TextStyle(
                          color: AppTheme.messageGrey,
                          fontSize: 10.sp,
                          fontFamily: AppFonts.poppins,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.time),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        "60 mins",
                        style: TextStyle(
                          color: AppTheme.messageGrey,
                          fontSize: 10.sp,
                          fontFamily: AppFonts.poppins,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
