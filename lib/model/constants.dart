import 'package:flutter/material.dart';

class Colours {
  static const blue = Color(0xff225981);
  static const red = Color(0xff660a00);
  static const black = Color(0xff222222);

  static Color fromType(int type) => type == SquareType.blue
      ? blue
      : type == SquareType.red
          ? red
          : black;
}

class SquareType {
  static const empty = 0;
  static const blue = 1;
  static const red = 2;
}
