import 'package:egyrailwayes/constants/app_color.dart';
import 'package:egyrailwayes/constants/main_button.dart';
import 'package:egyrailwayes/constants/name_container.dart';
import 'package:egyrailwayes/constants/profile_button.dart';
import 'package:egyrailwayes/screens/Start/welcome.dart';

import 'package:egyrailwayes/screens/pages/bottom_bar.dart';
import 'package:egyrailwayes/screens/profile/edit_profile.dart';
import 'package:egyrailwayes/screens/profile/update_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({super.key});

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  // Future<List<dynamic>> fetchUsers() async {
  //   final response = await Supabase.instance.client
  //       .from('reservations')
  //       .select("*")
  //       .order('created_at', ascending: false);
  //   return response;
  // }
  Future<String> fetchFirstName() async {
    final user = Supabase.instance.client.auth.currentUser;

    if (user == null) {
      throw Exception('User not logged in');
    }

    final firstName = user.userMetadata?['firstName'];
    return firstName ?? 'No Name';
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
              Column(
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
                          child: Text("Profile",
                              style: TextStyle(
                                fontSize: 24.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(left: 17.w, top: 10.h),
                          child: Text("Manage your account settings",
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: 5.r),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: double.infinity,
                          height: 820.h,
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
                          child: Column(
                            children: [
                              Container(
                                child: ListTile(
                                  leading: FutureBuilder<User?>(
                                    future: Future.value(Supabase
                                        .instance.client.auth.currentUser),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return CircleAvatar(
                                          radius: 30.r,
                                          backgroundColor: Colors.grey[300],
                                          child: CircularProgressIndicator(
                                              strokeWidth: 2),
                                        );
                                      } else if (snapshot.hasError ||
                                          snapshot.data == null) {
                                        return CircleAvatar(
                                          radius: 30.r,
                                          child: Icon(Icons.person,
                                              size: 20.sp, color: Colors.black),
                                        );
                                      } else {
                                        final avatarUrl = snapshot
                                            .data!.userMetadata?['avatar_url'];

                                        if (avatarUrl != null &&
                                            avatarUrl.isNotEmpty) {
                                          return CircleAvatar(
                                            radius: 30.r,
                                            backgroundImage:
                                                NetworkImage(avatarUrl),
                                          );
                                        } else {
                                          return CircleAvatar(
                                            radius: 30.r,
                                            child: Icon(Icons.person,
                                                size: 20.sp,
                                                color: Colors.black),
                                          );
                                        }
                                      }
                                    },
                                  ),
                                  title: Text(
                                    Supabase.instance.client.auth.currentUser
                                            ?.userMetadata?['full_name'] ??
                                        "No Name",
                                    style: TextStyle(
                                        fontSize: 16.sp, color: Colors.black),
                                  ),
                                  subtitle: Text(
                                    Supabase.instance.client.auth.currentUser
                                            ?.email ??
                                        "No Email",
                                    style: TextStyle(
                                        fontSize: 11.sp, color: Colors.black),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.h),
                              Container(
                                // padding: EdgeInsets.all(20.r),
                                padding: EdgeInsets.only(left: 15.w, top: 20.h),
                                width: double.infinity - 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: const Color.fromARGB(255, 210, 210,
                                        210), // Set the border color
                                    width: 0.8, // Set the border width
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Personal Information",
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    name_container(
                                      text: "First Name",
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 5.h),
                                        child: Text(
                                          Supabase
                                                  .instance
                                                  .client
                                                  .auth
                                                  .currentUser
                                                  ?.userMetadata?['full_name']
                                                  ?.split(" ")
                                                  .first ??
                                              "No First Name",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              color: Colors.black),
                                        )),
                                    name_container(
                                      text: "Last Name",
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5.h),
                                      child: Text(
                                        Supabase
                                                .instance
                                                .client
                                                .auth
                                                .currentUser
                                                ?.userMetadata?['full_name']
                                                ?.split(" ")
                                                .last ??
                                            "No Last Name",
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    name_container(
                                      text: " Email",
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5.h),
                                      child: Text(
                                        Supabase.instance.client.auth
                                                .currentUser?.email ??
                                            "No Email",
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    name_container(
                                      text: "Phone Number",
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5.h),
                                      child: Text(
                                        Supabase
                                                .instance
                                                .client
                                                .auth
                                                .currentUser
                                                ?.userMetadata?['phone'] ??
                                            "Not Provided",
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20.h),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.h),
                              Container(
                                // padding: EdgeInsets.all(20.r),
                                padding: EdgeInsets.only(top: 20.h),
                                width: double.infinity - 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: const Color.fromARGB(255, 210, 210,
                                        210), // Set the border color
                                    width: 0.8, // Set the border width
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Account Settings",
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    SizedBox(height: 40.h),
                                    profile_button(
                                      onPressed: () {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditProfile()));
                                      },
                                      text: "Edit Profile",
                                      colortext: Colors.white,
                                      icon: Icons.edit_outlined,
                                      coloricon: AppColor.colorwhite,
                                      gradient: LinearGradient(
                                          colors: [
                                            Colors.cyan,
                                            const Color.fromARGB(
                                                255, 14, 70, 117),
                                          ],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight),
                                    ),
                                    SizedBox(height: 25.h),

                                    // profile_button(
                                    //   onPressed: () {},
                                    //   text: "Edit Profile",
                                    //   colortext: AppColor.colorwhite,
                                    //   icon: Icons.edit_outlined,
                                    //   coloricon: AppColor.colorwhite,
                                    //   gradient: LinearGradient(
                                    //     colors: [
                                    //       Colors.cyan,
                                    //       const Color.fromARGB(
                                    //           255, 14, 70, 117),
                                    //     ],
                                    //     begin: Alignment.bottomLeft,
                                    //     end: Alignment.topRight,
                                    //   ),
                                    // ),
                                    profile_button(
                                      onPressed: () {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UpdatePassword()));
                                      },
                                      text: "Change Password",
                                      colortext: Colors.black,
                                      icon: Icons.lock_outline,
                                      coloricon: AppColor.colorblack,
                                      colorcontainer: AppColor.colorwhite,
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 210, 210, 210),
                                          style: BorderStyle.solid,
                                          width: 0.8),
                                    ),
                                    SizedBox(height: 25.h),
                                    profile_button(
                                      onPressed: () async {
                                        try {
                                          await Supabase.instance.client.auth
                                              .signOut(); // ✨ لازم await هنا
                                          print("User logged out");

                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Welcome()),
                                            (route) => false,
                                          );
                                        } catch (e) {
                                          print("Logout failed: $e");
                                        }
                                      },
                                      text: "Logout",
                                      fontWeight: FontWeight.bold,
                                      colortext: Colors.red,
                                      icon: Icons.logout_outlined,
                                      coloricon: Colors.red,
                                      colorcontainer: AppColor.colorwhite,
                                      border: Border.all(
                                          color: Colors.red,
                                          style: BorderStyle.solid,
                                          width: 0.8),
                                    ),
                                    SizedBox(height: 30.h),
                                  ],
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
