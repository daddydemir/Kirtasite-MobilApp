import 'package:flutter/material.dart';
import 'package:kirtasite/components/bottomNavBar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: const BottomNavBar(),
      body: SingleChildScrollView(
        child: Text("test")
      ),
    );
  }
}
