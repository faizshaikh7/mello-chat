import 'package:flutter/material.dart';
import 'package:mello_chat/utils/colors.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  final List<Widget> tabsNames = const [
    Text("All"),
    Text("Office"),
    Text("Personal"),
    Text("Archive")
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabsNames.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color.fromRGBO(220, 230, 229, 00),
        // TODO: LATER IF REQUIRED CHANGE APPBAR USING CONTAINER IN BODY..
        appBar: AppBar(
          //  TODO: FIX SOME HEIGHTS AND FONTSIZE

          iconTheme: IconThemeData(
            color: Colors.grey.shade800,
          ),
          titleSpacing: 12,
          leadingWidth: 70,
          toolbarHeight: 110,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CircleAvatar(
              radius: 16.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.asset('assets/images/avatar.png'),
              ),
            ),
          ),
          title: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mohamed Faiz",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                "💼 At Work",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                child: Row(
                  children: [
                    const Text(
                      "Chats",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text("11"),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  height: size.height,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.grey.shade100,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.01, vertical: 20),
                        child: TabBar(
                          isScrollable: true,
                          controller: _tabController,
                          unselectedLabelColor: Colors.grey.shade500,
                          tabs: tabsNames,
                          labelPadding: EdgeInsets.symmetric(horizontal: 20),
                          indicator: const BoxDecoration(),
                          labelStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Container(
                          height: 500,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            color: Colors.white54,
                          ),
                          child: ListView.builder(
                            itemCount: 20,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Container(
                                  width: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.grey.shade400,
                                    ),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(1.5),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        "assets/images/avatar.png",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                title: Text("Mohamed"),
                                subtitle: Text("Heee"),
                                horizontalTitleGap: 10,
                                trailing: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "9:10 AM",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Container(
                                      width: 18,
                                      height: 18,
                                      decoration: BoxDecoration(
                                        color: Colors.blue.shade800,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "2",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        )));
  }
}
