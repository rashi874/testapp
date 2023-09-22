import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginapp/controller/login_provider.dart';
import 'package:loginapp/helpers/const.dart';
import 'package:loginapp/view/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarContrastEnforced: true,
      systemNavigationBarColor: Appcolors.kwhite,
      systemNavigationBarDividerColor: Appcolors.kwhite,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
      systemStatusBarContrastEnforced: true));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<LoginProviders>(
            create: (context) => LoginProviders(),
          ),
        ],
        child: MaterialApp(
          title: 'Login App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
              useMaterial3: true,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Appcolors.kwhite),
              fontFamily: 'Cabin',
              scaffoldBackgroundColor: Appcolors.kwhite,
              canvasColor: Appcolors.kwhite,
              dividerColor: Appcolors.kwhite),
          home: const LoginPage(),
        ));
  }
}
