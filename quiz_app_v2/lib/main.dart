import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app_v2/screens/startScreen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Quiz APP new Realese',
    theme: ThemeData(
      textTheme: GoogleFonts.nunitoTextTheme(),
      useMaterial3: true,
    ),
    home: Startscreen(),
  ));
}
