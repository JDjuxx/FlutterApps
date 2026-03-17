import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_list/widgets/groceries.dart';

final theme = ThemeData(
  textTheme: GoogleFonts.charisSilTextTheme(),
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color.fromARGB(235, 109, 1, 131),
    surface: Color.fromARGB(235, 18, 91, 201),
    brightness: Brightness.dark,
  ),
  scaffoldBackgroundColor: Color.fromARGB(235, 194, 33, 94),

  // This is the theme of your application.
  //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List of Groceries',
      theme: theme,
      home: const Groceries(),
    );
  }
}
