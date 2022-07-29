import 'package:flutter/material.dart';

import 'Custom/color.dart';
import 'screens/login-register/first_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        buttonTheme: ButtonThemeData(
          buttonColor: CustomColors().baseColor,
        ),  
      ),
      home:const FirstPage(),
    );
  }
}