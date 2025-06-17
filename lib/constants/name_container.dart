import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class name_container extends StatelessWidget {
  final String text;
  const name_container({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: Text(text,
          style: TextStyle(fontSize: 13.sp, color: Color(0xff5F6368))),
    );
  }
}
