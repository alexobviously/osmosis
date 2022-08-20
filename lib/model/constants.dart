import 'package:flutter/material.dart';

class Colours {
  static const blue = Color(0xff225981);
  static const red = Color(0xff660a00);
  static const black = Color(0xff222222);

  static Color fromType(int type) => type == Player.blue
      ? blue
      : type == Player.red
          ? red
          : black;
}

class Player {
  static const empty = 0;
  static const blue = 1;
  static const red = 2;

  static opponent(int player) => player == blue
      ? red
      : player == red
          ? blue
          : empty;
}
