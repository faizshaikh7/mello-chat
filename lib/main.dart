import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mello_chat/screens/onboard_screen.dart';
import 'package:mello_chat/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mello Chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(62, 102, 251, 1)),
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        useMaterial3: false,
      ),
      home: OnboardScreen(),
    );
  }
}
