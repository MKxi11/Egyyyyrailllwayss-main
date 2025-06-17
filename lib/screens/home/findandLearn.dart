

import 'package:egyrailwayes/screens/pages/find.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class findandLearn extends StatefulWidget {
  const findandLearn({super.key});

  @override
  State<findandLearn> createState() => _findandLearnState();
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class _findandLearnState extends State<findandLearn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(330.w, 65.h), // Button size
              padding: EdgeInsets.symmetric(
                  horizontal: 20.h, vertical: 10.w), // Button padding
              textStyle: TextStyle(fontSize: 16.sp), // Button text style
              shape: RoundedRectangleBorder(
                side:
                    BorderSide(color: const Color.fromARGB(104, 255, 255, 255)),
                borderRadius: BorderRadius.circular(10.0.r),

                // Button shape
              ),
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              foregroundColor: Colors.white, // Button text color
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Find()));
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Find Your Train ',
                    style: TextStyle(fontSize: 16.sp, color: Colors.blue),
                    textAlign: TextAlign.center),
                Icon(Icons.arrow_forward, size: 20.sp, color: Colors.blue),
              ],
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(330.w, 65.h), // Button size
              padding: EdgeInsets.symmetric(
                  horizontal: 20.h, vertical: 10.w), // Button padding
              textStyle: TextStyle(fontSize: 16.sp), // Button text style
              shape: RoundedRectangleBorder(
                side:
                    BorderSide(color: const Color.fromARGB(104, 255, 255, 255)),
                borderRadius: BorderRadius.circular(10.0.r),

                // Button shape
              ),
              backgroundColor: const Color.fromARGB(48, 76, 180, 255),
              foregroundColor: Colors.white, // Button text color
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    color: const Color.fromARGB(128, 255, 255, 255),
                    padding: EdgeInsets.all(60.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(height: 200.h),
                        Container(
                          width: 120.w,
                          height: 25.h,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(105, 164, 244, 255),
                            borderRadius: BorderRadius.circular(10.0.r),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              'WHY CHOOSE US?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color.fromARGB(255, 0, 7, 19),
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'We\'re committed to making your travel experience in Egypt seamless and enjoyable. Our platform offers real-time train schedules, easy ticket booking, and a user-friendly interface to help you navigate the Egyptian railway system with ease.',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 0, 7, 19)),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20.h),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                                146, 255, 255, 255), // Button color
                            foregroundColor: const Color.fromARGB(
                                255, 255, 0, 0), // Text color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0.r),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child:
                              Text('Close', style: TextStyle(fontSize: 16.sp)),
                        )
                      ],
                    ),
                  );
                },
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Learn More '),
                Icon(Icons.arrow_downward, size: 20.sp),
              ],
            ),
          )
        ],
      ),
    );
  }
}
