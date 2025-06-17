import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class textfield_for_message extends StatelessWidget {
  final String hintText;
  final double width;
  final double height;
  final String Function(String?)? validator;
  // final bool? expands;
  // final int? maxLines;
  // final int? minLines;
  // final TextAlignVertical? textAlignVertical;
  const textfield_for_message({
    super.key,
    required this.hintText,
    required this.width,
    required this.height,
    this.validator,
    // this.expands,
    // this.maxLines,
    // this.minLines,
    // this.textAlignVertical,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(left: 10.w, top: 10.h),
      child: TextFormField(
        validator: validator,

        cursorColor: Colors.cyan,
        cursorWidth: 1.w,
        cursorHeight: 30.h,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14.sp,
        ),

        // focusNode: focusNode,
        decoration: InputDecoration(
          // labelText: labelText,
          // labelStyle: TextStyle(
          //   color: focusNode.hasFocus
          //       ? Colors.cyan
          //       : Colors.grey,
          //   fontSize: 14.sp,
          // ),
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.cyan,
              width: 0.8.w,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 0.8.w,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),
    );
  }
}
