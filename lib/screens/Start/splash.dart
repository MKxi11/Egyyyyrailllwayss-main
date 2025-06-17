import 'dart:async';
import 'package:egyrailwayes/constants/app_color.dart';
import 'package:egyrailwayes/screens/Start/onbroading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Onbroading()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200.h,
            ),
            Container(
              child: Image.asset(
                "images/logo.png",
                height: 220.h,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              child: Text(
                "Egy Railway",
                style: TextStyle(
                    color: AppColor.colorblack,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
