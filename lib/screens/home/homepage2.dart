import 'package:awesome_icons/awesome_icons.dart';
import 'package:egyrailwayes/screens/home/ai.dart';
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
  final GlobalKey _fabKey = GlobalKey();
  TabController? tabController1;

  @override
  void initState() {
    super.initState();
    tabController1 = TabController(length: 2, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showTooltip();
    });
  }

  void _showTooltip() {
    final overlay = Overlay.of(context);
    final renderBox = _fabKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final position = renderBox.localToGlobal(Offset.zero);

    final entry = OverlayEntry(
      builder: (context) => Positioned(
        left: position.dx + renderBox.size.width / 2 - 200,
        top: position.dy - 20,
        child: Material(
          color: const Color.fromARGB(162, 255, 255, 255),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(207, 183, 238, 245),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Ask Egy Railways AI',
              style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0), fontSize: 12),
            ),
          ),
        ),
      ),
    );

    overlay.insert(entry);
    Future.delayed(Duration(seconds: 2), () => entry.remove());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        key: _fabKey,
        backgroundColor: const Color.fromARGB(142, 170, 245, 255),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Ai()));
        },
        icon: Icon(FontAwesomeIcons.robot, size: 18),
        label: Text(
          "Chat Now",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r), // تعديل شكل الزر
        ),
      ),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Bar(),
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
