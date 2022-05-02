import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f2f9),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 50,
                  horizontal: 30
              ),
              child: Row(
                children: [
                  Text("India",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff121252)
                  ),
                  ),
                  SizedBox(width: 200,),
                  Text(
                    "ENGLISH",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff121252)
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
