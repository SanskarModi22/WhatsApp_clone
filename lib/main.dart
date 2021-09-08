import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Screens/homescreen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            fontFamily: 'OpenSans',
            primaryColor: Color(0xFF075E54),
            accentColor: Color(0xFF128C7E)),
        home: HomeScreen(),
      );
    });
  }
}
