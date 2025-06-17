import 'package:egyrailwayes/constants/row_buttons.dart' as widget;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Rowbuttons extends StatefulWidget {
  const Rowbuttons({super.key});

  @override
  _RowbuttonsState createState() => _RowbuttonsState();
}

String? get selectedPage => widget.selectedPage;

class _RowbuttonsState extends State<Rowbuttons> {
  String? _selectedPage;

  String? get selectedPage => _selectedPage;

  set selectedPage(String? value) {
    _selectedPage = value;
  }

  @override
  void initState() {
    super.initState();
    selectedPage = 'Home'; // Set the initial selected page
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 80.h,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(131, 122, 122, 122),
              blurRadius: 5.r,
              offset: Offset(0.w, -2.h),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, "Home", context),
            _buildNavItem(Icons.confirmation_num, "Tickets", context),
            _buildNavItem(Icons.wallet, "wallet", context),
            _buildNavItem(Icons.person, "profile", context),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 40.h,
          width: 40.w,
          child: IconButton(
            icon: Icon(
              icon,
              shadows: [
                Shadow(
                  color: selectedPage == label
                      ? Colors.blue
                      : const Color.fromARGB(255, 132, 132, 132),
                  blurRadius: 12.r,
                  offset: Offset(0.w, 5.h),
                ),
              ],
              size: 25.sp,
              color: selectedPage == label
                  ? Colors.blue
                  : const Color.fromARGB(255, 132, 132, 132),
            ),
            onPressed: () {
              setState(() {
                selectedPage = label; // Update the selected page
              });
            },
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          label,
          style: TextStyle(
            color: selectedPage == label
                ? Colors.blue
                : const Color.fromARGB(255, 112, 112, 112),
            fontSize: 14,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
        ),
      ],
    );
  }
}
