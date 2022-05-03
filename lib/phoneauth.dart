import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import 'otp_login.dart';

class PhoneAuthPage extends StatefulWidget {
  @override
  _PhoneAuthPageState createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  int start = 30;
  bool wait = false;
  bool isLoading = false;
  String buttonName = "Send OTP";
  TextEditingController phoneController = TextEditingController();
  AuthClass authClass = AuthClass();
  String verificationIdFinal = "";
  String smsCode = "";
  String phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("LOGIN",
            style: TextStyle(
              fontFamily: GoogleFonts.lato().fontFamily,
              color: Colors.white,
            )),
        backgroundColor: Color(0xff121252),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        leading: Icon(Icons.login,size: 25,color: Colors.white,)
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 120,
              ),
              textField(),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 30,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                      ),
                    ),
                    Text(
                      "Enter 6 Digit OTP",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontFamily: GoogleFonts.lato().fontFamily),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              otpField(),
              SizedBox(
                height: 40,
              ),
              RichText(
                  text: TextSpan(
                children: [
                  TextSpan(
                    text: "Send OTP again in ",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: GoogleFonts.lato().fontFamily),
                  ),
                  TextSpan(
                    text: "\n\t\t\t\t\t\t\t\t\t00:$start",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff121252),
                        fontFamily: GoogleFonts.lato().fontFamily),
                  ),
                ],
              )),
              SizedBox(
                height: 100,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isLoading = true;
                  });
                  authClass.signInwithPhoneNumber(
                      phoneController.text, verificationIdFinal, smsCode, context);
                },
                child: Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width - 60,
                  decoration: BoxDecoration(
                      color: Color(0xffd30d53),
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: (isLoading)
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 1.5,
                            ))
                        : Text(
                            "SUBMIT",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontFamily: GoogleFonts.lato().fontFamily),
                          ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void startTimer() {
    const onsec = Duration(seconds: 1);
    Timer _timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          wait = false;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  Widget otpField() {
    return OTPTextField(
        length: 6,
        width: MediaQuery.of(context).size.width,
        fieldWidth: 50,
        otpFieldStyle: OtpFieldStyle(
            backgroundColor: Colors.white,
            enabledBorderColor: Color(0xff121252),
            focusBorderColor: Color(0xff121252)
        ),
        fieldStyle: FieldStyle.box,
        style: TextStyle(
            fontSize: 20,
            color: Color(0xff121252),
            fontFamily: GoogleFonts.lato().fontFamily,
            fontWeight: FontWeight.w500),
        textFieldAlignment: MainAxisAlignment.spaceEvenly,
        onChanged: (pin) {
          print("Entered");
        },
        onCompleted: (pin) {
          print("Completed: " + pin);
          setState(() {
            smsCode = pin;
          });
        },
    );
  }

  Widget textField() {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xff121252),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        cursorColor: Colors.white,
        controller: phoneController,
        style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontFamily: GoogleFonts.lato().fontFamily),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Enter Your Phone No",
          hintStyle: TextStyle(
              color: Colors.white54,
              fontSize: 15,
              fontFamily: GoogleFonts.lato().fontFamily),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 19, horizontal: 5),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
            child: Text(
              " (+91) ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: GoogleFonts.lato().fontFamily),
            ),
          ),
          suffixIcon: InkWell(
            onTap: wait
                ? null
                : () async {
                    setState(() {
                      start = 30;
                      wait = true;
                      buttonName = "Resend OTP";
                      Fluttertoast.showToast(msg: "Verifying...");
                    });
                    await authClass.verifyPhoneNumber(
                        "+91 ${phoneController.text}", context, setData);
                  },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Text(
                buttonName,
                style: TextStyle(
                    color: wait ? Colors.grey : Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.lato().fontFamily),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void setData(String verificationId) {
    setState(() {
      verificationIdFinal = verificationId;
    });
    startTimer();
  }
}
