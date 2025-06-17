import 'package:egyrailwayes/constants/app_color.dart';
import 'package:egyrailwayes/screens/pages/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bar extends StatefulWidget {
  const Bar({super.key});

  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: AppBar(
      toolbarHeight: 70.h, // Set the height of the AppBar
      leading: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Bottombar()));
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset(
            'images/logo.png',
            height: 40.h, // Set the height of the logo
            width: 40.w, // Set the width of the logo
          ),
        ),
      ),
      backgroundColor: Colors.white
          .withOpacity(0.8), // Set the AppBar background color with opacity
      title: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Bottombar()));
        },
        child: Text(
          'Egy Railways',
          style: TextStyle(
            foreground: Paint()
              ..shader = LinearGradient(
                colors: [
                  Colors.cyan,
                  const Color.fromARGB(255, 14, 70, 117),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ).createShader(Rect.fromLTWH(0, 0, 400, 70)),
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      actions: [
        PopupMenuButton(
          color: const Color.fromARGB(
              45, 0, 36, 156), // Set the background color of the menu
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r), // Set the border radius
          ),
          iconSize: 30.sp, // Set the size of the menu icon
          padding: EdgeInsets.only(right: 10.w),
          icon: Icon(Icons.menu, color: AppColor.colorblack, size: 20.sp),
          itemBuilder: (BuildContext context) => [
            PopupMenuItem(
              value: 'settings',
              child: Text(
                'Settings',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
            PopupMenuItem(
              value: 'profile',
              child: Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
            PopupMenuItem(
              value: 'logout',
              child: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
          onSelected: (value) {
            // Handle menu item selection
            if (value == 'settings') {
              // Navigate to settings page
            } else if (value == 'profile') {
              // Navigate to profile page
            } else if (value == 'logout') {
              // Handle logout
            }
          },
        ),
      ], // Add settings
      shadowColor: const Color.fromARGB(255, 88, 88, 88)
          .withOpacity(0.5), // Add shadow to the AppBar
      elevation: 2, // Set the elevation of the AppBar
    ));
  }
}
