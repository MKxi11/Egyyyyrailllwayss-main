import 'package:egyrailwayes/constants/app_color.dart';
import 'package:egyrailwayes/constants/sigup_with.dart';
import 'package:egyrailwayes/constants/text_from_field.dart';
import 'package:egyrailwayes/constants/text_intro.dart';
import 'package:egyrailwayes/constants/main_button.dart';
import 'package:egyrailwayes/main.dart';
import 'package:egyrailwayes/screens/Start/login2%20(1).dart';
import 'package:egyrailwayes/screens/pages/bottom_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Signup1 extends StatefulWidget {
  const Signup1({super.key});

  @override
  State<Signup1> createState() => _Signup1State();
}

class _Signup1State extends State<Signup1> {
  bool value = false; // For terms checkbox
  bool _isPasswordHidden = true;
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  static final TextEditingController phoneController = TextEditingController();

  String? userid;

  @override
  void initState() {
    super.initState();
    _setupAuthListener();
  }

  Future<void> _setupAuthListener() async {
    try {
      supabase.auth.onAuthStateChange.listen((data) {
        setState(() {
          userid = data.session?.user.id;
        });
      });
    } catch (e) {
      _showErrorSnackBar("Error setting up auth listener: ${e.toString()}");
    }
  }

  Future<void> Signup() async {
    if (!formKey2.currentState!.validate()) {
      return;
    }

    if (passwordController.text.trim().length < 6) {
      _showErrorSnackBar("Password must be at least 6 characters long.");
      return;
    }

    if (!value) {
      _showErrorSnackBar("You must agree to the terms and privacy policy.");
      return;
    }

    try {
      final response = await Supabase.instance.client.auth.signUp(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (response.user != null) {
        print("Signup successful");
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Bottombar()),
        );
      } else {
        _showErrorSnackBar("Signup failed: No user returned.");
      }
    } on PostgrestException catch (error) {
      if (error.message.contains('duplicate key value') ||
          error.message.toLowerCase().contains('already registered')) {
        _showErrorSnackBar("This email is already registered. Please log in.");
      } else {
        _showErrorSnackBar("Signup error: ${error.message}");
      }
    } catch (e) {
      _showErrorSnackBar("Signup error: ${e.toString()}");
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  bool isEmail(String input) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(input);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorwhite,
      body: Form(
        key: formKey2,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          children: [
            SizedBox(height: 40.h),
            textintro(text: "Hello there 👋"),
            SizedBox(height: 10.h),
            Text(
              "Please enter your email & password to create an account.",
              style: TextStyle(
                color: AppColor.colorhint,
                fontSize: 15.sp,
              ),
            ),
            SizedBox(height: 30.h),
            textfromfield(
              controller: emailController,
              validator: (value1) {
                if (value1 == null || value1.isEmpty) {
                  return "Please enter your email";
                }
                if (!isEmail(value1)) {
                  return "Please enter a valid email";
                }
                return null;
              },
              hinttext: "Email",
              suffixIcon: Icon(
                Icons.email_outlined,
                color: Color(0xff0057FF),
                size: 20.0.sp,
              ),
            ),
            SizedBox(height: 15.h),
            textfromfield(
              controller: fullNameController,
              validator: (value1) {
                if (value1 == null || value1.isEmpty) {
                  return "Please enter your Name";
                }
                return null;
              },
              hinttext: "Full Name",
              suffixIcon: Icon(
                Icons.person,
                color: Color(0xff0057FF),
                size: 20.0.sp,
              ),
            ),
            SizedBox(height: 15.h),
            textfromfield(
              controller: phoneController,
              validator: (value1) {
                if (value1 == null || value1.isEmpty) {
                  return "Please enter your Phone";
                }
                return null;
              },
              hinttext: "Phone",
              suffixIcon: Icon(
                Icons.phone,
                color: Color(0xff0057FF),
                size: 20.0.sp,
              ),
            ),
            SizedBox(height: 15.h),
            textfromfield(
              controller: passwordController,
              validator: (value1) {
                if (value1 == null || value1.isEmpty) {
                  return "Please enter your Password";
                }
                if (value1.trim().length < 6) {
                  return "Password must be at least 6 characters long";
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
                  _isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                  color: Color(0xff0057FF),
                  size: 20.0.sp,
                ),
              ),
            ),
            SizedBox(height: 5.h),
            textfromfield(
              controller: confirmPasswordController,
              validator: (value1) {
                if (value1 == null || value1.isEmpty) {
                  return "Please confirm your password";
                } else if (value1 != passwordController.text) {
                  return "Password doesn't match";
                }
                return null;
              },
              obscureText: _isPasswordHidden,
              hinttext: "Confirm your password",
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isPasswordHidden = !_isPasswordHidden;
                  });
                },
                icon: Icon(
                  _isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                  color: Color(0xff0057FF),
                  size: 20.0.sp,
                ),
              ),
            ),
            SizedBox(height: 25.h),
            CheckboxListTile(
              activeColor: AppColor.colorblue,
              controlAffinity: ListTileControlAffinity.leading,
              title: RichText(
                text: TextSpan(
                  text: "I agree to Railify",
                  style: TextStyle(color: AppColor.colorblack, fontSize: 15.sp),
                  children: [
                    TextSpan(
                      text: " Terms. & Privacy Policy",
                      style: TextStyle(color: AppColor.colorblue, fontSize: 15.sp),
                    ),
                  ],
                ),
              ),
              value: value,
              onChanged: (val) {
                setState(() {
                  value = val ?? false;
                });
              },
            ),
            SizedBox(height: 15.h),
            Divider(color: AppColor.colordivider),
            SizedBox(height: 20.h),
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Already have an account?",
                  style: TextStyle(color: AppColor.colorblack, fontSize: 16.sp),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Login2()),
                          );
                        },
                      text: " Log in",
                      style: TextStyle(color: AppColor.colorblue, fontSize: 16.sp),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 25.h),
            Row(
              children: <Widget>[
                Expanded(
                  child: Divider(
                    thickness: 1.w,
                    color: Colors.grey[300],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "or continue with",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 1.w,
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                signupwith(
                  onTap: () async {
                    try {
                      const webClientId =
                          '707965051749-ammkgu1u361t9gfsdf8pdv9jn23t3t2q.apps.googleusercontent.com';

                      final GoogleSignIn googleSignIn = GoogleSignIn(
                        serverClientId: webClientId,
                      );
                      final googleUser = await googleSignIn.signIn();

                      if (googleUser == null) {
                        throw 'Google sign-in was canceled.';
                      }

                      final googleAuth = await googleUser.authentication;
                      final accessToken = googleAuth.accessToken;
                      final idToken = googleAuth.idToken;

                      if (accessToken == null) {
                        throw 'No Access Token found.';
                      }
                      if (idToken == null) {
                        throw 'No ID Token found.';
                      }

                      final response = await supabase.auth.signInWithIdToken(
                        provider: OAuthProvider.google,
                        idToken: idToken,
                        accessToken: accessToken,
                      );

                      if (response.session != null) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Bottombar()),
                        );
                      } else {
                        _showErrorSnackBar("Unable to authenticate with Google.");
                      }
                    } catch (e) {
                      _showErrorSnackBar("Google sign-in failed: ${e.toString()}");
                    }
                  },
                  image1: "images/google.png",
                ),
                SizedBox(width: 20.w),
                signupwith(
                  onTap: () {},
                  image1: "images/facebook11111.png",
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Divider(color: AppColor.colordivider),
            SizedBox(height: 25.h),
            mainbutton(
              text1: "Sign Up",
              onPressed: Signup,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
