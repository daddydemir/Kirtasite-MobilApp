import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kirtasite/Custom/size.dart';

class BlurEffect extends StatefulWidget {
  const BlurEffect({Key? key, required this.body}) : super(key: key);
  
  final Widget? body;
  @override
  State<BlurEffect> createState() => _BlurEffectState();
}

class _BlurEffectState extends State<BlurEffect> {
  
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: CustomSize().sigma,
          sigmaY: CustomSize().sigma,
        ),
        child: widget.body,
      ),
    );
  }
}