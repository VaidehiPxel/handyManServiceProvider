
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/application/faq/faq_bloc.dart';
import 'package:flutter_projects/application/signup/signup_bloc.dart';
import 'package:flutter_projects/application/terms/terms_bloc.dart';
import 'package:flutter_projects/services/faq_services.dart';
import 'package:flutter_projects/services/login_services.dart';
import 'package:flutter_projects/services/signup_services.dart';
import 'package:flutter_projects/services/terms_services.dart';
import 'package:sizer/sizer.dart';

import 'application/home/home_bloc.dart';
import 'application/login/login_bloc.dart';
import 'presentation/auth/screens/app_lang_select_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (context) => LoginBloc(loginService: LoginService())),
      BlocProvider(
          create: (context) => SignupBloc(signUpService: SignUpService())),
      BlocProvider(create: (context) => FaqBloc(faqService: FaqService())),
      BlocProvider(
          create: (context) => TermsConditionBloc(
              termsConditionService: TermsConditionService())),
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
        home: const AppLangSelectScreen(),
      );
    });
  }
}


