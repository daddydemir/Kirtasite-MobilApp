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
        appBarTheme: const AppBarTheme(
          elevation:0,
          backgroundColor: Colors.transparent,

        ),
      ),
      home:const FirstPage(),
    );
  }
}