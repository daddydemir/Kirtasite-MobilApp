import 'package:flutter/material.dart';

import 'color.dart';

class CustomButton {
  final buttonStyle = ButtonStyle(
    shape:MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius:BorderRadius.circular(15),
      ),
    ),
    backgroundColor: MaterialStateProperty.all(
      CustomColors().brightGold,
    ),
  );
}
