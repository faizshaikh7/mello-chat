import 'package:flutter/material.dart';
import 'package:mello_chat/screens/chats_screen.dart';
import 'package:mello_chat/screens/dashboard.dart';
import 'package:mello_chat/widgets/custom_textfield.dart';

class SignupSecondScreen extends StatefulWidget {
  const SignupSecondScreen({super.key});

  @override
  State<SignupSecondScreen> createState() => _SignupSecondScreenState();
}

class _SignupSecondScreenState extends State<SignupSecondScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  final List<AssetImage> avatars = [
    const AssetImage("assets/images/avatar.png"),
    const AssetImage("assets/images/avatar13.png"),
    const AssetImage("assets/images/avatar7.png"),
    const AssetImage("assets/images/avatar10.png"),
    const AssetImage("assets/images/avatar1.png"),
    const AssetImage("assets/images/avatar2.png"),
    const AssetImage("assets/images/avatar3.png"),
    const AssetImage("assets/images/avatar5.png"),
    const AssetImage("assets/images/avatar6.png"),
    const AssetImage("assets/images/avatar8.png"),
    const AssetImage("assets/images/avatar11.png"),
    const AssetImage("assets/images/avatar12.png"),
    const AssetImage("assets/images/avatar9.png"),
  ];

  int defaultIndex = 0;

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
                        "How people Identify you?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 34,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.056,
                    ),
                    GestureDetector(
                      onTap: () {
                        _modelBottomSheet();
                      },
                      child: CircleAvatar(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 22,
                            child: Icon(
                              Icons.edit,
                              size: 20.0,
                              color: Colors.blue.shade800,
                            ),
                          ),
                        ),
                        radius: MediaQuery.of(context).size.height / 10,
                        backgroundImage: avatars[defaultIndex],
                      ),
                    ),

                    // Container(
                    //   height: 150,
                    //   width: 150,
                    //   decoration: BoxDecoration(
                    //       image: const DecorationImage(
                    //         image: AssetImage("assets/images/avatar.png"),
                    //         fit: BoxFit.fill,
                    //       ),
                    //       borderRadius: BorderRadius.circular(100)),
                    // ),
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
                    const Text(
                      "Identifying information",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: size.height * 00.028,
                    ),
                    CustomTextFiled(
                        controller: nameController, inputText: "Username"),
                    SizedBox(
                      height: size.height * 00.02,
                    ),
                    CustomTextFiled(
                        controller: usernameController, inputText: "Status"),
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
                          builder: (context) => const Dashboard(),
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

  _modelBottomSheet() {
    final size = MediaQuery.of(context).size;

    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, setModelState) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              width: double.infinity,
              height: size.height / 2.4,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text(
                    "Select Avatar",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: size.height * 00.025,
                  ),
                  Expanded(
                    child: GridView.builder(
                        itemCount: avatars.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                setModelState(() {
                                  defaultIndex = index;
                                });
                              });
                            },
                            child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  border: index == defaultIndex
                                      ? Border.all(
                                          width: 3, color: Colors.blue.shade800)
                                      : Border.all(
                                          width: 0,
                                        ),
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: avatars[index],
                                    fit: BoxFit.fill,
                                  ),
                                )),
                          );
                        }),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
