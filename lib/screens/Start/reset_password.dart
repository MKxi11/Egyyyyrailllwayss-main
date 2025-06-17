import 'package:egyrailwayes/constants/app_color.dart';
import 'package:egyrailwayes/constants/main_button.dart';
import 'package:egyrailwayes/constants/text_from_field.dart';
import 'package:egyrailwayes/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPassword extends StatefulWidget {
  final String? email;
  const ResetPassword({super.key, this.email});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  GlobalKey<FormState> formKeyemail = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;
  Future<void> resetPassword() async {
    if (formKeyemail.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      try {
        await supabase.auth.resetPasswordForEmail(emailController.text.trim(),
            redirectTo: 'myapp://reset-password');

        if (mounted) {
          setState(() {
            isLoading = false;
          });

          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Check your email"),
                content: Text("We have sent you a link to reset your password"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      // Get.to(() =>
                      //     ResetPassword(email: emailController.text.trim()));
                    },
                    child: Text("OK"),
                  ),
                ],
              );
            },
          );
        }
      } catch (e) {
        if (mounted) {
          setState(() {
            isLoading = false;
          });

          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Error"),
                content: Text("Something went wrong: $e"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("OK"),
                  ),
                ],
              );
            },
          );
        }
        print("Error: $e");
      }
    }
  }

  // Future<void> resetPassword() async {
  //   if (formKeyemail.currentState!.validate()) {
  //     setState(() {
  //       isLoading = true;
  //     });
  //     try {
  //       await supabase.auth.resetPasswordForEmail(emailController.text.trim());
  //       if (mounted) {
  //         showDialog(
  //             context: context,
  //             builder: (context) {
  //               return AlertDialog(
  //                 title: Text("Check your email"),
  //                 content:
  //                     Text("We have sent you a link to reset your password"),
  //                 actions: [
  //                   TextButton(
  //                     onPressed: () {
  //                       Navigator.of(context).pop();
  //                       Get.to(() =>
  //                           ResetPassword(email: emailController.text.trim()));
  //                     },
  //                     child: Text("OK"),
  //                   ),
  //                 ],
  //               );
  //             });
  //       }
  //     } catch (e) {
  //       print(" Error: $e");
  //       // في حالة حدوث خطأ في الشبكة أو الخادم، ممكن تضيف رسالة للمستخدم
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10.w, top: 10.h),
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Color(0xff0076CB),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    child: Text(
                      "Forgot password",
                      style: TextStyle(
                        color: AppColor.colorblue,
                        fontSize: 22.sp,
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20.h, left: 20.w),
                width: 340.w,
                child: Text(
                  "Enter the email associated with your account.",
                  style: TextStyle(color: AppColor.colorblack, fontSize: 18.sp),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 60.h, left: 20.w),
                child: Text(
                  "Email address",
                  style: TextStyle(color: AppColor.colorblack, fontSize: 20.sp),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20.h, left: 15.w),
                  child: textfromfield(
                    validator: (value) {
                      if (value == "") {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    controller: emailController,
                    hinttext: "abcd@gmail.com",
                    suffixIcon: Icon(
                      Icons.email_outlined,
                      color: AppColor.colorblue,
                    ),
                  )),
              SizedBox(
                height: 330.h,
              ),
              mainbutton(
                  text1: "Reset Password",
                  onPressed: isLoading ? null : () => resetPassword())

              // Container(
              //   margin: EdgeInsets.only(left: 340.w),
              //   width: 128.w,
              //   height: 60.h,
              //   decoration: BoxDecoration(
              //       gradient: LinearGradient(
              //         colors: [
              //           Colors.lightBlueAccent,
              //           Color(0xff0057FF),
              //         ],
              //         begin: Alignment.topLeft,
              //         end: Alignment.bottomRight,
              //       ),
              //       borderRadius: BorderRadius.circular(20.r)),
              //   child: MaterialButton(
              //     onPressed: () {},
              //     child: Text(
              //       "Send",
              //       style: TextStyle(color: AppColor.colorwhite, fontSize: 20.sp),
              //     ),
              //   ),
              // )
            ],
          ),
        ],
      ),
    );
  }
}
