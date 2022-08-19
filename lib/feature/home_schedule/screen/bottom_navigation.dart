import 'package:flutter/material.dart';

import 'package:flutter_doctor_plus/common/constant/images.dart';
import 'package:flutter_doctor_plus/feature/account/screen/account.dart';
import 'package:flutter_doctor_plus/feature/finance_report/screen/my_work.dart';
import 'package:flutter_doctor_plus/feature/health_feed/screen/health_feed.dart';
import 'package:flutter_doctor_plus/feature/home_schedule/widget/home_widget.dart';
import 'package:flutter_doctor_plus/feature/private_chat/screen/private_chat.dart';

import 'home.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key, this.child = const Home()})
      : super(key: key);
  final Widget child;
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  List<Widget> listWidget = [];
  int _currentIndex = 0;

  @override
  void initState() {
    listWidget = [
      const Home(),
      const PrivateChat(),
      const HealthFeed(),
      MyWork(),
      const Account(),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listWidget.elementAt(_currentIndex),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 16,
              offset: Offset(0, 2),
              color: Color.fromRGBO(167, 115, 102, 0.16))
        ]),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          items: [
            createItemNav(context, icHome, 'Home'),
            createItemNav(context, icChat, 'Chat', notifications: 2),
            createItemNav(context, icFeed, 'Feed'),
            createItemNav(context, icMyWork, 'My Work'),
            createItemNav(context, icAccount, 'Account'),
          ],
        ),
      ),
    );
  }
}
