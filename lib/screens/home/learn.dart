import 'package:egyrailwayes/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 230.h,
          padding: EdgeInsets.all(20.0.r),
          margin: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 20.h,
          ),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(16).r,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(131, 122, 122, 122),
                blurRadius: 5.r,
                offset: Offset(0.w, 2.h),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [Colors.cyan, Colors.blue],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.access_time,
                      color: AppColor.colorwhite,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Time-Saving",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
              ),
              Text(
                  "book your tickets online and avoid long queues at the station, saving you valuable time for your journey",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                    shadows: const [
                      Shadow(
                        color: Colors.grey,
                        blurRadius: 2,
                        offset: Offset(1, 1),
                      ),
                    ],
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Container(
          height: 230.h,
          padding: EdgeInsets.all(20.0.r),
          margin: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 20.h,
          ),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(16).r,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(131, 122, 122, 122),
                blurRadius: 5.r,
                offset: Offset(0.w, 2.h),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [Colors.cyan, Colors.blue],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.security,
                      color: AppColor.colorwhite,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Secure Booking",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
              ),
              Text(
                  "Your payments and personal information are protected with our advanced encryption and secure payment systems",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                    shadows: const [
                      Shadow(
                        color: Colors.grey,
                        blurRadius: 2,
                        offset: Offset(1, 1),
                      ),
                    ],
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Container(
          height: 230.h,
          padding: EdgeInsets.all(20.0.r),
          margin: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 20.h,
          ),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(16).r,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(131, 122, 122, 122),
                blurRadius: 5.r,
                offset: Offset(0.w, 2.h),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [Colors.cyan, Colors.blue],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.credit_card,
                      color: AppColor.colorwhite,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Easy Payment",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
              ),
              Text(
                  "Multiple payment options for your convenience, including credit cards, mobile wallets, and more.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                    shadows: const [
                      Shadow(
                        color: Colors.grey,
                        blurRadius: 2,
                        offset: Offset(1, 1),
                      ),
                    ],
                  )),
            ],
          ),
        ),
        Container(
          height: 230.h,
          padding: EdgeInsets.all(20.0.r),
          margin: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 20.h,
          ),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(16).r,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(131, 122, 122, 122),
                blurRadius: 5.r,
                offset: Offset(0.w, 2.h),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [Colors.cyan, Colors.blue],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.support_agent,
                      color: AppColor.colorwhite,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "24/7 support",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
              ),
              Text(
                  "Customer support available at all times to assist with your travel needs and answer any questions.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                    shadows: const [
                      Shadow(
                        color: Colors.grey,
                        blurRadius: 2,
                        offset: Offset(1, 1),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
