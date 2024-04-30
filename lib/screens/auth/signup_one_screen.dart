import 'package:flutter/material.dart';
import 'package:mello_chat/screens/auth/signup_second_screen.dart';
import 'package:mello_chat/widgets/custom_textfield.dart';

class SignupOneScreen extends StatefulWidget {
  const SignupOneScreen({super.key});

  @override
  State<SignupOneScreen> createState() => _SignupOneScreenState();
}

class _SignupOneScreenState extends State<SignupOneScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                        "How people to know you?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 34,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.056,
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
                height: size.height * 00.075,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 00.025,
                    ),
                    Text(
                      "Personal Information",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: size.height * 00.028,
                    ),
                    CustomTextFiled(
                        controller: nameController, inputText: "Name"),
                    SizedBox(
                      height: size.height * 00.02,
                    ),
                    CustomTextFiled(
                      controller: emailController,
                      inputText: "Email",
                      textType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: size.height * 00.05,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          // backgroundColor: Colors.grey.shade50,
                          elevation: 0,
                          minimumSize: const Size(double.infinity, 50),
                          shape: const StadiumBorder()),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignupSecondScreen(),
                        ));
                      },
                      child: const Text("Continue"),
                    ),
                    SizedBox(height: size.height * 00.06),
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
