import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loginapp/helpers/const.dart';
import 'package:loginapp/view/otp_screen.dart';

class LoginProviders with ChangeNotifier {
  final TextEditingController phoneNumberController = TextEditingController();
  String selectedCountryCode = "+91"; // Default country code
  final TextEditingController otpController = TextEditingController();

  // List of country codes
  final List<String> countryCodes = [
    "+1", // United States
    "+44", // United Kingdom
    "+91", // India
    // Add more country codes as needed
  ];

  selectedCountryftn(value) {
    selectedCountryCode = value!;
    notifyListeners();
  }

  Future<void> sendOTP(context) async {
    String phoneNumber = phoneNumberController.text;
    if (selectedCountryCode.isNotEmpty && phoneNumber.isNotEmpty) {
      // Implement code to send OTP (e.g., using a server API).
      // For this example, we'll just display a success message.
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OTPVerificationPage(),
          ));
    } else {
      // Handle validation errors or display a message as needed.
    }
  }

  Future<void> verifyftn(context) async {
    String enteredOTP = otpController.text;
    if (enteredOTP.length == 4) {
      verifyOTP(enteredOTP, context);
    } else {
      Fluttertoast.showToast(
        msg: 'Please enter a valid OTP.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  void verifyOTP(String otp, context) {
    // Implement code to verify OTP (e.g., compare with the expected OTP).
    // For this example, we'll just display a success message.
    if (otp == '1234') {
      showDialog(
        useRootNavigator: false,
        useSafeArea: false,
        barrierColor: const Color.fromARGB(24, 27, 27, 27),
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 0,
            titleTextStyle: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cabin'),
            title: const Text('Your details has been submitted'),
            content: const Text('OTP Verified Successfully'),
            actions: <Widget>[
              SizedBox(
                width: 100,
                height: 40,
                child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: const MaterialStatePropertyAll(0),
                      textStyle: const MaterialStatePropertyAll(TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cabin',
                          fontSize: 14)),
                      backgroundColor: MaterialStatePropertyAll(Appcolors.kred),
                      foregroundColor:
                          MaterialStatePropertyAll(Appcolors.kwhite)),
                  onPressed: () {
                    // Close the dialog.
                    otpController.clear();
                    notifyListeners();
                    Navigator.of(context).pop();
                    // Navigate to the OTP verification page.
                  },
                  child: const Text('Done'),
                ),
              ),
            ],
          );
        },
      );
      // Fluttertoast.showToast(
      //   msg: 'OTP Verified Successfully!',
      //   toastLength: Toast.LENGTH_SHORT,
      //   gravity: ToastGravity.BOTTOM,
      // );
    } else {
      Fluttertoast.showToast(
        msg: 'OTP Verification Failed. Please try again.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }
}
