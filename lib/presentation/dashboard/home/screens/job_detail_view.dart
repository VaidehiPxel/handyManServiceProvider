import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/constants/utils.dart';
import 'package:flutter_projects/_core/custom_widgets/api_loader.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';
import 'package:flutter_projects/_core/custom_widgets/grey_textField.dart';
import 'package:flutter_projects/application/jobDetail/job_detail_bloc.dart';
import 'package:flutter_projects/application/jobDetail/job_detail_event.dart';
import 'package:flutter_projects/application/jobDetail/job_detail_state.dart';
import 'package:flutter_projects/model/jobs/job_detail_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_projects/_core/custom_dialogs/dialog_icon.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JobDetailView extends StatefulWidget {
  final String appBarTitle;
  final int jobId;
  const JobDetailView(
      {Key? key, required this.appBarTitle, required this.jobId})
      : super(key: key);

  @override
  State<JobDetailView> createState() => _JobDetailViewState();
}

class _JobDetailViewState extends State<JobDetailView> {
  @override
  void initState() {
    super.initState();
    context
        .read<JobDetailBloc>()
        .add(JobDetailCallApiEvent(jobId: widget.jobId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<JobDetailBloc, JobDetailState>(
      listener: (context, state) {
        if (state is JobDetailError) {
          ScaffoldMessenger.maybeOf(context)!.showSnackBar(
              SnackBar(content: Text(state.mErrorMsg.toString())));
        }

        if (state is BidUpdateSuccess) {
          ScaffoldMessenger.maybeOf(context)!
              .showSnackBar(const SnackBar(content: Text("Bid Updated")));
        }
        if (state is BidRemoveSuccess) {
          ScaffoldMessenger.maybeOf(context)!
              .showSnackBar(const SnackBar(content: Text("Bid Remove")));
        }
      },
      child: BlocBuilder<JobDetailBloc, JobDetailState>(
        builder: (context, state) {
          return Scaffold(
            appBar: EazylifeAppBar(
              title: widget.appBarTitle,
              leadIcon: AppAssets.backIcon,
              onPressed: () {
                Navigator.pop(context);
              },
              sideIcon: null,
            ),
            body: state is JobDetailLoading == true
                ? const APILoader()
                : (state is JobDetailLoading == false &&
                        (state is JobDetailSuccess))
                    ? RenderBodyView(
                        detail: state.jobDetailModel,
                        state: state,
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                        backgroundColor: AppTheme.lightBlue,
                      )),
          );
        },
      ),
    );
  }
}

class RenderBodyView extends StatefulWidget {
  const RenderBodyView({super.key, required this.detail, required this.state});
  final GetJobDetailModel detail;
  final JobDetailState state;

  @override
  State<RenderBodyView> createState() => _RenderBodyViewState();
}

class _RenderBodyViewState extends State<RenderBodyView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  bool isUpdate = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12.sp,
            ),
            setTitle(widget.detail),
            SizedBox(
              height: 8.sp,
            ),
            _putDivider(),
            _setDescription(widget.detail),
            _putDivider(),
            setAddress(widget.detail),
            _putDivider(),
            setLocation(widget.detail),
            _putDivider(),
            _setDateTime(widget.detail),
            SizedBox(
              height: 12.sp,
            ),
            _putDivider(),
            SizedBox(
              height: 1.h,
            ),
            _setProviderTitle(),
            SizedBox(
              height: 8.sp,
            ),
            if (widget.detail.jobsAppliedServiceProviders.length < 0)
              Container()
            else
              _setListOfProvider(widget.detail.jobsAppliedServiceProviders),
            SizedBox(
              height: 8.sp,
            ),
            isUpdate
                ? _setUpdateBid(widget.detail, widget.state)
                : _setEnterBid(),
            SizedBox(
              height: 3.h,
            ),
            isUpdate ? _setListOfBidTitle() : Container(),
            SizedBox(
              height: 2.h,
            ),
            //  isUpdate ? _setListOfProvider() : Container(),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget _setListOfProvider(List jobsAppliedServiceProviders) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 1.h,
        );
      },
      itemCount: jobsAppliedServiceProviders.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppTheme.lightGrey,
                borderRadius: BorderRadius.circular(7.sp),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.sp),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(),
                    SizedBox(
                      width: 3.w,
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Abhithi Maheshvari",
                                softWrap: true,
                                style: TextStyle(
                                  color: AppTheme.black,
                                  fontSize: 12.sp,
                                  fontFamily: AppFonts.poppinsSemiBold,
                                ),
                              ),
                              Text(
                                "Bathroom Cleaning",
                                style: TextStyle(
                                  color: AppTheme.messageGrey,
                                  fontSize: 10.sp,
                                  fontFamily: AppFonts.poppins,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              AppString.quotationAmount,
                              style: TextStyle(
                                color: AppTheme.black,
                                fontSize: 7.sp,
                                fontFamily: AppFonts.poppinsMed,
                              ),
                            ),
                            Text(
                              "₹ 799",
                              style: TextStyle(
                                color: AppTheme.blue,
                                fontSize: 14.sp,
                                fontFamily: AppFonts.poppinsSemiBold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "1 hr ago",
                style: TextStyle(
                  color: AppTheme.medGrey,
                  fontSize: 8.sp,
                  fontFamily: AppFonts.poppinsMed,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _setListOfBidTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppString.listOfBids,
          style: TextStyle(
            color: Colors.black,
            fontSize: 13.sp,
            fontFamily: AppFonts.poppinsSemiBold,
          ),
        ),
        Text(
          AppString.viewAll,
          style: TextStyle(
            color: AppTheme.blue,
            fontSize: 10.sp,
            fontFamily: AppFonts.poppinsMed,
          ),
        ),
      ],
    );
  }

  Widget _setProviderTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppString.listOfServiceProvider,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
            fontFamily: AppFonts.poppinsSemiBold,
          ),
        ),
        Text(
          AppString.viewAll,
          style: TextStyle(
            color: AppTheme.blue,
            fontSize: 10.sp,
            fontFamily: AppFonts.poppinsMed,
          ),
        ),
      ],
    );
  }

  Widget _setEnterBid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.yourBid,
          style: TextStyle(
            color: Colors.black,
            fontSize: 13.sp,
            fontFamily: AppFonts.poppinsSemiBold,
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Row(
          children: [
            const Expanded(
              flex: 4,
              child: GreyTextField(
                hintText: "Enter Amount",
              ),
            ),
            SizedBox(
              width: 2.w,
            ),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.blue,
                  minimumSize: const Size.fromHeight(40),
                  elevation: 0,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  setState(() {
                    isUpdate = true;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
                  child: Text(
                    AppString.bid,
                    style: TextStyle(
                        color: AppTheme.white,
                        fontSize: 14.sp,
                        fontFamily: AppFonts.poppinsMed),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _setUpdateBid(
    GetJobDetailModel detail,
    JobDetailState state,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.bidInfo,
          style: TextStyle(
            color: Colors.black,
            fontSize: 13.sp,
            fontFamily: AppFonts.poppinsSemiBold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              softWrap: true,
              maxLines: 2,
              textScaleFactor: 1,
              text: TextSpan(
                text: AppString.myBidPosition,
                style: TextStyle(
                    color: AppTheme.medGrey,
                    fontFamily: AppFonts.poppinsMed,
                    fontSize: 10.sp),
                children: <TextSpan>[
                  TextSpan(
                      text: "# 20",
                      style: TextStyle(
                          color: AppTheme.blue,
                          fontFamily: AppFonts.poppinsMed,
                          fontSize: 10.sp)),
                ],
              ),
            ),
            SizedBox(
              width: 4.w,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return DialogBoxWithIcon(
                        icon: AppAssets.delete,
                        content: Text(
                          AppString.removeYourBid,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppTheme.black,
                              fontFamily: AppFonts.poppins,
                              fontWeight: FontWeight.normal,
                              fontSize: 10.sp),
                        ),
                        iconColor: AppTheme.red,
                        onCancelPressed: () {
                          Navigator.of(context)
                            ..pop()
                            ..pop();
                        },
                        onOkPressed: () {
                          Navigator.of(context)..pop();
                          context.read<JobDetailBloc>().add(BidRemoveApiEvent(
                                jobId: detail.result[0].id,
                                userId: detail.result[0].userId,
                              ));
                        },
                        title: AppString.areYouSure,
                        titleNo: "Cancel",
                        titleYes: "Remove",
                        colorNo: AppTheme.black,
                        colorYes: AppTheme.white,
                        colorYesBtn: AppTheme.red,
                        sizeNo: 10.sp,
                        titleFamily: AppFonts.poppinsMed,
                      );
                    });
              },
              child: Row(
                children: [
                  SvgPicture.asset(AppAssets.delete),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    AppString.remove,
                    style: TextStyle(
                      color: AppTheme.red,
                      fontSize: 11.sp,
                      fontFamily: AppFonts.poppinsMed,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        Row(
          children: [
            const Expanded(
              flex: 4,
              child: GreyTextField(
                hintText: "\$ 290.00",
              ),
            ),
            SizedBox(
              width: 2.w,
            ),
            Expanded(
              flex: 2,
              child: state is BidUpdateLoading == true
                  ? const APILoader()
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.blue,
                        minimumSize: const Size.fromHeight(40),
                        elevation: 0,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {
                        print("hhhhhh");
                        print(state);
                        context.read<JobDetailBloc>().add(BidUpdateApiEvent(
                            jobId: detail.result[0].id,
                            userId: detail.result[0].userId,
                            amount: "0"));
                        print(state);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.w, vertical: 0.h),
                        child: Text(
                          AppString.update,
                          style: TextStyle(
                              color: AppTheme.white,
                              fontSize: 14.sp,
                              fontFamily: AppFonts.poppinsMed),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _setAcceptDeclineCTA(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.lightGrey,
                  minimumSize: const Size.fromHeight(40),
                  elevation: 0,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DialogBoxWithIcon(
                          icon: AppAssets.save,
                          content: Text(
                            AppString.decline,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppTheme.black,
                                fontFamily: AppFonts.poppins,
                                fontWeight: FontWeight.normal,
                                fontSize: 10.sp),
                          ),
                          iconColor: AppTheme.dialogGreen,
                          onCancelPressed: () {
                            Navigator.of(context)
                              ..pop()
                              ..pop();
                          },
                          onOkPressed: () {
                            Navigator.of(context).pop();
                          },
                          title: AppString.applied,
                          titleNo: AppString.apply,
                          titleYes: AppString.done,
                          colorNo: AppTheme.black,
                          colorYes: AppTheme.white,
                          sizeNo: 10.sp,
                          titleFamily: AppFonts.poppinsMed,
                        );
                      });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
                  child: Text(
                    AppString.decline,
                    style: TextStyle(
                        color: AppTheme.medGrey,
                        fontSize: 14.sp,
                        fontFamily: AppFonts.poppinsMed),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 4.w,
            ),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.blue,
                  minimumSize: const Size.fromHeight(40),
                  elevation: 0,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DialogBoxWithIcon(
                          icon: AppAssets.save,
                          content: Text(
                            AppString.youAccept,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppTheme.black,
                                fontFamily: AppFonts.poppins,
                                fontSize: 10.sp),
                          ),
                          iconColor: AppTheme.dialogGreen,
                          onCancelPressed: () {
                            Navigator.of(context)
                              ..pop()
                              ..pop();
                          },
                          onOkPressed: () {
                            Navigator.of(context).pop();
                          },
                          title: AppString.cong,
                          titleNo: AppString.cancel,
                          titleYes: AppString.startWork,
                          colorNo: AppTheme.black,
                          colorYes: AppTheme.white,
                          sizeNo: 10.sp,
                          titleFamily: AppFonts.poppinsMed,
                        );
                      });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
                  child: Text(
                    AppString.accept,
                    style: TextStyle(
                        color: AppTheme.white,
                        fontSize: 14.sp,
                        fontFamily: AppFonts.poppinsMed),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 0.7.h,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AppAssets.chat),
              SizedBox(
                width: 2.w,
              ),
              Text(
                AppString.chatNow,
                style: TextStyle(
                  color: AppTheme.blue,
                  fontSize: 11.sp,
                  fontFamily: AppFonts.poppinsMed,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _setDateTime(GetJobDetailModel detail) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppString.date,
                  style: TextStyle(
                    color: AppTheme.black,
                    fontSize: 12.sp,
                    fontFamily: AppFonts.poppinsSemiBold,
                  ),
                ),
                SizedBox(
                  height: 0.7.h,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0, right: 8),
                      child: SvgPicture.asset(
                        AppAssets.calSvg,
                        height: 10.sp,
                        width: 10.sp,
                      ),
                    ),
                    Text(
                      detail.result[0].jobdate.formatDate(),
                      style: TextStyle(
                        color: AppTheme.medGrey,
                        fontSize: 10.sp,
                        fontFamily: AppFonts.poppins,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              width: 4.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppString.time,
                  style: TextStyle(
                    color: AppTheme.black,
                    fontSize: 12.sp,
                    fontFamily: AppFonts.poppinsSemiBold,
                  ),
                ),
                SizedBox(
                  height: 0.7.h,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0, right: 8),
                      child: SvgPicture.asset(
                        AppAssets.time,
                        height: 10.sp,
                        width: 10.sp,
                      ),
                    ),
                    Text(
                      detail.result[0].jobtime.toString(),
                      style: TextStyle(
                        color: AppTheme.medGrey,
                        fontSize: 10.sp,
                        fontFamily: AppFonts.poppins,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        Text(
          detail.result[0].amount == null
              ? '0.0'
              : "£${detail.result[0].amount}",
          textAlign: TextAlign.end,
          style: TextStyle(
            color: AppTheme.black,
            fontSize: 14.sp,
            fontFamily: AppFonts.poppinsSemiBold,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Divider _putDivider() {
    return const Divider(
      color: AppTheme.grey,
      thickness: 1,
    );
  }

  Widget setTitle(GetJobDetailModel detail) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              detail.result[0].title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.sp,
                fontFamily: AppFonts.poppinsSemiBold,
              ),
            ),
            SizedBox(
              height: 2.sp,
            ),
            // Text(
            //   "Lorem ipsum dolor sit amet, adipiscing elit",
            //   textAlign: TextAlign.justify,
            //   style: TextStyle(
            //     color: AppTheme.medGrey,
            //     fontSize: 10.sp,
            //     fontFamily: AppFonts.poppins,
            //   ),
            // ),
          ],
        ),
      ],
    );
  }

  Widget _setDescription(GetJobDetailModel detail) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 8.sp,
        ),
        Text(
          AppString.description,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
            fontFamily: AppFonts.poppinsSemiBold,
          ),
        ),
        SizedBox(
          height: 2.sp,
        ),
        Text(
          detail.result[0].description,
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: AppTheme.medGrey,
            fontSize: 10.sp,
            fontFamily: AppFonts.poppins,
          ),
        ),
        SizedBox(
          height: 8.sp,
        ),
      ],
    );
  }

  setAddress(GetJobDetailModel detail) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 8.sp,
        ),
        Text(
          AppString.address,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
            fontFamily: AppFonts.poppinsSemiBold,
          ),
        ),
        SizedBox(
          height: 2.sp,
        ),
        Text(
          detail.result[0].address1 +
              detail.result[0].address2 +
              "," +
              detail.result[0].city +
              "," +
              detail.result[0].state +
              "," +
              detail.result[0].country +
              " " +
              detail.result[0].pincode,
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: AppTheme.medGrey,
            fontSize: 10.sp,
            fontFamily: AppFonts.poppins,
          ),
        ),
        SizedBox(
          height: 8.sp,
        ),
      ],
    );
  }

  setLocation(GetJobDetailModel detail) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 8.sp,
        ),
        Text(
          AppString.locationMap,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
            fontFamily: AppFonts.poppinsSemiBold,
          ),
        ),
        SizedBox(
          height: 2.sp,
        ),
        Container(
          height: 16.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.sp),
          ),
          child: GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            initialCameraPosition: const CameraPosition(
              target: LatLng(37.43296265331129, -122.08832357078792),
              zoom: 11.0,
            ),
          ),
        ),
        SizedBox(
          height: 8.sp,
        ),
      ],
    );
  }

  Widget _cancelApplication() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.cancelTheApplication,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
            fontFamily: AppFonts.poppinsSemiBold,
          ),
        ),
        SizedBox(
          height: 1.5.h,
        ),
        _keyValueRow(AppString.status, "Payment Requested"),
        _keyValueRow(AppString.amountInEscrow, "₹ 199"),
        _keyValueRow(AppString.originalAmount, "₹ 199"),
        _keyValueRow(AppString.amountRequested, "₹ 399"),
        SizedBox(
          height: 1.5.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return DialogBoxWithIcon(
                      icon: AppAssets.cancel,
                      content: Text(
                        AppString.youCancelThisApplication,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppTheme.black,
                            fontFamily: AppFonts.poppins,
                            fontSize: 10.sp),
                      ),
                      onCancelPressed: () {
                        Navigator.of(context)
                          ..pop()
                          ..pop();
                      },
                      onOkPressed: () {
                        Navigator.of(context).pop();
                      },
                      title: "Cancel Application",
                      titleYes: "Done",
                      colorYes: AppTheme.white,
                      sizeNo: 10.sp,
                      titleFamily: AppFonts.poppinsMed,
                    );
                  });
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(8.sp),
              decoration: BoxDecoration(
                color: AppTheme.lightRed,
                borderRadius: BorderRadius.circular(4.sp),
              ),
              child: Center(
                child: Text(
                  AppString.cancelApplication,
                  style: TextStyle(
                      color: AppTheme.red,
                      fontSize: 14.sp,
                      fontFamily: AppFonts.poppinsMed),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _keyValueRow(String key, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              key,
              style: TextStyle(
                  color: AppTheme.black,
                  fontSize: 10.sp,
                  fontFamily: AppFonts.poppins),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value,
              style: TextStyle(
                color: AppTheme.medGrey,
                fontSize: 10.sp,
                fontFamily: AppFonts.poppinsMed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
