import 'package:flutter/material.dart';
import 'package:resservation/presentation/Authentication/Sign_in/sign_in.dart';
import 'package:resservation/presentation/Splash_screen/splashscreen.dart';
import 'package:resservation/presentation/admin/home_page_admin.dart';
import 'package:resservation/presentation/user/home_page_user.dart';

class AppRouting {
  static final String splashScreen = "/";
  static final String login = "/login";
  static final String register = "/register";

  static final String homeClient = "/home_user";
  static final String homeAdmin = "/home_admin";
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case '/home_admin':
        return MaterialPageRoute(builder: (_) => HomePageAdmin());
      case '/home_user':
        return MaterialPageRoute(builder: (_) => UserHomePage());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
