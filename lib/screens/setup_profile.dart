import 'package:flutter/material.dart';
import 'package:mello_chat/widgets/custom_textfield.dart';

class SetupProfile extends StatefulWidget {
  const SetupProfile({super.key});

  @override
  State<SetupProfile> createState() => _SetupProfileState();
}

class _SetupProfileState extends State<SetupProfile> {
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
                      height: size.height * 0.04,
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
                    )
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
                      height: size.height * 00.03,
                    ),
                    Text("Name"),
                    CustomTextFiled(controller: TextEditingController()),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          // backgroundColor: Colors.grey.shade50,
                          elevation: 0,
                          minimumSize: const Size(double.infinity, 50),
                          shape: const StadiumBorder()),
                      onPressed: () {},
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
}
