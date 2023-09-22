import 'package:flutter/material.dart';
import '../../helpers/const.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    required this.text,
    required this.verifyftn,
  });

  final VoidCallback verifyftn;

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: SizedBox(
        width: 200,
        height: 45,
        child: ElevatedButton(
          style: ButtonStyle(
              elevation: const MaterialStatePropertyAll(0.0),
              textStyle: const MaterialStatePropertyAll(
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              backgroundColor: MaterialStatePropertyAll(Appcolors.kred),
              foregroundColor: MaterialStatePropertyAll(Appcolors.kwhite)),
          onPressed: verifyftn,
          child: Text(text),
        ),
      ),
    );
  }
}
