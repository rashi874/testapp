import 'package:flutter/material.dart';
import 'package:loginapp/helpers/const.dart';

class BottomText extends StatelessWidget {
  const BottomText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'By signing up,you agree with our Terms\nand conditions',
      textAlign: TextAlign.center,
      style: TextStyle(color: Appcolors.kgrey, fontSize: 13),
    );
  }
}
