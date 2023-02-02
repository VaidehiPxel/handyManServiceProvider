import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_projects/_core/utils/theme_config.dart';

class APILoader extends StatefulWidget {
  const APILoader({super.key});

  @override
  State<APILoader> createState() => _APILoaderState();
}

class _APILoaderState extends State<APILoader> {
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      backgroundColor: AppTheme.lightBlue,
    ));
  }
}
