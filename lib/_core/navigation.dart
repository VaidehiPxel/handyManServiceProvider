import 'package:flutter/material.dart';

callNextScreen(BuildContext context,Widget screenName){
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => screenName));
}