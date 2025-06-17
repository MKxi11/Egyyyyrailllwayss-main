import 'dart:io';

import 'package:egyrailwayes/constants/app_color.dart';
import 'package:egyrailwayes/constants/profile_button.dart';
import 'package:egyrailwayes/screens/pages/bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final user = Supabase.instance.client.auth.currentUser;
  TextEditingController firstNamecontroller = TextEditingController(
    text: Supabase.instance.client.auth.currentUser?.userMetadata?['full_name']
            ?.split(" ")
            .first ??
        "No First Name",
  );
  TextEditingController lastNamecontroller = TextEditingController(
    text: Supabase.instance.client.auth.currentUser?.userMetadata?['full_name']
            ?.split(" ")
            .last ??
        "No Last Name",
  );
  TextEditingController emailcontroller = TextEditingController(
    text: Supabase.instance.client.auth.currentUser?.email ?? "No Email",
  );
  TextEditingController phonecontroller = TextEditingController(
    text: Supabase.instance.client.auth.currentUser?.userMetadata?['phone'],
  );
  final FocusNode _focusNode = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  bool isFocused = false;
  bool isFocused2 = false;
  bool isFocused3 = false;
  File? _image;
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        isFocused = _focusNode.hasFocus;
      });
    });
    _focusNode2.addListener(() {
      setState(() {
        isFocused2 = _focusNode2.hasFocus;
      });
    });
    _focusNode3.addListener(() {
      setState(() {
        isFocused3 = _focusNode3.hasFocus;
      });
    });
  }

  void pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image != null ? File(image.path) : null;
    });
    // You can now use the 'image' variable as needed
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
        child: ListView(
          children: [
            Form(
              child: Column(
                children: [
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
                          child: Text("Edit Profile",
                              style: TextStyle(
                                fontSize: 24.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(left: 17.w, top: 10.h),
                          child: Text("Update your Personal information",
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 700.h,
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    padding: EdgeInsets.all(20.r),
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
                    child: Center(
                      child: Column(
                        children: [
                          // CircleAvatar(
                          //   backgroundColor: Color.fromARGB(178, 95, 99, 104),
                          //   radius: 50.r,
                          //   child: Icon(Icons.add_a_photo,
                          //       size: 50.r, color: Colors.white),
                          // ),
                          CircleAvatar(
                            radius: 60.r,
                            backgroundImage: _image == null
                                ? AssetImage('images/WhatsApp.jpeg')
                                : FileImage(_image!),
                            child: IconButton(
                                padding: EdgeInsets.only(left: 70.w, top: 70.h),
                                onPressed: () {
                                  pickImage();
                                },
                                icon: Icon(
                                  Icons.add_a_photo,
                                  color: AppColor.colorblue,
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10.h),
                            child: Text("Profile Picture",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColor.colorblack,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 40.h),
                            width: 320.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: TextFormField(
                              controller: firstNamecontroller,
                              cursorColor: Colors.black,
                              cursorWidth: 1.w,
                              cursorHeight: 30.h,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                              ),
                              focusNode: _focusNode,
                              decoration: InputDecoration(
                                labelText: "First Name",
                                labelStyle: TextStyle(
                                  color: isFocused ? Colors.cyan : Colors.grey,
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
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 25.h),
                            width: 320.w,
                            height: 50.h,
                            child: TextFormField(
                              focusNode: _focusNode2,
                              controller: lastNamecontroller,
                              cursorColor: Colors.black,
                              cursorWidth: 1.w,
                              cursorHeight: 30.h,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                              ),
                              decoration: InputDecoration(
                                labelText: "Last Name",
                                labelStyle: TextStyle(
                                  color: _focusNode2.hasFocus
                                      ? Colors.cyan
                                      : Colors.grey,
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
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 25.h),
                            width: 320.w,
                            height: 50.h,
                            child: TextFormField(
                              readOnly: true,
                              controller: emailcontroller,
                              cursorColor: Colors.black,
                              cursorWidth: 1.w,
                              cursorHeight: 30.h,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                              ),
                              decoration: InputDecoration(
                                labelText: "Email",
                                labelStyle: TextStyle(
                                  color: AppColor.colorhint,
                                  fontSize: 14.sp,
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xff5F6368),
                                        width: 0.5.w,
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
                            margin: EdgeInsets.only(top: 25.h),
                            width: 320.w,
                            height: 50.h,
                            child: TextFormField(
                              focusNode: _focusNode3,
                              controller: phonecontroller,
                              cursorColor: Colors.black,
                              cursorWidth: 1.w,
                              cursorHeight: 30.h,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                              ),
                              decoration: InputDecoration(
                                labelText: "Phone Number",
                                labelStyle: TextStyle(
                                  color: isFocused3 ? Colors.cyan : Colors.grey,
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
                              onPressed: () async {
                                {
                                  final userId = Supabase
                                      .instance.client.auth.currentUser?.id;

                                  await Supabase.instance.client
                                      .from('Users')
                                      .update({
                                        'firstName': firstNamecontroller.text,
                                        'lastName': lastNamecontroller.text,
                                        'email': emailcontroller.text,
                                        'phone': phonecontroller.text,
                                      })
                                      .eq('UID', userId!)
                                      .select(); // <-- مهم جداً
                                }
                              },
                              child: Text(
                                "Save Changes",
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
                                  color:
                                      const Color.fromARGB(255, 210, 210, 210),
                                  style: BorderStyle.solid,
                                  width: 0.8),
                            ),
                            child: MaterialButton(
                              onPressed: () {},
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25.h,
            )
          ],
        ),
      ),
    );
  }
}
