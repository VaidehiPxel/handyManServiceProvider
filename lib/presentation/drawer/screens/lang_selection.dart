import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:flutter_projects/_core/custom_widgets/app_bar.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:sizer/sizer.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String selectedLang = "English";

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      // if (context.locale.toString().compareTo("en") == 0) {
      //   selectedLang = "English";
      // } else if (context.locale.toString().compareTo("fr") == 0) {
      //   selectedLang = "Français";
      // }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: EazylifeAppBar(
        title: AppString.langSelection,
        leadIcon: AppAssets.backIcon,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () async {
                  // if (context.locale.toString().compareTo("fr") == 0) {
                  //   await context.setLocale(Locale('en'));
                  // }
                  setState(() {
                    selectedLang = "English";
                  });
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.sp, vertical: 8.sp),
                  margin: EdgeInsets.symmetric(horizontal: 8.sp),
                  decoration: BoxDecoration(
                    color: AppTheme.lightGrey,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(
                      color: selectedLang == "English"
                          ? AppTheme.blue
                          : AppTheme.lightGrey,
                      width: selectedLang == "English" ? 1.3 : 0,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Text(
                            "English",
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: AppFonts.poppinsMed,
                                fontWeight: FontWeight.bold),
                          )),
                      Expanded(
                        flex: 1,
                        child: Radio(
                          visualDensity: VisualDensity.compact,
                          value: "English",
                          groupValue: selectedLang,
                          onChanged: (value) {
                            setState(() {
                              selectedLang = value.toString();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () async {
                  // if (context.locale.toString().compareTo("en") == 0) {
                  //   await context.setLocale(const Locale('fr'));
                  // }
                  setState(() {
                    selectedLang = "Français";
                  });
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.sp, vertical: 8.sp),
                  margin: EdgeInsets.symmetric(horizontal: 8.sp),
                  decoration: BoxDecoration(
                    color: AppTheme.lightGrey,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(
                      color: selectedLang == "Français"
                          ? AppTheme.blue
                          : AppTheme.lightGrey,
                      width: selectedLang == "Français" ? 1.3 : 0,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Text(
                            "Français",
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: AppFonts.poppinsMed,
                                fontWeight: FontWeight.bold),
                          )),
                      Expanded(
                        flex: 1,
                        child: Radio(
                          visualDensity: VisualDensity.compact,
                          value: "Français",
                          groupValue: selectedLang,
                          onChanged: (value) {
                            setState(() {
                              selectedLang = value.toString();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
