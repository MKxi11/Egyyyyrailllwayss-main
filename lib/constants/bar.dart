import 'package:egyrailwayes/constants/app_color.dart';
import 'package:egyrailwayes/screens/Start/welcome.dart';
import 'package:egyrailwayes/screens/pages/bottom_bar.dart';
import 'package:egyrailwayes/screens/pages/find.dart';
import 'package:egyrailwayes/screens/profile/myprofile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Bar extends StatefulWidget {
  const Bar({super.key});

  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> {
  final GlobalKey _menuKey = GlobalKey();

  void _showPopupMenu() async {
    final RenderBox renderBox =
        _menuKey.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

    final selected = await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy + size.height,
        offset.dx + size.width,
        offset.dy,
      ),
      items: [
        PopupMenuItem(
          value: 'My Profile',
          child: Text(
            'My Profile',
            style: TextStyle(fontSize: 18.sp),
          ),
        ),
        PopupMenuItem(
          value: 'Find Trains',
          child: Text(
            'Find Trains',
            style: TextStyle(fontSize: 18.sp),
          ),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      color: Colors.white.withOpacity(0.95),
    );

    if (selected == null) return;

    if (selected == 'My Profile') {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Myprofile()),
      );
    } else if (selected == 'Find Trains') {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Find()),
      );
    } else if (selected == 'Logout') {
      try {
        await Supabase.instance.client.auth.signOut();

        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Welcome()),
          (route) => false,
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Logout failed: $e")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70.h,
      leading: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Bottombar()));
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset(
            'images/logo.png',
            height: 40.h,
            width: 40.w,
          ),
        ),
      ),
      backgroundColor: Colors.white.withOpacity(0.8),
      title: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Bottombar()));
        },
        child: Text(
          'Egy Railways',
          style: TextStyle(
            foreground: Paint()
              ..shader = LinearGradient(
                colors: [
                  Colors.cyan,
                  const Color.fromARGB(255, 14, 70, 117),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ).createShader(Rect.fromLTWH(0, 0, 400, 70)),
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      actions: [
        IconButton(
          key: _menuKey,
          icon: Icon(Icons.menu, color: AppColor.colorblack, size: 24.sp),
          onPressed: _showPopupMenu,
          tooltip: "Menu",
        ),
      ],
      shadowColor: const Color.fromARGB(255, 88, 88, 88).withOpacity(0.5),
      elevation: 2,
    );
  }
}
