import 'package:flutter/material.dart';
import 'package:kirtasite/screens/home.dart';
import 'package:kirtasite/screens/login-register/first_page.dart';
import 'package:kirtasite/screens/test/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          elevation:0,
          backgroundColor:Colors.transparent
        ),
      ),
      home: const Home(),
      //FirstPage(),
    );
  }
}