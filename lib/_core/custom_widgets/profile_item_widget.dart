import 'package:flutter/material.dart';
import 'package:flutter_projects/_core/constants/image_constants.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class ProfileItemWidget extends StatefulWidget {
  final String assetName;
  final String title;
  final Widget? widget;
  final bool withoutBlue;
  final bool isEdit;
  final String value;
  final ProfileItemType profileItemType;
  final List<dynamic>? items;
  const ProfileItemWidget(
      {required super.key,
      required this.assetName,
      required this.title,
      this.widget,
      required this.isEdit,
      required this.value,
      required this.profileItemType,
      this.items,
      this.withoutBlue = false});

  @override
  State<ProfileItemWidget> createState() => _ProfileItemWidgetState();
}

class _ProfileItemWidgetState extends State<ProfileItemWidget> {
  TextEditingController controller = TextEditingController();
  List<dynamic> items = [
    AppString.english,
    AppString.french,
  ];
  String dropdownvalue = 'English';
  DateTime? pickedDate;
  String gender = "";
  @override
  void initState() {
    super.initState();
    print(widget.isEdit);
    Future.delayed(
      Duration(milliseconds: 300),
      () {
        setState(() {
          if (widget.profileItemType == ProfileItemType.Text) {
            controller.clear();
            controller = TextEditingController(text: widget.value);
          }
          if (widget.profileItemType == ProfileItemType.Multiline) {
            controller.clear();
            controller = TextEditingController(text: widget.value);
          }

          if (widget.profileItemType == ProfileItemType.Dropdown) {
            items.clear();
            items.addAll(widget.items!);
            print(items);

            dropdownvalue = widget.value;
          }
          if (widget.profileItemType == ProfileItemType.Date) {
            List date = widget.value.split("/");
            pickedDate = DateTime(
                int.parse(date[2]), int.parse(date[1]), int.parse(date[0]));
          }

          if (widget.profileItemType == ProfileItemType.Gender) {
            gender = widget.value;
            print(gender);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      primary: false,
      padding: EdgeInsets.zero,
      children: [
        Row(
          children: [
            Expanded(
              flex: 0,
              child: Container(
                width: 12.sp,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  shape: BoxShape.rectangle,
                ),
                child: widget.assetName.endsWith(".svg")
                    ? SvgPicture.asset(
                        widget.assetName,
                        color: AppTheme.blue,
                      )
                    : Image.asset(
                        widget.assetName,
                        color: AppTheme.blue,
                      ),
              ),
            ),
            SizedBox(
              width: 2.sp,
            ),
            Expanded(
              flex: 12,
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  widget.title,
                  style: TextStyle(
                    color: AppTheme.messageGrey,
                    fontSize: 10.sp,
                    fontFamily: AppFonts.poppins,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 2.sp,
        ),
        Row(
          children: [
            Expanded(
              flex: 0,
              child: Container(
                width: 12.sp,
                height: 31,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            SizedBox(
              width: 2.sp,
            ),
            if (widget.profileItemType == ProfileItemType.Text)
              Expanded(
                flex: 12,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: widget.isEdit
                      ? TextFormField(
                          controller: controller,
                          decoration: InputDecoration.collapsed(hintText: ""),
                        )
                      : Text(widget.value),
                ),
              ),
            if (widget.profileItemType == ProfileItemType.Multiline)
              Expanded(
                flex: 12,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: widget.isEdit
                      ? TextFormField(
                          controller: controller,
                          minLines: 6,
                          maxLines: 10,
                          decoration: InputDecoration.collapsed(hintText: ""),
                        )
                      : Text(widget.value),
                ),
              ),
            if (widget.profileItemType == ProfileItemType.Dropdown)
              Expanded(
                flex: 12,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: widget.isEdit && items.isNotEmpty
                      ? Center(
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(dividerColor: Colors.transparent),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: true,
                                value: dropdownvalue,
                                isDense: true,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: items.map((items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    dropdownvalue = value!.toString();
                                  });
                                },
                              ),
                            ),
                          ),
                        )
                      : Text(widget.value),
                ),
              ),
            if (widget.profileItemType == ProfileItemType.Date)
              Expanded(
                flex: 12,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: widget.isEdit
                      ? GestureDetector(
                          onTap: () async {
                            await showDatePickers();
                          },
                          child: pickedDate == null
                              ? Text(widget.value)
                              : Text(pickedDate!.toLocal().toString()))
                      : Text(widget.value),
                ),
              ),
            if (widget.profileItemType == ProfileItemType.Gender)
              Expanded(
                flex: 12,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: widget.isEdit
                      ? SizedBox(
                          height: 12.sp,
                          width: 90.w,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio(
                                visualDensity: VisualDensity.compact,
                                value: "Male",
                                groupValue: gender,
                                onChanged: (value) {
                                  print(value);
                                  setState(() {
                                    gender = value.toString();
                                  });
                                },
                              ),
                              Text("Male"),
                              Radio(
                                visualDensity: VisualDensity.compact,
                                value: "Female",
                                groupValue: gender,
                                onChanged: (value) {
                                  print(value);
                                  setState(() {
                                    gender = value.toString();
                                  });
                                },
                              ),
                              Text("Female"),
                            ],
                          ),
                        )
                      : Text(widget.value),
                ),
              ),
            if (widget.profileItemType == ProfileItemType.Upload)
              Expanded(
                flex: 12,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: widget.isEdit
                      ? Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.sp, vertical: 8.sp),
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 8.sp),
                                        decoration: const BoxDecoration(
                                          color: AppTheme.lightBlue,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Choose File",
                                            style: TextStyle(
                                              color: AppTheme.blue,
                                              fontSize: 10.sp,
                                              fontFamily: AppFonts.poppinsMed,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.sp,
                                    ),
                                    Text(
                                      "No file Choosen",
                                      style: TextStyle(
                                        color: AppTheme.black,
                                        fontSize: 8.sp,
                                        fontFamily: AppFonts.poppinsMed,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 4.sp,
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.sp, vertical: 8.sp),
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 8.sp),
                                        decoration: const BoxDecoration(
                                          color: AppTheme.lightBlue,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Choose File",
                                            style: TextStyle(
                                              color: AppTheme.blue,
                                              fontSize: 10.sp,
                                              fontFamily: AppFonts.poppinsMed,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.sp,
                                    ),
                                    Text(
                                      "Upload one or more files",
                                      style: TextStyle(
                                        color: AppTheme.black,
                                        fontSize: 8.sp,
                                        fontFamily: AppFonts.poppinsMed,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      : ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          children: [
                            Row(
                              children: [
                                Image.asset(AppAssets.pdf,
                                height: 3.h,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(widget.value),
                                )
                              ],
                            )
                          ],
                        ),
                ),
              ),
          ],
        ),
        const Divider(
          color: AppTheme.grey,
          thickness: 1,
        ),
      ],
    );
  }

  showDatePickers() async {
    pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(), //get today's date
            firstDate: DateTime(
                2000), //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime(2101))
        .then((value) {
      if (value != null)
        setState(() {
          pickedDate = value!;
        });
    });
  }
}

enum ProfileItemType {
  Text,
  Dropdown,
  Location,
  Date,
  Gender,
  Language,
  Multiline,
  Upload
}
