import 'package:flutter/material.dart';
import 'package:flutter_iiy_construction/home_page.dart';
import 'package:flutter_iiy_construction/in_payments.dart';
import 'package:flutter_iiy_construction/payments.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
      MaterialApp(
          home: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily
      ),
        home: HomePage(),
    );
  }
}
