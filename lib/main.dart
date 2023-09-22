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
              // This is the theme of your application.
              //
              // TRY THIS: Try running your application with "flutter run". You'll see
              // the application has a blue toolbar. Then, without quitting the app,
              // try changing the seedColor in the colorScheme below to Colors.green
              // and then invoke "hot reload" (save your changes or press the "hot
              // reload" button in a Flutter-supported IDE, or press "r" if you used
              // the command line to start the app).
              //
              // Notice that the counter didn't reset back to zero; the application
              // state is not lost during the reload. To reset the state, use hot
              // restart instead.
              //
              // This works for code too, not just values: Most code changes can be
              // tested with just a hot reload.
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
