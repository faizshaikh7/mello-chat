// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mello_chat/screens/auth/auth_screen.dart';
import 'package:mello_chat/utils/colors.dart';
// import 'package:mello_chat/screens/onboard/onboard_screen_data.dart';

class OnboardScreen extends StatefulWidget {
  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int slideIndex = 0;
  late PageController controller;

  List<String> desc = [
    "All your conversations and file's are securely stored in the cloud, which means you can access them from any device, anytime, anywhere.",
    "Stay connected with your loved ones no matter where you are in the world. You can even make group calls with up to 10 people at once.",
    "We prioritize your privacy and safety. Ensuring only you and the recipient can read your messages. so you can chat with peace"
  ];

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: isCurrentPage ? 8 : 6.0,
      width: isCurrentPage ? 8 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? buttonColor : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // mySLides = getSlides();
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            // TODO: Remove this SingleChildScrollView After resolving this
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int i = 0; i < 3; i++)
                          i == slideIndex
                              ? _buildPageIndicator(true)
                              : _buildPageIndicator(false),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 100,
                    child: PageView(
                      controller: controller,
                      onPageChanged: (index) {
                        setState(() {
                          slideIndex = index;
                        });
                      },
                      children: [
                        SlideTile(
                          imagePath: "assets/images/mockup1.png",
                          title: "Cloud based messaging",
                        ),
                        SlideTile(
                          imagePath: "assets/images/mockup2.png",
                          title: "Voice and video calling",
                        ),
                        SlideTile(
                          imagePath: "assets/images/mockup3.png",
                          title: "Top-notch Security",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomSheet: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: const BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                desc[slideIndex],
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              const Divider(),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      controller.animateToPage(2,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.linear);
                    },
                    // splashColor: Colors.blue[50],
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(90, 50),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: slideIndex != 2
                        ? () {
                            print("this is slideIndex: $slideIndex");
                            controller.animateToPage(slideIndex + 1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.linear);
                          }
                        : () {
                            print("Get Started Now");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const AuthenticationScreen(),
                              ),
                            );
                          },
                    // splashColor: Colors.blue[50],
                    child: Text(slideIndex != 2 ? "Next" : "Continue"),
                  ),
                ],
              ),
            ],
          ),
        )
        // : InkWell(
        //     onTap: () {
        //       print("Get Started Now");
        //     },
        //     child: Container(
        //       height: Platform.isIOS ? 70 : 60,
        //       color: buttonColor,
        //       alignment: Alignment.center,
        //       child: const Text(
        //         "GET STARTED NOW",
        //         style: TextStyle(
        //             color: Colors.white, fontWeight: FontWeight.w600),
        //       ),
        //     ),
        //   ),
        );
  }
}

class SlideTile extends StatelessWidget {
  String imagePath, title;

  SlideTile({required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        // TODO: Remove this SingleChildScrollView After resolving this
        child: Column(
          children: [
            // const SizedBox(
            //   height: 40,
            // ),
            Text(
              title,
              // textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset(imagePath),
          ],
        ),
      ),
    );
  }
}
