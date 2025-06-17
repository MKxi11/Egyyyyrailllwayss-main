import 'package:egyrailwayes/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class signupwith extends StatefulWidget {
  final String? image1;
  final void Function()? onTap;
  const signupwith({
    super.key,
    required this.image1,
    this.onTap,
  });

  @override
  State<signupwith> createState() => _signupwithState();
}

class _signupwithState extends State<signupwith> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Center(
        child: Container(
          width: 45.w,
          height: 45.h,
          decoration: BoxDecoration(
            color: AppColor.colorwhite,
            borderRadius: BorderRadius.circular(50.r),
            border: Border.all(
                color: Color.fromARGB(136, 95, 99, 104),
                style: BorderStyle.solid),
          ),
          child: Image.asset(
            widget.image1!,
            width: 50.w,
            height: 50.h,
          ),
        ),
      ),
    );
  }
}
