import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kirtasite/Custom/size.dart';
import 'package:kirtasite/components/blurEffect.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomSize().bottomNavBar,
      child: BlurEffect(
        body: Container(
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: const BoxDecoration(
            color: Color(0x00ffffff),
          ),
        ),
      ),
    );
  }
}
