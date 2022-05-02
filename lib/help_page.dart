import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatefulWidget {
  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ABOUT US",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xff121252),
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Image.asset(
              "images/2.png",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 3),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xff121252),
                    width: 1.5, // Underline thickness
                  ),
                ),
              ),
              child: Text(
                "IIY Software Private Limited",
                style: TextStyle(
                  color: Color(0xff121252),
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "OFFICES - PUNE | MOHALI | BATHINDA",
              style: TextStyle(
                color: Color(0xff121252),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Email:- hr@iiysoftware.com",
              style: TextStyle(
                color: Color(0xff121252),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
