import 'package:egyrailwayes/constants/app_color.dart';
import 'package:egyrailwayes/constants/bar.dart';
import 'package:egyrailwayes/constants/main_button.dart';
import 'package:egyrailwayes/screens/pages/bottom_bar.dart';
import 'package:egyrailwayes/screens/pages/completeVisa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Completevisa extends StatefulWidget {
  const Completevisa({super.key});

  @override
  State<Completevisa> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Completevisa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Bar(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            Text(
              "Please Enter your card details",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.sp),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    margin: EdgeInsets.all(20),
                    height: 250.h,
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
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(children: [
                        _buildTextField(
                          label: 'Cardholder Name',
                          hint: 'Enter cardholder name',
                          icon: Icons.person,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter cardholder name';
                            }
                            return null;
                          },
                        ),
                        _buildTextField(
                          label: 'Card Number ',
                          hint: 'Enter card Number',
                          icon: Icons.person,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter card number ';
                            }
                            return null;
                          },
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: _buildTextField(
                                label: 'Expiry Date',
                                hint: '18/30',
                                icon: Icons.calendar_month,
                                keyboardType: TextInputType.datetime,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter expiry date';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: _buildTextField(
                                label: 'CVV',
                                hint: '123',
                                icon: Icons.lock,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter CVV';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        )
                      ]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.h,
                ),
                mainbutton(
                    text1: "Save",
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Bottombar()));
                    }),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  "Or Pay with",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Container(
                  margin: EdgeInsets.all(50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: 80.h,
                          width: 80.w,
                          child: Image.asset("images/voda.jpg")),
                      SizedBox(
                          height: 80.h,
                          width: 80.w,
                          child: Image.asset("images/go.jpg")),
                      SizedBox(
                          height: 80.h,
                          width: 80.w,
                          child: Image.asset("images/apple.jpg")),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildTextField({
  required String label,
  required String hint,
  required IconData icon,
  TextInputType? keyboardType,
  String? prefixText,
  String? Function(String?)? validator,
}) {
  {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixText: prefixText,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        keyboardType: keyboardType,
        validator: validator,
      ),
    );
  }
}
