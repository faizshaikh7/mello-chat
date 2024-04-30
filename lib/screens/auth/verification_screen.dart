import 'package:flutter/material.dart';
import 'package:mello_chat/screens/auth/signup_one_screen.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final phoneNumber = "+91-96531-00000";

    final TextEditingController controller1 = TextEditingController();
    final TextEditingController controller2 = TextEditingController();
    final TextEditingController controller3 = TextEditingController();
    final TextEditingController controller4 = TextEditingController();
    final TextEditingController controller5 = TextEditingController();
    final TextEditingController controller6 = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Phone Number \nverification",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 34,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.0437,
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage("assets/images/avatar.png"),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(100)),
                    ),
                    // CircleAvatar(
                    //   minRadius: 70,
                    //   backgroundImage: AssetImage(
                    //     "assets/images/avatar.png",
                    //   ),
                    // )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 00.07,
              ),
              Container(
                // height: size.height / 1.561,
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 00.03,
                    ),
                    Text(
                      "Enter 6 Digit code we sent to $phoneNumber",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * 00.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _textFieldOTP(
                          first: true,
                          last: false,
                          controllerr: controller1,
                        ),
                        _textFieldOTP(
                          first: false,
                          last: false,
                          controllerr: controller2,
                        ),
                        _textFieldOTP(
                          first: false,
                          last: false,
                          controllerr: controller3,
                        ),
                        _textFieldOTP(
                          first: false,
                          last: false,
                          controllerr: controller4,
                        ),
                        _textFieldOTP(
                          first: false,
                          last: false,
                          controllerr: controller5,
                        ),
                        _textFieldOTP(
                          first: false,
                          last: true,
                          controllerr: controller6,
                        ),
                      ],
                    ),
                    // Verification Field
                    SizedBox(
                      height: size.height * 00.035,
                    ),
                    TextButton(
                        onPressed: () {}, child: const Text("Resend code")),
                    SizedBox(
                      height: size.height * 00.015,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          // backgroundColor: Colors.grey.shade50,
                          elevation: 0,
                          minimumSize: const Size(double.infinity, 50),
                          shape: const StadiumBorder()),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignupOneScreen(),
                        ));
                      },
                      child: const Text("Continue"),
                    ),
                    SizedBox(height: size.height * 00.05),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFieldOTP(
      {bool? first, last, TextEditingController? controllerr}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 12,
      child: AspectRatio(
        aspectRatio: 0.8,
        child: TextField(
          controller: controllerr,
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 00.015),
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(20)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ),
    );
  }
}
