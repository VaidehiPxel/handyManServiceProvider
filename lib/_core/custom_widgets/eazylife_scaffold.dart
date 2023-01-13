import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/presentation/auth/widget/app_bg_widget.dart';
import 'package:sizer/sizer.dart';



class EazylifeScaffold extends StatefulWidget {
  final List<Widget> children;
  const EazylifeScaffold({super.key, required this.children});

  @override
  State<EazylifeScaffold> createState() => _EazylifeScaffoldState();
}

class _EazylifeScaffoldState extends State<EazylifeScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 45.h,
                  child: AppBGWidget(
                      body: Center(
                        child: Image.asset(
                          AppAssets.appLogo,
                          height: 13.h,
                        ),
                      )),
                ),
                ListView(
                  shrinkWrap: true,
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(55.0),
                            topRight: Radius.circular(55.0)),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          primary: false,
                          shrinkWrap: true,
                          children: widget.children,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}