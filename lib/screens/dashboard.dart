import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mello_chat/widgets/custom_bottom_nav_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;

  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 4, vsync: this);
    tabController.animation!.addListener(() {
      final value = tabController.animation!.value.round();
      if (value != currentPage && mounted) {
        changePage(value);
      }
    });
    super.initState();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomBottomNavBar(
          child: TabBarView(
            controller: tabController,
            dragStartBehavior: DragStartBehavior.down,
            physics: BouncingScrollPhysics(),
            children: [
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height * 2,
                  color: Colors.amber,
                ),
              ),
              Text("Page 2"),
              Text("Page 3"),
              Text("Page 4"),
            ],
          ),
          currentPage: currentPage,
          tabController: tabController,
          colors: [
            Colors.red,
            Colors.blue,
            Colors.yellow,
            Colors.indigo,
          ],
          unselectedColor: Colors.grey.shade700,
          barColor: Colors.white,
          end: 10,
          start: 20,
        ),
      ),
    );
  }
}
