import 'package:fitplus/pallete.dart';
import 'package:fitplus/Features/profile_page/views/ProfilePage.dart';
import 'package:fitplus/Features/vitals_page/view/VitalsPage.dart';
//import 'package:fitplus/views/Screens/homepage.dart';
import 'package:fitplus/Features/medication_page/view/medicationPage.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';

class MyButtomBar extends StatefulWidget {
  static const routeName = '/bottomBar';

  const MyButtomBar({super.key});

  @override
  State<MyButtomBar> createState() => _MyButtomBarState();
}

class _MyButtomBarState extends State<MyButtomBar> {
  int _selectedIndex = 0;

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      const VitalsPage(),
      const MedicationsPage(),
      const ProfilePage()
    ];

    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      body: Center(child: widgetOptions[_selectedIndex]),
      // body: Text(widget.name),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: _onTapped,
          elevation: 10,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Pallette.backgroundColor,
          unselectedItemColor: const Color(0xFF526480),
          // type: BottomNavigationBarType.shifting,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_heart_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_heart_regular),
                label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_alert_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_alert_regular),
                label: 'alerts'),
            BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_person_regular),
                label: 'details')
          ]),
    );
  }
}
