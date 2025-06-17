import 'package:egyrailwayes/constants/app_color.dart';
import 'package:egyrailwayes/constants/profile_button.dart';
import 'package:egyrailwayes/screens/pages/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  bool _isPasswordHidden = true;
  bool _isPasswordHidden2 = true;
  final FocusNode focusNode = FocusNode();
  FocusNode focusNode2 = FocusNode();
  bool isFocused = false;
  bool isFocused2 = false;
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {
        isFocused = focusNode.hasFocus;
      });
    });
    focusNode2.addListener(() {
      setState(() {
        isFocused2 = focusNode2.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.h, // Set the height of the AppBar
        leading: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Bottombar()));
          },
          child: Image.asset(
            'images/logo.png',
            height: 40.h, // Set the height of the logo
            width: 40.w, // Set the width of the logo
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
            )),
        actions: [
          IconButton(
              padding: EdgeInsets.only(right: 10.w),
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_forward,
                color: AppColor.colorblack,
              ))
        ],
      ),
      body: Center(
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Container(
                width: double.infinity,
                height: 130.h,
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.cyan,
                      const Color.fromARGB(255, 14, 70, 117),
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5.r,
                      offset: Offset(0, 3.h),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 17.w, top: 10.h),
                      child: Text("Change Password",
                          style: TextStyle(
                            fontSize: 24.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 17.w, top: 10.h),
                      child: Text("Update your account password",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: double.infinity,
                    height: 400.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.r),
                        bottomRight: Radius.circular(20.r),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 5.r,
                          offset: Offset(0, 3.h),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 60.h),
                          width: 320.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            cursorWidth: 1.w,
                            cursorHeight: 30.h,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                            ),
                            focusNode: focusNode,
                            decoration: InputDecoration(
                              labelText: "New Password",
                              labelStyle: TextStyle(
                                color: focusNode.hasFocus
                                    ? Colors.cyan
                                    : Colors.grey,
                                fontSize: 14.sp,
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordHidden = !_isPasswordHidden;
                                    });
                                  },
                                  icon: Icon(
                                    _isPasswordHidden
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: AppColor.colorhint,
                                    size: 18.0.sp,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.cyan,
                                      width: 1.w,
                                      style: BorderStyle.solid)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff5F6368),
                                      width: 0.5.w,
                                      style: BorderStyle.solid)),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 30.h),
                          width: 320.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            cursorWidth: 1.w,
                            cursorHeight: 30.h,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                            ),
                            focusNode: focusNode2,
                            decoration: InputDecoration(
                              labelText: "Confirm Password",
                              labelStyle: TextStyle(
                                color: isFocused2 ? Colors.cyan : Colors.grey,
                                fontSize: 14.sp,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.cyan,
                                      width: 1.w,
                                      style: BorderStyle.solid)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff5F6368),
                                      width: 0.5.w,
                                      style: BorderStyle.solid)),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isPasswordHidden2 = !_isPasswordHidden2;
                                  });
                                },
                                icon: Icon(
                                  _isPasswordHidden2
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Color(0xff5F6368),
                                  size: 18.0.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        Container(
                          width: 180.w,
                          height: 45.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.cyan,
                                    const Color.fromARGB(255, 14, 70, 117),
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight)),
                          child: MaterialButton(
                            onPressed: () {},
                            child: Text(
                              "Update Password",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.sp),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Container(
                          width: 180.w,
                          height: 45.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: const Color.fromARGB(255, 210, 210, 210),
                                style: BorderStyle.solid,
                                width: 0.8),
                          ),
                          child: MaterialButton(
                            onPressed: () {},
                            child: Text(
                              "Reset",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
