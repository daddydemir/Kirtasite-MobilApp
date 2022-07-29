import 'package:flutter/material.dart';

class PngImage extends StatelessWidget {
  const PngImage({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Image.asset(_nameWithPath, fit:BoxFit.cover, );
  }

  String get _nameWithPath => 'assets/png/$name.png';
}

class ImageItems{
  final String amblem = "Amblemx4";
  final String beyazZemin = "Beyaz_zeminx4";
  final String koyuZemin = "Koyu_zeminx4";
}