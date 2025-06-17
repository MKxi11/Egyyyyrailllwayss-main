import 'package:egyrailwayes/screens/pages/find.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: camel_case_types
class imagebox extends StatefulWidget {
  const imagebox({super.key});

  @override
  State<imagebox> createState() => _imageboxState();
}

// ignore: camel_case_types
class _imageboxState extends State<imagebox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 345.h,
          margin: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 350.w,
                height: 220.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/alexandria.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(16).r,
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cairo to Alexandria',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'from EGP 150',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Color.fromARGB(255, 100, 100, 100),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Find(
                                          initialOrigin: 'Cairo',
                                          initialDestination: 'Alexandria',
                                        )));
                          },
                          child: Row(
                            children: [
                              Text(
                                "view trains",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.cyan,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.cyan,
                                size: 16.sp,
                              ),
                            ],
                          ),
                        )
                      ])),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        Container(
          height: 345.h,
          margin: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 350.w,
                height: 220.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/luxor.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(16).r,
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cairo to Luxor',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'from EGP 120',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Color.fromARGB(255, 100, 100, 100),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Find(
                                          initialOrigin: 'Cairo',
                                          initialDestination: 'Luxor',
                                        )));
                          },
                          child: Row(
                            children: [
                              Text(
                                "view trains",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.cyan,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.cyan,
                                size: 16.sp,
                              ),
                            ],
                          ),
                        )
                      ])),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        Container(
          height: 345.h,
          margin: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 350.w,
                height: 220.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/aswan.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(16).r,
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Alexandria to Aswan',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'from EGP 270',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Color.fromARGB(255, 100, 100, 100),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Find(
                                          initialOrigin: 'Alexandria',
                                          initialDestination: 'Aswan',
                                        )));
                          },
                          child: Row(
                            children: [
                              Text(
                                "view trains",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.cyan,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.cyan,
                                size: 16.sp,
                              ),
                            ],
                          ),
                        )
                      ])),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        // Container(
        //   height: 345.h,
        //   margin: EdgeInsets.only(
        //     left: 20.w,
        //     right: 20.w,
        //   ),
        //   decoration: BoxDecoration(
        //     color: Color.fromARGB(255, 255, 255, 255),
        //     borderRadius: BorderRadius.circular(16).r,
        //     boxShadow: [
        //       BoxShadow(
        //         color: Color.fromARGB(131, 122, 122, 122),
        //         blurRadius: 5.r,
        //         offset: Offset(0.w, 2.h),
        //       ),
        //     ],
        //   ),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: [
        //       Container(
        //         width: 350.w,
        //         height: 220.h,
        //         decoration: BoxDecoration(
        //           image: DecorationImage(
        //             image: AssetImage('images/aswan.jpg'),
        //             fit: BoxFit.cover,
        //           ),
        //           borderRadius: BorderRadius.circular(16).r,
        //         ),
        //       ),
        //       SizedBox(height: 10.h),
        //       Container(
        //           padding: EdgeInsets.symmetric(horizontal: 16.w),
        //           child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Text(
        //                   'suez to cairo',
        //                   style: TextStyle(
        //                     fontSize: 18.sp,
        //                     fontWeight: FontWeight.bold,
        //                     color: Color.fromARGB(255, 0, 0, 0),
        //                   ),
        //                 ),
        //                 SizedBox(height: 10.h),
        //                 Align(
        //                   alignment: Alignment.topLeft,
        //                   child: Text(
        //                     'from EGP 270',
        //                     textAlign: TextAlign.left,
        //                     style: TextStyle(
        //                       fontSize: 16.sp,
        //                       color: Color.fromARGB(255, 100, 100, 100),
        //                     ),
        //                   ),
        //                 ),
        //                 InkWell(
        //                   onTap: () {
        //                     Navigator.push(
        //                         context,
        //                         MaterialPageRoute(
        //                             builder: (context) => Find(
        //                                   initialOrigin: 'cairo',
        //                                   initialDestination: 'Hurghada',
        //                                 )));
        //                   },
        //                   child: Row(
        //                     children: [
        //                       Text(
        //                         "view trains",
        //                         style: TextStyle(
        //                           fontSize: 16.sp,
        //                           color: Colors.cyan,
        //                         ),
        //                       ),
        //                       Icon(
        //                         Icons.arrow_forward,
        //                         color: Colors.cyan,
        //                         size: 16.sp,
        //                       ),
        //                     ],
        //                   ),
        //                 )
        //               ])),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
