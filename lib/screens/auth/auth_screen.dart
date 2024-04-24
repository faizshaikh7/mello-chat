import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mello_chat/screens/auth/verification_screen.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  String countryCode = "91";
  String countryFlag = "🇮🇳";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "🇬🇧 ENG",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    const Text(
                      "Welcome to \nMello! 👋",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 34,
                      ),
                    ),
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
                      height: size.height * 00.04,
                    ),
                    const Text(
                      "Enter your phone number",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // CustomTextFiled(controller: TextEditingController()),
                    SizedBox(
                      height: 70,
                      child: TextField(
                        style: const TextStyle(color: Colors.grey),
                        // controller: widget.controller,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, top: 15, bottom: 15, right: 5),
                            child: IntrinsicHeight(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      showCountryPicker(
                                        context: context,
                                        showPhoneCode:
                                            false, // optional. Shows phone code before the country name.
                                        onSelect: (Country country) {
                                          setState(() {
                                            countryFlag = country.flagEmoji;
                                            countryCode = country.phoneCode;
                                          });
                                        },
                                      );
                                    },
                                    child: Text(
                                      "$countryFlag  +$countryCode",
                                      style: TextStyle(
                                        fontSize: 17.50,
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                  ),
                                  const VerticalDivider(
                                    thickness: 1.2,
                                  )
                                ],
                              ),
                            ),
                          ),
                          hintText: "Phone Number",
                          hintStyle: const TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                                color: Colors.grey.shade300, width: 2.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                                color: Colors.grey.shade200, width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                                color: Colors.grey.shade200, width: 2.0),
                          ),
                        ),
                        cursorColor: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    // ignore: prefer_const_constructors
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        SizedBox(
                            width: 100,
                            child: Divider(
                              thickness: 0.8,
                            )),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Text(
                            "Or",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                            width: 100,
                            child: Divider(
                              thickness: 0.8,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade50,
                          elevation: 0,
                          minimumSize: const Size(double.infinity, 55),
                          shape: const StadiumBorder()),
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.google,
                            color: Colors.blue.shade400,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Google",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade700,
                          elevation: 0,
                          minimumSize: const Size(double.infinity, 55),
                          shape: const StadiumBorder()),
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.facebook,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Facebook",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.18,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              minimumSize: const Size(120, 50),
                              shape: const StadiumBorder()),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const VerificationScreen(),
                                ));
                          },
                          child: const Text("Continue")),
                    ),
                    SizedBox(
                      height: size.height * 0.016,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
