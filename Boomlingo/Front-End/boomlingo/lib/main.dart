import 'package:boomlingo/pages/lesson/lesson_page.dart';
import 'package:boomlingo/pages/login/login_page.dart';
import 'package:boomlingo/pages/landing/landing_page.dart';
import 'package:boomlingo/util/page_navigation.dart';
import 'package:flutter/material.dart';
import 'rtc_stateful_display.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      // home: LoginPage()
      // home: RTCVideoDisplay()
      // home: PageNavigation()
      home: LandingPage()
      );
  }
}