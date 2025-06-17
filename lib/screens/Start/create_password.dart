import 'package:egyrailwayes/constants/app_color.dart';
import 'package:egyrailwayes/constants/main_button.dart';
import 'package:egyrailwayes/constants/text_from_field.dart';
import 'package:egyrailwayes/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({super.key});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  bool _isPasswordHidden = true;
  bool _isPasswordHidden2 = true;
  TextEditingController resetTokenController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorblue,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Reset Password",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10.w, top: 10.h),
                child: Text("Create a new password",
                    style: TextStyle(
                      fontSize: 22.sp,
                      color: AppColor.colorblue,
                    )),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.w, top: 10.h),
                width: 340.w,
                child: Text(
                    "Enter the reset token you received in your email and create a new password.",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: AppColor.colorblack,
                    )),
              ),
              SizedBox(
                height: 40.h,
              ),
              textfromfield(
                validator: (value) {
                  if (value == "") {
                    return 'Please enter your token';
                  }
                  return null;
                },
                hinttext: "Reset Token",
                controller: resetTokenController,
                suffixIcon: Icon(Icons.key_outlined, color: AppColor.colorblue),
              ),
              SizedBox(
                height: 25.h,
              ),
              textfromfield(
                  controller: newPasswordController,
                  validator: (value) {
                    if (value == "") {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  obscureText: _isPasswordHidden,
                  hinttext: "Password",
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
                        color: Color(0xff0057FF),
                        size: 20.0.sp,
                      ))),
              SizedBox(
                height: 25.h,
              ),
              textfromfield(
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value == "") {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  obscureText: _isPasswordHidden2,
                  hinttext: "Confirm Password",
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
                        color: Color(0xff0057FF),
                        size: 20.0.sp,
                      ))),
              SizedBox(
                height: 220.h,
              ),
              mainbutton(text1: "Reset Password", onPressed: () async {
                final session = supabase.auth.currentSession;
                if (session != null) {
                  await supabase.auth.updateUser(
                    UserAttributes(password: newPasswordController.text),
                  );
                }
              }),
            ],
          )
        ],
      ),
    );
  }
}
