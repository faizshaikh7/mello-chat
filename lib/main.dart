import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mello_chat/screens/onboard/onboard_screen.dart';
import 'package:mello_chat/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.grey.shade500));
    return MaterialApp(
      title: 'Mello Chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        // buttonTheme: ButtonThemeData(colorScheme: ),
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade700),
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        useMaterial3: false,
      ),
      home: OnboardScreen(),
    );
  }
}
