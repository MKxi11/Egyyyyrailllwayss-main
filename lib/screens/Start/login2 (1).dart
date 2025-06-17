import 'package:egyrailwayes/constants/app_color.dart';
import 'package:egyrailwayes/constants/main_button.dart';
import 'package:egyrailwayes/constants/sigup_with.dart';
import 'package:egyrailwayes/constants/text_from_field.dart';
import 'package:egyrailwayes/constants/text_intro.dart';
import 'package:egyrailwayes/main.dart';
import 'package:egyrailwayes/screens/Start/reset_password.dart';
import 'package:egyrailwayes/screens/Start/signup1.dart';
import 'package:egyrailwayes/screens/pages/bottom_bar.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login2 extends StatefulWidget {
  const Login2({super.key});

  @override
  State<Login2> createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  bool value = false;
  bool _isPasswordHidden = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? userid;
  @override
  void initState() {
    super.initState();
    supabase.auth.onAuthStateChange.listen((data) {
      setState(() {
        userid = data.session?.user.id;
      });
    });
  }

  // Future<void> _login() async {
  //   if (!formKey.currentState!.validate()) {
  //     return;
  //   }
  //   try {
  //     final response = await Supabase.instance.client.auth.signInWithPassword(
  //       email: emailController.text.trim(),
  //       password: passwordController.text.trim(),
  //     );

  //     if (response.session != null && response.user != null) {
  //       // تسجيل الدخول ناجح
  //       showDialog(
  //         context: context,
  //         builder: (context) {
  //           return AlertDialog(
  //             title: Image.asset(
  //               "images/user1.png",
  //               height: 160.0.h,
  //             ),
  //             content: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 Text(
  //                   "Log In Successfully!",
  //                   style: TextStyle(
  //                     color: AppColor.colorblue,
  //                     fontSize: 20.sp,
  //                   ),
  //                 ),
  //                 SizedBox(height: 10.h),
  //                 Text(
  //                   "You will be directed to the home page",
  //                   style: TextStyle(
  //                     color: AppColor.colorblack,
  //                     fontSize: 16.sp,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             actions: [
  //               TextButton(
  //                 onPressed: () {
  //                   Navigator.of(context).pushReplacement(
  //                     MaterialPageRoute(builder: (context) => Bottombar()),
  //                   );
  //                 },
  //                 child: Text(
  //                   "OK",
  //                   style: TextStyle(
  //                     color: AppColor.colorblue,
  //                     fontSize: 16.sp,
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           );
  //         },
  //       );
  //     } else {
  //       // فشل تسجيل الدخول
  //       showDialog(
  //         context: context,
  //         builder: (context) {
  //           return AlertDialog(
  //             title: Text("Login Failed"),
  //             content: Text("Email or password is incorrect."),
  //             actions: [
  //               TextButton(
  //                 onPressed: () => Navigator.of(context).pop(),
  //                 child: Text("OK"),
  //               ),
  //             ],
  //           );
  //         },
  //       );
  //     }
  //   } on AuthException catch (e) {
  //     showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text("Login Failed"),
  //           content: Text(e.message),
  //           actions: [
  //             TextButton(
  //               onPressed: () => Navigator.of(context).pop(),
  //               child: Text("OK"),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   } catch (e) {
  //     showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text("Error"),
  //           content: Text("An unexpected error occurred. Please try again."),
  //           actions: [
  //             TextButton(
  //               onPressed: () => Navigator.of(context).pop(),
  //               child: Text("OK"),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   }
  // }

// Original login
  Future<void> login() async {
    if (!formKey.currentState!.validate()) {
      return; // Stop execution if form validation fails.
    }

    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (response.session != null) {
        // Use a logging framework in production, e.g., debugPrint
        debugPrint("Login successful");
        if (!mounted) return;
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Bottombar()));
      } else {
        debugPrint("Login failed: ${response.error?.message}");
        if (!mounted) return;
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Login Failed"),
              content: Text(response.error?.message ?? "Unknown error"),
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
    } catch (e) {
      debugPrint("An error occurred: $e");
      if (!mounted) return;
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("An error occurred. Please try again."),
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
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  // Login() async {
  //   if (!formKey.currentState!.validate()) {
  //     return; // إذا كان فيه مشكلة في الحقول (أو الحقول فاضية) هيوقف الدالة ويمنع الانتقال.
  //   }

  //   try {
  //     final response = await Supabase.instance.client.auth.signInWithPassword(
  //       email: emailController.text.trim(),
  //       password: passwordController.text.trim(),
  //     );

  //     // لو عملية التسجيل كانت ناجحة:
  //     if (response.user != null) {
  //       print("Login successful");
  //       showDialog(
  //           context: context,
  //           builder: (context) {
  //             return AlertDialog(
  //               title: Image.asset(
  //                 "images/user1.png",
  //                 height: 160.0.h,
  //               ),
  //               content: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   Container(
  //                       child: Text(
  //                     "Log In Successfully!",
  //                     style: TextStyle(
  //                       color: AppColor.colorblue,
  //                       fontSize: 20.sp,
  //                     ),
  //                   )),
  //                   Container(
  //                       margin: EdgeInsets.only(top: 10.h),
  //                       child: Text(
  //                         "You will be directed to the home page",
  //                         style: TextStyle(
  //                           color: AppColor.colorblack,
  //                           fontSize: 16.sp,
  //                         ),
  //                       )),
  //                 ],
  //               ),
  //               actions: [
  //                 TextButton(
  //                   onPressed: () {
  //                     Navigator.of(context).pushReplacement(
  //                         MaterialPageRoute(builder: (context) => Bottombar()));
  //                   },
  //                   child: Text("OK",
  //                       style: TextStyle(
  //                         color: AppColor.colorblue,
  //                         fontSize: 16.sp,
  //                       )),
  //                 ),
  //               ],
  //             );
  //           });
  //     } else {
  //       print("Login failed: ${response.error?.message}");
  //       // في حالة فشل الدخول (ممكن تضيف رسالة أو إشعار هنا)
  //     }
  //   } catch (e) {
  //     print("Login error: ${e.toString()}");
  //     // في حالة حدوث خطأ في الشبكة أو الخادم، ممكن تضيف رسالة للمستخدم
  //   }
  // }

  // Future<void> signInWithFacebook() async {
  //   final LoginResult result = await FacebookAuth.instance.login();

  //   if (result.status == LoginStatus.success) {
  //     final accessToken = result.accessToken!.token;

  //     // سجل الدخول إلى Supabase باستخدام accessToken من Facebook
  //     final supabase = Supabase.instance.client;

  //     final response = await supabase.auth.signInWithIdToken(
  //       provider: OAuthProvider.facebook,
  //       idToken: accessToken,
  //     );

  //     // تحقق من النتيجة
  //     final session = response.session;
  //     if (session != null) {
  //       print('تم تسجيل الدخول بنجاح!');
  //     } else {
  //       print('فشل تسجيل الدخول!');
  //     }
  //   } else {
  //     print('فشل Facebook login: ${result.message}');
  //   }
  // }

  // Future<void> _googleSignIn() async {
  //   ///
  //   /// Web Client ID that you registered with Google Cloud.
  //   const webClientId =
  //       '707965051749-4k10bghhk6itoankhqo6dp4raelgqjju.apps.googleusercontent.com';

  //   ///
  //   /// iOS Client ID that you registered with Google Cloud.
  //   const iosClientId =
  //       '707965051749-2e4jal893l6gmquj693hqaa5ragr3c9p.apps.googleusercontent.com';

  //   // Google sign in on Android will work without providing the Android
  //   // Client ID registered on Google Cloud.

  //   final GoogleSignIn googleSignIn = GoogleSignIn(
  //     clientId: iosClientId,
  //     serverClientId: webClientId,
  //   );
  //   final googleUser = await googleSignIn.signIn();
  //   final googleAuth = await googleUser!.authentication;
  //   final accessToken = googleAuth.accessToken;
  //   final idToken = googleAuth.idToken;

  //   if (accessToken == null) {
  //     throw 'No Access Token found.';
  //   }
  //   if (idToken == null) {
  //     throw 'No ID Token found.';
  //   }

  //   await supabase.auth.signInWithIdToken(
  //     provider: OAuthProvider.google,
  //     idToken: idToken,
  //     accessToken: accessToken,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 35.h,
                ),
                textintro(
                  text: "Welcome back 👋",
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: 320.w,
                  margin: EdgeInsets.only(left: 30.w),
                  child: Text(
                    "Please enter your email & password to login.",
                    style: TextStyle(
                      color: AppColor.colorhint,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                textfromfield(
                  controller: emailController,
                  validator: (value) {
                    if (value == "") {
                      return 'Please enter your email';
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
                SizedBox(
                  height: 25.h,
                ),
                textfromfield(
                    controller: passwordController,
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
                  height: 5.h,
                ),
                Container(
                  margin: EdgeInsets.only(left: 60.w),
                  child: CheckboxListTile(
                      activeColor: AppColor.colorblue,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(
                        "Remember me",
                        style: TextStyle(
                            color: AppColor.colorblack, fontSize: 15.sp),
                      ),
                      value: value,
                      onChanged: (val) {
                        setState(() {
                          value = val ?? false;
                        });
                      }),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Divider(
                  color: AppColor.colordivider,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Container(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ResetPassword()));
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                            color: AppColor.colorblue, fontSize: 16.sp),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Container(
                    child: RichText(
                        text: TextSpan(
                            text: "Don't have an account?",
                            style: TextStyle(
                                color: AppColor.colorblack, fontSize: 17.w),
                            children: [
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Signup1()));
                                },
                              text: " Sign Up",
                              style: TextStyle(
                                  color: AppColor.colorblue, fontSize: 17.sp))
                        ])),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
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
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    signupwith(
                      onTap: () async {
                        try {
                          const webClientId =
                              '707965051749-ammkgu1u361t9gfsdf8pdv9jn23t3t2q.apps.googleusercontent.com';
                          const iosClientId =
                              'my-ios.apps.googleusercontent.com';

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

                          final response =
                              await supabase.auth.signInWithIdToken(
                            provider: OAuthProvider.google,
                            idToken: idToken,
                            accessToken: accessToken,
                          );

                          if (response.session != null) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => Bottombar()));
                          } else {
                            _showErrorSnackBar(
                                "Unable to authenticate with Google.");
                          }
                        } catch (e) {
                          _showErrorSnackBar(
                              "Google sign-in failed: ${e.toString()}");
                        }
                      },
                      image1: "images/google.png",
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    // signupwith(
                    //   onTap: () {},
                    //   image1: "images/apple.png",
                    // ),
                    // SizedBox(
                    //   width: 20.w,
                    // ),
                    signupwith(
                      onTap: () {},
                      image1: "images/facebook11111.png",
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Divider(
                  color: AppColor.colordivider,
                ),
                SizedBox(
                  height: 15.h,
                ),
                mainbutton(
                    text1: "Log In",
                    onPressed: () {
                      login();
                      //validator
                      // if (formKey.currentState!.validate()) {
                      //   print("valid");
                      //   showDialog(
                      //       context: context,
                      //       builder: (context) {
                      //         return AlertDialog(
                      //           title: Image.asset(
                      //             "images/user1.png",
                      //             height: 160.0,
                      //           ),
                      //           content: Column(
                      //             mainAxisSize: MainAxisSize.min,
                      //             children: [
                      //               Container(
                      //                   child: Text(
                      //                 "Log In Successfully!",
                      //                 style: TextStyle(
                      //                   color: AppColor.colorblue,
                      //                   fontSize: 20,
                      //                 ),
                      //               )),
                      //               Container(
                      //                   margin: EdgeInsets.only(top: 10),
                      //                   child: Text(
                      //                     "You will be directed to the home page",
                      //                     style: TextStyle(
                      //                       color: AppColor.colorblack,
                      //                       fontSize: 16,
                      //                     ),
                      //                   )),
                      //             ],
                      //           ),
                      //           actions: [
                      //             TextButton(
                      //               onPressed: () {
                      //                 Navigator.of(context).pop();
                      //               },
                      //               child: Text("OK",
                      //                   style: TextStyle(
                      //                     color: AppColor.colorblue,
                      //                     fontSize: 16,
                      //                   )),
                      //             ),
                      //           ],
                      //         );
                      //       });
                      // } else {
                      //   print("not valid");
                      // }
                      // showDialog(
                      //     context: context,
                      //     builder: (context) {
                      //       return AlertDialog(
                      //         title: Image.asset(
                      //           "images/user1.png",
                      //           height: 160.0.h,
                      //         ),
                      //         content: Column(
                      //           mainAxisSize: MainAxisSize.min,
                      //           children: [
                      //             Container(
                      //                 child: Text(
                      //               "Log In Successfully!",
                      //               style: TextStyle(
                      //                 color: AppColor.colorblue,
                      //                 fontSize: 20.sp,
                      //               ),
                      //             )),
                      //             Container(
                      //                 margin: EdgeInsets.only(top: 10.h),
                      //                 child: Text(
                      //                   "You will be directed to the home page",
                      //                   style: TextStyle(
                      //                     color: AppColor.colorblack,
                      //                     fontSize: 16.sp,
                      //                   ),
                      //                 )),
                      //           ],
                      //         ),
                      //         actions: [
                      //           TextButton(
                      //             onPressed: () {
                      //               Navigator.of(context).pushReplacement(
                      //                   MaterialPageRoute(
                      //                       builder: (context) => Bottombar()));
                      //             },
                      //             child: Text("OK",
                      //                 style: TextStyle(
                      //                   color: AppColor.colorblue,
                      //                   fontSize: 16.sp,
                      //                 )),
                      //           ),
                      //         ],
                      //       );
                      //     });
                      //   // Navigator.of(context)
                      //   //     .push(MaterialPageRoute(builder: (context) => Signup1()));
                    }),
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

extension on AccessToken {
  get token => null;
}

extension on AuthResponse {
  get error => null;
}
