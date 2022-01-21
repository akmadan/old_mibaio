

import 'package:flutter/material.dart';
import 'package:mibaio_smart_app/createHome.dart';
import 'package:mibaio_smart_app/dashboard.dart';
import 'package:mibaio_smart_app/joinHome.dart';
import 'package:mibaio_smart_app/loginScreen.dart';
import 'package:mibaio_smart_app/onboardingScreen.dart';
import 'package:mibaio_smart_app/registerScreen.dart';
import 'package:mibaio_smart_app/welcomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}
String finalEmail='';
String initialRoute='/onboard';
class MyApp extends StatelessWidget {
  // This widget is the root of your application

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      routes: {
        '/onboard' : (context) => OnboardingScreen(),
        '/welcome' : (context) => Welcome(),
        '/login' : (context) => LoginScreen(),
        '/register' : (context) => RegisterScreen(),

      },
    );
  }
}
