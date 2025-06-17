import 'package:egyrailwayes/constants/app_color.dart';
import 'package:egyrailwayes/screens/home/homepage2.dart';
import 'package:egyrailwayes/screens/pages/account.dart';
import 'package:egyrailwayes/screens/pages/my_wallet.dart';
import 'package:egyrailwayes/screens/pages/myticket.dart';
import 'package:flutter/material.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int index = 0;
  List pages = [Homepage2(), MyBookingPage(), MyWallet(), Account()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: AppColor.colorblack,
          selectedItemColor: AppColor.colorblue,
          selectedIconTheme: IconThemeData(size: 26),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.confirmation_number_outlined),
                label: "My Ticket"),
            BottomNavigationBarItem(
                icon: Icon(Icons.wallet_outlined), label: "My Wallet"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: "Account"),
          ],
        ),
        body: Container(
          child: pages.elementAt(index),
        ));
  }
}
