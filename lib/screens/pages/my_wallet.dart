import 'package:egyrailwayes/constants/app_color.dart';
import 'package:egyrailwayes/constants/bar.dart';
import 'package:egyrailwayes/screens/pages/completeVisa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyWallet extends StatefulWidget {
  const MyWallet({super.key});

  @override
  State<MyWallet> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Bar(),
      ),
      body: Padding(
          padding: EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 30.h,
            ),
            Text(
              "Cash Currency",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
            ),
            Text(
              "EGP 160.0",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.sp),
            ),
            SizedBox(
              height: 50.h,
            ),
            Stack(children: [
              Container(
                height: 400.h,
                width: double.infinity,
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: AppColor.colorwhite,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(131, 122, 122, 122),
                      blurRadius: 5.r,
                      offset: Offset(0, 2.h),
                    ),
                  ],
                ),
              ),
              Column(children: [
                Container(
                    child: Image.asset("images/mastercard.png"),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(131, 122, 122, 122),
                        blurRadius: 50.r,
                        offset: Offset(0, 20.h),
                      ),
                    ])),
                InkWell(
                  child: Container(
                    height: 100.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue, Colors.cyan],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset:
                              Offset(0, 3), // horizontal and vertical offset
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 150.0, top: 20),
                      child: Text(
                        '+',
                        style: TextStyle(color: Colors.white, fontSize: 50),
                      ),
                    ),
                  ),
                  onTap: () => {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Completevisa()))
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Add Card",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                )
              ]),
            ])
          ])),
    );
  }
}
