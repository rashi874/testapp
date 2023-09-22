import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:loginapp/controller/login_provider.dart';
import 'package:loginapp/helpers/const.dart';
import 'package:flutter/foundation.dart';
import 'package:loginapp/view/widgets/bottom_text.dart';
import 'package:loginapp/view/widgets/custom_btn.dart';
import 'package:loginapp/view/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class OTPVerificationPage extends StatelessWidget {
  const OTPVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProviders>(builder: (context, values, _) {
      return Scaffold(
        extendBody: true,
        backgroundColor: Appcolors.kwhite,
        body: Builder(builder: (context) {
          // Retrieve screen width and height using MediaQuery
          double screenHeight = MediaQuery.of(context).size.height;
          return SafeArea(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Appsizes.kh50,
                const CustomText(
                  text: 'OTP Verify',
                ),
                Appsizes.kh20,
                Stockimg.img,
                SizedBox(
                  height: screenHeight / 14,
                ),
                const Text(
                  'OTP Sent to',
                  textAlign: TextAlign.center,
                ),
                CustomText(
                  text: ' ${values.selectedCountryCode}'
                      ' '
                      '${values.phoneNumberController.text}',
                ),
                Appsizes.kh20,
                PinCodeFields(
                  length: 4,
                  padding: EdgeInsets.zero,
                  fieldBorderStyle: FieldBorderStyle.square,
                  responsive: false,
                  fieldHeight: 47.0,
                  fieldWidth: 70.0,
                  borderWidth: 1.0,
                  margin: const EdgeInsets.all(0),
                  activeBorderColor: Colors.red,
                  activeBackgroundColor: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(14.0),
                  keyboardType: TextInputType.number,
                  autoHideKeyboard: false,
                  fieldBackgroundColor:
                      const Color.fromARGB(164, 243, 243, 243),
                  borderColor: Colors.black38,
                  textStyle: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  onComplete: (output) {
                    values.verifyOTP(output, context);
                    // Your logic with pin code
                    if (kDebugMode) {
                      print(output);
                    }
                  },
                ),
                Appsizes.kh20,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomBtn(
                    verifyftn: () {
                      values.verifyftn(context);
                    },
                    text: 'Verify OTP',
                  ),
                ),
                Appsizes.kh40,
                const BottomText()
              ],
            ),
          );
        }),
      );
    });
  }
}
