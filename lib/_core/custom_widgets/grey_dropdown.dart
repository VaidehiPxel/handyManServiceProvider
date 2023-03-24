// import 'package:flutter/material.dart';
// import 'package:flutter_projects/_core/constants/app_string.g.dart';
// import 'package:flutter_projects/_core/custom_widgets/eazylife_widget.dart';
// import 'package:sizer/sizer.dart';

// import 'package:flutter_projects/_core/utils/theme_config.dart';

// class GreyDropDown extends StatelessWidget {
//   final String hintText;
//   final String? fontFamily;
//   final double? height;
//   final TextEditingController? controller;
//   const GreyDropDown(
//       {Key? key,
//       required this.hintText,
//       this.fontFamily,
//       this.height,
//       this.controller})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return   EazyLifeWidget(
//               title: LocaleKeys.selectUser,
//               widget: Container(
//                 height:height ?? 5.5.h,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFF6F6F6),
//                   borderRadius: BorderRadius.circular(5.h),
//                   shape: BoxShape.rectangle,
//                 ),
//                 child: Center(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Theme(
//                       data: Theme.of(context)
//                           .copyWith(dividerColor: Colors.transparent),
//                       child: DropdownButtonHideUnderline(
//                         child: DropdownButton(
//                           isExpanded: true,
//                           value: dropdownvalue,
//                           icon: const Icon(Icons.keyboard_arrow_down),
//                           items: items.map((String items) {
//                             return DropdownMenuItem(
//                               value: items,
//                               child: Text(items),
//                             );
//                           }).toList(),
//                           onChanged: (value) {
//                             setState(() {
//                               dropdownvalue = value!;
//                             });
//                           },
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ), }
// }
