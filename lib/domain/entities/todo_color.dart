import 'package:flutter/material.dart';

class TodoColor {
  final int colorIndex;

  static const List<Color> predefinedColors = [
    Color.fromARGB(255, 240, 160, 154),
    Color.fromARGB(255, 139, 192, 219),
    Color.fromARGB(255, 218, 210, 142),
    Color.fromARGB(255, 186, 144, 226),
    Color.fromARGB(255, 134, 216, 137),
    Color.fromARGB(255, 228, 143, 190),
    Color.fromARGB(255, 166, 223, 213),
    Color.fromARGB(255, 230, 201, 158),
  ];

  Color get color => predefinedColors[colorIndex];

  TodoColor({required this.colorIndex});
}