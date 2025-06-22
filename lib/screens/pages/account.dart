import 'package:egyrailwayes/constants/app_color.dart';
import 'package:egyrailwayes/constants/bar.dart';
import 'package:egyrailwayes/screens/Start/welcome.dart';
import 'package:egyrailwayes/screens/pages/find.dart';
import 'package:egyrailwayes/screens/profile/edit_profile.dart';
import 'package:egyrailwayes/screens/profile/help_support.dart';
import 'package:egyrailwayes/screens/profile/myprofile.dart';
import 'package:egyrailwayes/screens/profile/update_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Bar(),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10.h),
            child: ListTile(
              leading: FutureBuilder<User?>(
                future: Future.value(Supabase.instance.client.auth.currentUser),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircleAvatar(
                      radius: 30.r,
                      backgroundColor: Colors.grey[300],
                      child: CircularProgressIndicator(strokeWidth: 2),
                    );
                  } else if (snapshot.hasError || snapshot.data == null) {
                    return CircleAvatar(
                      radius: 30.r,
                      child:
                          Icon(Icons.person, size: 20.sp, color: Colors.black),
                    );
                  } else {
                    final avatarUrl =
                        snapshot.data!.userMetadata?['avatar_url'];

                    if (avatarUrl != null && avatarUrl.isNotEmpty) {
                      return CircleAvatar(
                        radius: 30.r,
                        backgroundImage: NetworkImage(avatarUrl),
                      );
                    } else {
                      return CircleAvatar(
                        radius: 30.r,
                        child: Icon(Icons.person,
                            size: 20.sp, color: Colors.black),
                      );
                    }
                  }
                },
              ),
              title: Text(
                Supabase.instance.client.auth.currentUser
                        ?.userMetadata?['full_name'] ??
                    "No Name",
                style: TextStyle(fontSize: 16.sp, color: Colors.black),
              ),
              subtitle: Text(
                Supabase.instance.client.auth.currentUser?.email ?? "No Email",
                style: TextStyle(fontSize: 11.sp, color: Colors.black),
              ),
            ),
          ),
          // Container(
          //   margin: EdgeInsets.only(top: 10.h, left: 5.w),
          //   child: ListTile(
          //     leading: CircleAvatar(
          //       backgroundColor: Colors.black,
          //       radius: 25.r,
          //       child: (Supabase.instance.client.auth.currentUser
          //                       ?.userMetadata?['avatar_url'] !=
          //                   null &&
          //               Supabase.instance.client.auth.currentUser
          //                       ?.userMetadata?['avatar_url'] !=
          //                   '')
          //           ? CircleAvatar(
          //               backgroundImage: NetworkImage(
          //                 Supabase.instance.client.auth.currentUser!
          //                     .userMetadata!['avatar_url'],
          //               ),
          //               radius: 25.r,
          //             )
          //           : Icon(
          //               Icons.person,
          //               size: 30.sp,
          //               color: Colors.white,
          //             ),
          //     ),
          //     title: Text(
          //       Supabase.instance.client.auth.currentUser
          //               ?.userMetadata?['full_name'] ??
          //           "No Name",
          //       style: TextStyle(fontSize: 17.sp, color: Colors.black),
          //     ),
          //     subtitle: Text(
          //       Supabase.instance.client.auth.currentUser?.email ?? "No Email",
          //       style: TextStyle(color: AppColor.colorhint, fontSize: 13.sp),
          //     ),
          //   ),
          // ),
          SizedBox(height: 20.h),
          Row(
            children: [
              SizedBox(width: 10.w),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "General",
                  style: TextStyle(color: Colors.grey[600], fontSize: 17.sp),
                ),
              ),
              Expanded(
                  child: Divider(thickness: 1.sp, color: Colors.grey[300])),
            ],
          ),
          SizedBox(height: 10.h),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Myprofile()));
            },
            child: ListTile(
              leading: Icon(
                Icons.person_outline,
                color: Colors.black,
                size: 25.sp,
              ),
              title: Text(
                "My Profile",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Myprofile()));
                },
                icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => EditProfile()));
            },
            child: ListTile(
              leading: Icon(
                Icons.edit_outlined,
                color: Colors.black,
                size: 25.sp,
              ),
              title: Text(
                "Edit Profile",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => EditProfile()));
                },
                icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => UpdatePassword()));
            },
            child: ListTile(
              leading: Icon(
                Icons.lock_outline,
                color: Colors.black,
                size: 25.sp,
              ),
              title: Text(
                "Update Password",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UpdatePassword()));
                },
                icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
              ),
            ),
          ),
          // SizedBox(height: 20.h),
          // InkWell(
          //   onTap: () {},
          //   child: ListTile(
          //     leading: Icon(
          //       Icons.book_online_outlined,
          //       color: Colors.black,
          //       size: 25.sp,
          //     ),
          //     title: Text(
          //       "My Booking",
          //       style: TextStyle(
          //         fontSize: 18.sp,
          //         color: Colors.black,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //     trailing: IconButton(
          //       onPressed: () {},
          //       icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
          //     ),
          //   ),
          // ),
          SizedBox(height: 20.h),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Find()));
            },
            child: ListTile(
              leading: Icon(
                Icons.train_outlined,
                color: Colors.black,
                size: 25.sp,
              ),
              title: Text(
                "Find Train",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Find()));
                },
                icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HelpSupport()));
            },
            child: ListTile(
              leading: Icon(
                Icons.help_outline,
                color: Colors.black,
                size: 25.sp,
              ),
              title: Text(
                "Help & Support",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HelpSupport()));
                },
                icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          InkWell(
            onTap: () async {
              try {
                await Supabase.instance.client.auth
                    .signOut(); // ✨ لازم await هنا
                print("User logged out");

                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Welcome()),
                  (route) => false,
                );
              } catch (e) {
                print("Logout failed: $e");
              }
            },
            child: ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.logout_outlined,
                  color: Colors.red,
                  size: 25.sp,
                ),
              ),
              title: Text(
                "Logout",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
