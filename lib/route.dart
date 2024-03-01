//import 'package:fitplus/views/Auth_Pages/GetStartedPg.dart';

//import 'package:fitplus/prototypeAnimation/animationProtoytpe.dart';
// import 'package:fitplus/prototypeAnimation/animationProtoytpe.dart';


import 'package:fitplus/Features/Auth/view/GetStartedPg.dart';
import 'package:fitplus/Features/vitals_page/view/VitalsPage.dart';
import 'package:fitplus/utilities%20/Widgets/bottomNavBar.dart';
import 'package:flutter/material.dart';

import 'Features/Auth/view/loginPage.dart';
import 'Features/Auth/view/passwordScreen.dart';

Route<dynamic> generateRoute(RouteSettings setting) {
  switch (setting.name) {
    // case APrototype.routeName:
    //   return MaterialPageRoute(builder: (ctx) => const APrototype());
    // case AuthToogle.routeName:
    //   return MaterialPageRoute(builder: (ctx) => const AuthToogle());
    case VitalsPage.routeName:
      return MaterialPageRoute(builder: (ctx) => const VitalsPage());
    case LoginPage.routeName:
      return MaterialPageRoute(builder: (ctx) => const LoginPage());
    case PasswordScreen.routeName:
      return MaterialPageRoute(builder: (ctx) => const PasswordScreen());
    case HospitalNumValidation.routeName:
      return MaterialPageRoute(builder: (ctx) => const HospitalNumValidation());
    case MyButtomBar.routeName:
      return MaterialPageRoute(builder: (ctx) => const MyButtomBar());

    default:
      return MaterialPageRoute(
        builder: (ctx) => const Scaffold(
          body: Center(
            child: Text('page deosnt Exist'),
          ),
        ),
      );
  }
}
