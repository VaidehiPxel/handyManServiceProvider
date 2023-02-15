import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/Navigation.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';
import 'package:flutter_projects/presentation/dashboard/message/screens/chat_detail_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_projects/_core/custom_dialogs/dialog_icon.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JobRequestView extends StatelessWidget {
  final String? appBarTitle;
  const JobRequestView({Key? key, this.appBarTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EazylifeAppBar(
        title: appBarTitle ?? "",
        leadIcon: AppAssets.backIcon,
        onPressed: () {
          Navigator.pop(context);
        },
        sideIcon: null,
      ),
      body: Padding(
        padding: EdgeInsets.all(18.sp),
        child: const RenderBodyView(),
      ),
    );
  }
}

class RenderBodyView extends StatefulWidget {
  const RenderBodyView({super.key});

  @override
  State<RenderBodyView> createState() => _RenderBodyViewState();
}

class _RenderBodyViewState extends State<RenderBodyView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 12.sp,
          ),
          setTitle(),
          SizedBox(
            height: 8.sp,
          ),
          _putDivider(),
          _setDescription(),
          _putDivider(),
          setAddress(),
          _putDivider(),
          setLocation(),
          _putDivider(),
          _setDateTime(),
          SizedBox(
            height: 12.sp,
          ),
          _putDivider(),
          SizedBox(
            height: 1.h,
          ),
          _setAcceptDeclineCTA(context),
          SizedBox(
            height: 8.sp,
          ),
          _setProviderTitle(),
          SizedBox(
            height: 8.sp,
          ),
          _setListOfProvider(),
          SizedBox(
            height: 8.sp,
          ),
        ],
      ),
    );
  }

  Widget _setListOfProvider() {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 1.h,
        );
      },
      itemCount: 3,
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
          child: GestureDetector(
            onTap: () {
              callNextScreen(context, const ChatDetailScreen());
            },
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
        ),
      ],
    );
  }

  Widget _setDateTime() {
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
                      "24 Sep",
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
                      "10:00 PM",
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
          "₹ 799",
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

  Widget setTitle() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sofa Cleaning",
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
              "Lorem ipsum dolor sit amet, adipiscing elit",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: AppTheme.medGrey,
                fontSize: 10.sp,
                fontFamily: AppFonts.poppins,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _setDescription() {
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
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tincidunt leo a neque accumsan posuere. Nullam a purus congue, ultricies sapien vitae, tempus purus\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Ut cidunt leo a neque accumsan posuere.",
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

  setAddress() {
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
          "1231, Paradise Lane, Opp. San Diego, CA 92103",
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

  setLocation() {
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

  // Widget _keyValueRow(String key, String value) {
  //   return Padding(
  //     padding: EdgeInsets.only(bottom: 1.h),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       children: [
  //         Expanded(
  //           flex: 2,
  //           child: Text(
  //             key,
  //             style: TextStyle(
  //                 color: AppTheme.black,
  //                 fontSize: 10.sp,
  //                 fontFamily: AppFonts.poppins),
  //           ),
  //         ),
  //         Expanded(
  //           flex: 2,
  //           child: Text(
  //             value,
  //             style: TextStyle(
  //               color: AppTheme.medGrey,
  //               fontSize: 10.sp,
  //               fontFamily: AppFonts.poppinsMed,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
