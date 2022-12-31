import 'package:flutter/material.dart';
import 'package:flutter_projects/presentation/home/screens/dashboard.dart';
import 'package:flutter_projects/presentation/home/screens/home_Screen.dart';
import 'package:flutter_projects/presentation/home/screens/message_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'HandyManServiceProvider',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const DashBoard(),
      );
    });
  }
}
