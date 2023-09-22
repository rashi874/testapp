import 'package:flutter/material.dart';
import 'package:loginapp/controller/login_provider.dart';
import 'package:loginapp/helpers/const.dart';
import 'package:loginapp/view/widgets/bottom_text.dart';
import 'package:loginapp/view/widgets/custom_btn.dart';
import 'package:loginapp/view/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProviders>(builder: (context, values, _) {
      return SafeArea(
        child: Scaffold(
          body: Builder(builder: (context) {
            // Retrieve screen width and height using MediaQuery
            double screenHeight = MediaQuery.of(context).size.height;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Appsizes.kh50,
                  const CustomText(
                    text: 'Log in',
                  ),
                  Appsizes.kh30,
                  Stockimg.img,
                  SizedBox(
                    height: screenHeight / 7.0,
                  ),
                  Container(
                    height: 50,
                    // padding: EdgeInsets.only(bottom: 2),
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 246, 246, 246),
                        border: Border.all(
                          color: Appcolors.kgrey,
                        ),
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: DropdownButton<String>(
                            style: TextStyle(color: Appcolors.kgrey),
                            underline: const SizedBox(),
                            value: values.selectedCountryCode,
                            onChanged: (String? value) {
                              values.selectedCountryftn(value);
                            },
                            items: values.countryCodes
                                .map<DropdownMenuItem<String>>(
                              (String code) {
                                return DropdownMenuItem<String>(
                                  value: code,
                                  child: Text(code),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: TextField(
                              controller: values.phoneNumberController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Phone Number',
                                  hintStyle: TextStyle(color: Appcolors.kgrey)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Appsizes.kh30,
                  CustomBtn(
                      text: 'Get OTP',
                      verifyftn: () {
                        values.sendOTP(context);
                      }),
                  Appsizes.kh40,
                  const BottomText()
                ],
              ),
            );
          }),
        ),
      );
    });
  }
}
