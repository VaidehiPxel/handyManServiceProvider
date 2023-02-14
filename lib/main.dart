import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/_core/constants/app_constants.dart';
import 'package:flutter_projects/_core/constants/string_constants.dart';
import 'package:flutter_projects/application/auth/auth_bloc.dart';
import 'package:flutter_projects/application/dashboard/dashboard_bloc.dart';
import 'package:flutter_projects/application/faq/faq_bloc.dart';
import 'package:flutter_projects/application/jobDetail/job_detail_bloc.dart';
import 'package:flutter_projects/application/myJobList/my_job_list_bloc.dart';
import 'package:flutter_projects/application/signup/signup_bloc.dart';
import 'package:flutter_projects/application/terms/terms_bloc.dart';
import 'package:flutter_projects/presentation/dashboard/screens/dashboard.dart';
import 'package:flutter_projects/services/auth_service.dart';
import 'package:flutter_projects/services/dashboard_service.dart';
import 'package:flutter_projects/services/faq_services.dart';
import 'package:flutter_projects/services/job_detail_service.dart';
import 'package:flutter_projects/services/login_services.dart';
import 'package:flutter_projects/services/my_job_service.dart';
import 'package:flutter_projects/services/signup_services.dart';
import 'package:flutter_projects/services/terms_services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sizer/sizer.dart';

import 'application/home/home_bloc.dart';
import 'application/login/login_bloc.dart';
import 'presentation/auth/screens/app_lang_select_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  createBox();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (context) => LoginBloc(loginService: LoginService())),
      BlocProvider(create: (context) => AuthBloc(authService: AuthService())),
      BlocProvider(
          create: (context) => SignupBloc(signUpService: SignUpService())),
      BlocProvider(create: (context) => FaqBloc(faqService: FaqService())),
      BlocProvider(
          create: (context) => TermsConditionBloc(
              termsConditionService: TermsConditionService())),
      BlocProvider(
          create: (context) =>
              DashboardBloc(dashboardService: DashboardService())),
      BlocProvider(
          create: (context) =>
              JobDetailBloc(jobDetailService: JobDetailService())),
      BlocProvider(
          create: (context) => MyJobListBloc(myJobService: MyJobService())),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        // localizationsDelegates: context.localizationDelegates,
        // supportedLocales: context.supportedLocales,
        // locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: returnScreen(),
      );
    });
  }

  returnScreen() {
    // if (box1.get(AppString.userIdKey) != null) {
    //   return const AppLangSelectScreen();
    // } else {
    //   return const DashBoard();
    // }
    return const AppLangSelectScreen();
  }
}
