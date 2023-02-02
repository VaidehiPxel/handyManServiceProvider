import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CustomClipperPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, h * 0.60060000);
    path.quadraticBezierTo(w * 0.5019222, h * 0.8974000, w, h * 0.5979800);
    path.quadraticBezierTo(w, h * 0.4484850, w, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

enum JobType { jobRequest, newJob }

late Box box1;

void createBox() async {
  box1 = await Hive.openBox('database1');
}
