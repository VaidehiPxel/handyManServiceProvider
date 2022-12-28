
import 'package:flutter/material.dart';
import 'package:flutter_projects/presentation/auth/constants/image_constant.dart';
import 'package:flutter_projects/presentation/home/constants/image_constant.dart';
import 'package:flutter_projects/presentation/home/constants/string_constant.dart';
import 'package:flutter_projects/presentation/home/screens/bottom_appbar.dart';
import 'package:flutter_projects/presentation/home/widget/blue_box_text.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(HomeString.welcome),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Image.asset(HomeAsset.notification),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        }),
        actions: [
          IconButton(
              onPressed: () {}, icon: Image.asset(HomeAsset.notifications))
        ],
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width - 60,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: kToolbarHeight,
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
              },
              trailing: const Icon(Icons.close),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  flex: 1,
                  child: CircleAvatar(
                    radius: 30,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: ListTile(
                    title: const Text('Item 1'),
                    subtitle: const Text('Item 1'),
                    onTap: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: kToolbarHeight,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlueBoxText(
                showBold: true,
                text: HomeString.tandc,
                onTap: () {},
                showBlueBox: currentIndex == 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlueBoxText(
                showBold: true,
                text: HomeString.faqs,
                onTap: () {},
                showBlueBox: currentIndex == 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlueBoxText(
                showBold: true,
                text: HomeString.help,
                onTap: () {},
                showBlueBox: currentIndex == 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlueBoxText(
                showBold: true,
                text: HomeString.complaint,
                onTap: () {},
                showBlueBox: currentIndex == 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlueBoxText(
                showBold: true,
                text: HomeString.logOut,
                onTap: () {},
                showBlueBox: currentIndex == 4,
              ),
            ),
          ],
        ),
      ),
      body:  ClipPath(
        clipper: CustomClipperPath(),
        child: Container(
          height: 350,
          width: MediaQuery.of(context).size.width,
         margin: const EdgeInsets.only(bottom: 110),
          decoration: BoxDecoration(
            color: Colors.blue.shade700,
            borderRadius: BorderRadius.circular(0),
            shape: BoxShape.rectangle,
            image: const DecorationImage(
              image: AssetImage(AuthImageString.appBg),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ), //HomeScreenWidget(),
      bottomNavigationBar: EazylifeBottomAppBar(
        onTap: (int currentIndex) {
          setState(() {
            this.currentIndex = currentIndex;
          });
        },
        currentIndex: currentIndex,
      ),

    );
  }
}
class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: CustomClipperPath(),
                child: Container(
                  height: 350,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(bottom: 110),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade700,
                    borderRadius: BorderRadius.circular(0),
                    shape: BoxShape.rectangle,
                    image: const DecorationImage(
                      image: AssetImage(AuthImageString.appBg),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: kToolbarHeight + kToolbarHeight + 10,
                  ),
                  Container(
                    height: 60,
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      shape: BoxShape.rectangle,
                    ),
                    child: Center(
                      child: TextFormField(
                        maxLines: 1,
                        enableIMEPersonalizedLearning: true,
                        enableSuggestions: true,
                        decoration: InputDecoration(
                          suffixIcon: Image.asset("AppAssets.search"),
                          border: InputBorder.none,
                          hintText: "searchText",
                          contentPadding: const EdgeInsets.all(14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Container(
                  height: 240,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(16),
                    shape: BoxShape.rectangle,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 170,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      10,
                          (index) => Container(
                        width: 130,
                        height: 170,
                        margin: const EdgeInsets.only(right: 8),

                        child: Container(
                          width: 130,
                          height: 170,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              shape: BoxShape.rectangle,
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                stops: [0, 1],
                                colors: [
                                  Colors.black54,
                                  Colors.black12.withOpacity(0),
                                ],
                              )),

                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "offer",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 170,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      10,
                          (index) => Container(
                        width: 130,
                        height: 170,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image: AssetImage(""),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          width: 130,
                          height: 170,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              shape: BoxShape.rectangle,
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                stops: [0, 1],
                                colors: [
                                  Colors.black54,
                                  Colors.black12.withOpacity(0),
                                ],
                              )),
                          child: const Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "services",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: kToolbarHeight * 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
