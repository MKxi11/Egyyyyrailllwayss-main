import 'package:egyrailwayes/constants/app_color.dart';
import 'package:egyrailwayes/constants/container1_help.dart';
import 'package:egyrailwayes/constants/textfield_for_message.dart';
import 'package:egyrailwayes/screens/pages/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpSupport extends StatefulWidget {
  const HelpSupport({super.key});

  @override
  State<HelpSupport> createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport> {
  bool value = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.h,
        leading: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Bottombar()));
          },
          child: Image.asset(
            'images/logo.png',
            height: 40.h,
            width: 40.w,
          ),
        ),
        backgroundColor: Colors.white.withOpacity(0.8),
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
      body: ListView(
        children: [
          Center(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20.h),
                    child: Text(
                      "Help & Support ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8.h),
                    child: Text(
                      "Find answers to common questions or  contact \n                          our support team",
                      style: TextStyle(
                        color: AppColor.colorhint,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  // Contact Us Content
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 20.w),
                        child: Text("Contact Us",
                            style: TextStyle(
                              fontSize: 25.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            container1_help(
                              icon: Icons.phone_outlined,
                              text1: "Phone Support",
                              text2: "+20 (2) 2575-3555",
                              text3: "Available 8AM - 10PM, 7 days",
                            ),
                            container1_help(
                              icon: Icons.email_outlined,
                              text1: "Email Support",
                              text2: "support@egyrailway.eg",
                              text3: "Response within 24 hours",
                            ),
                            container1_help(
                              icon: Icons.chat_outlined,
                              text1: "Live Chat",
                              text2: '''Chat with our team''',
                              text3: "Available 9 AM - 8 PM, 7 days",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        width: double.infinity,
                        height: 920.h,
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        padding: EdgeInsets.all(20.r),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r),
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
                              margin: EdgeInsets.only(left: 10.w, top: 10.h),
                              child: Text("Send us a Message",
                                  style: TextStyle(
                                    fontSize: 24.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.w, top: 10.h),
                              child: Text("Full Name",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.black,
                                  )),
                            ),
                            textfield_for_message(
                              validator: (value) {
                                if (value == "") {
                                  return 'Please enter your Name';
                                }
                                return '';
                              },
                              width: 320.w,
                              height: 50.h,
                              hintText: "Your Name",
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.w, top: 10.h),
                              child: Text("Email",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.black,
                                  )),
                            ),
                            textfield_for_message(
                                validator: (value) {
                                  if (value == "") {
                                    return 'Please enter your email';
                                  }
                                  return '';
                                },
                                width: 320.w,
                                height: 50.h,
                                hintText: "Your.email@example.com"),
                            Container(
                              margin: EdgeInsets.only(left: 10.w, top: 10.h),
                              child: Text("Subject",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.black,
                                  )),
                            ),
                            textfield_for_message(
                                validator: (value) {
                                  if (value == "") {
                                    return 'Subject is required';
                                  }
                                  return '';
                                },
                                width: 400.w,
                                height: 50.h,
                                hintText: "How can we help you?"),
                            Container(
                              margin: EdgeInsets.only(left: 10.w, top: 10.h),
                              child: Text("Message",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.black,
                                  )),
                            ),
                            Container(
                              width: 400.w,
                              height: 300.h,
                              margin: EdgeInsets.only(left: 10.w, top: 10.h),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == "") {
                                    return 'Please enter your message';
                                  }
                                  return '';
                                },
                                textAlignVertical: TextAlignVertical.top,
                                cursorColor: Colors.cyan,
                                cursorWidth: 1.w,
                                cursorHeight: 30.h,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                ),
                                expands: true,
                                maxLines: null,
                                minLines: null,
                                decoration: InputDecoration(
                                  hintText:
                                      "Please describe your issue or question in detail...",
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.cyan,
                                      width: 0.8.w,
                                    ),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                      width: 0.8.w,
                                    ),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20.h),
                              child: CheckboxListTile(
                                  activeColor: AppColor.colorblue,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  title: RichText(
                                    text: TextSpan(
                                        text: "I agree to EgyRailway's ",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "privacy policy",
                                            style: TextStyle(
                                              color: Colors.cyan,
                                            ),
                                          ),
                                          TextSpan(
                                            text: " and",
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                          TextSpan(
                                            text: " terms of service",
                                            style: TextStyle(
                                              color: Colors.cyan,
                                            ),
                                          ),
                                        ]),
                                  ),
                                  value: value,
                                  onChanged: (val) {
                                    setState(() {
                                      value = val ?? false;
                                    });
                                  }),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 30.h, left: 10.w),
                              width: 150.w,
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
                                onPressed: () {
                                  if (formKey.currentState?.validate() ==
                                          true &&
                                      value) {
                                    // All validators passed and checkbox is checked
                                    // Add your send message logic here
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: Colors.green,
                                          content: Text(
                                              'Message sent successfully!')),
                                    );
                                  } else if (!value) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text(
                                              'Please agree to the privacy policy and terms of service.')),
                                    );
                                  }
                                },
                                child: Text(
                                  "Send Message",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }
}
