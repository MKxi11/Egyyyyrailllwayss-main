import 'package:egyrailwayes/ai.dart';
import 'package:egyrailwayes/constants/bar.dart';
import 'package:egyrailwayes/screens/home/findandLearn.dart';
import 'package:egyrailwayes/screens/home/imagebox.dart';
import 'package:egyrailwayes/screens/home/learn.dart';
import 'package:egyrailwayes/screens/home/popularTrains.dart';
import 'package:egyrailwayes/screens/home/textContainter.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homepage2 extends StatefulWidget {
  const Homepage2({super.key});

  @override
  State<Homepage2> createState() => _Homepage2State();
}

class _Homepage2State extends State<Homepage2>
    with SingleTickerProviderStateMixin {
  TabController? tabController1;

  @override
  void initState() {
    super.initState();
    tabController1 = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 163, 244, 255),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Ai()));
        },
        child: Icon(Icons.support_agent_sharp),
      ),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Bar(), // Add settings
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 14, 70, 117),
              const Color.fromARGB(255, 255, 255, 255),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: tabController1,
                children: [
                  ListView(
                    children: [
                      TextContainer(),
                      SizedBox(height: 30.h),
                      findandLearn(),
                      SizedBox(height: 50.h),
                      Buttons(),
                      SizedBox(height: 200.h),
                      Populartrains(),
                      SizedBox(height: 50.h),
                      imagebox(),
                      SizedBox(height: 50.h),
                    ],
                  ),
                  ListView(
                    children: [
                      SizedBox(height: 20.h),
                      Buttons(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
