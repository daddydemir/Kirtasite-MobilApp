import 'package:flutter/material.dart';

import 'color.dart';

class CustomButton {
  final buttonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(
      CustomColors().brightGold,
    ),
  );
}
