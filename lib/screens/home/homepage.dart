
import 'package:egyrailwayes/constants/row_buttons.dart';
import 'package:egyrailwayes/screens/home/learn.dart';


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  HomepageState createState() => HomepageState();
}

class HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top: 50.h, left: 20.w, right: 20.w),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Color.fromARGB(255, 228, 228, 228)],
              begin: Alignment.topCenter,
              end: Alignment.center,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(2.r),
                    child: CircleAvatar(
                      radius: 25.r,
                      backgroundImage: AssetImage('images/splash.jpg'),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    '''Hello, 
mourad maged''',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.w),
                    child: IconButton(
                      icon: Icon(
                        Icons.notifications_outlined,
                        color: Color.fromARGB(212, 0, 0, 0),
                      ),
                      onPressed: () {
                        // Handle notification icon press here
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        ListView(
          padding: EdgeInsets.only(top: 100.h),
          children: [
            SizedBox(height: 20.h),
            Buttons(),
            SizedBox(height: 20.h),
          ],
        ),
        Rowbuttons(),
      ],
    );
  }
}
