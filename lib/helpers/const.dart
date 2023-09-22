import 'package:flutter/material.dart';

class Appcolors {
  static Color kred = const Color(0xffff4513);
  static Color kwhite = const Color(0xffffffff);
  static Color kgrey = const Color.fromARGB(255, 195, 194, 194);
}

class Appsizes {
  static SizedBox kh10 = const SizedBox(
    height: 10,
  );
  static SizedBox kh20 = const SizedBox(
    height: 20,
  );
  static SizedBox kh30 = const SizedBox(
    height: 30,
  );
  static SizedBox kh40 = const SizedBox(
    height: 40,
  );
  static SizedBox kh50 = const SizedBox(
    height: 50,
  );
}

class Stockimg {
  static final img = Image.asset(
    'assets/images/Happy.png',
    height: 250,
  );
}
