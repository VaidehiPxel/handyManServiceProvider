import 'package:flutter/material.dart';
import 'package:flutter_projects/presentation/auth/constants/image_constant.dart';
import 'package:flutter_projects/presentation/auth/constants/string_constant.dart';
import 'package:flutter_projects/presentation/auth/widget/app_bg_widget.dart';



class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2.6,
            child: AppBGWidget(body: Image.asset(AuthImageString.appLogo)),
          ),
          ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
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
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      const Center(
                        child: Text(
                          AuthString.forgetPassword,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            AuthString.sublogin,
                            maxLines: 2,
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      Theme(
                        data: ThemeData(primaryColor: Colors.blue),
                        child: TextFormField(
                          style: const TextStyle(
                            color: Colors.blue,
                          ),
                          decoration: InputDecoration(
                            labelText: AuthString.newPassword,
                            focusColor: Colors.blue,
                            labelStyle: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                            prefixIcon: Image.asset(AuthImageString.password),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              child: Icon(
                                obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                          obscureText: obscureText,
                        ),
                      ),
                      Theme(
                        data: ThemeData(primaryColor: Colors.blue),
                        child: TextFormField(
                          style: const TextStyle(
                            color: Colors.blue,
                          ),
                          decoration: InputDecoration(
                            labelText: AuthString.confirmPassword,
                            focusColor: Colors.blue,
                            labelStyle: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                            prefixIcon: Image.asset(AuthImageString.password),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              child: Icon(
                                obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                          obscureText: obscureText,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60, right: 60),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(18.0),
                            child: Text(
                              AuthString.save,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
