// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_print, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/size.dart';

import 'package:hola_app/pages/landing_section/landing.dart';

import 'package:hola_app/services/auth.dart';

class Email extends StatefulWidget {
  const Email(this.code, {super.key});
  final String code;

  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> {
  final _form = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();
  bool isLoading = false;

  Future<void> createSign() async {
    final validateStatus = _form.currentState?.validate();
    if (validateStatus!) {
      setState(() {
        isLoading=true;
      });
      if (widget.code == _otpController.text) {
        AuthAPI().verifyEmail(_otpController.text).then((message) {
          setState(() {
            isLoading=false;
          });
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Landing()));
        }).catchError((e) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(e)));
        });
      }
    } else {
      
    }
  }

  OutlineInputBorder _getOutlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: color),
    );
  }

  InputDecoration _getTextFormFieldInputDecorationWithIcon(
      Icon icon, String hintText, TextStyle hintStyle) {
    return InputDecoration(
        prefixIcon: icon,
        hintText: hintText,
        hintStyle: hintStyle,
        enabledBorder: _getOutlineInputBorder(whiteColor),
        focusedBorder: _getOutlineInputBorder(whiteColor),
        errorBorder: _getOutlineInputBorder(Colors.red),
        focusedErrorBorder: _getOutlineInputBorder(Colors.red));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Image.asset(
            "assets/bg_image.png",
            width: screenWidth,
            height: screenHeight,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Form(
                key: _form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.1),
                    Image.asset("assets/sign_in_image.png"),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      "Verify Email",
                      style: TextStyle(
                          color: whiteColor,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Enter valid Email to verify",
                      style: TextStyle(
                        color: greyColor,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    SizedBox(height: screenHeight * 0.02),
                    TextFormField(
                      style: TextStyle(color: iconColor),
                      controller: _otpController,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "Enter Otp";
                        }
                        return null;
                      },
                      decoration: _getTextFormFieldInputDecorationWithIcon(
                          Icon(Icons.lock, color: iconColor),
                          "Enter OTP",
                          TextStyle(fontSize: 15, color: whiteColor)),
                    ),
                    SizedBox(height: screenHeight * 0.08),
                    isLoading?CircularProgressIndicator():
                    GestureDetector(
                      onTap: () => createSign(),
                      child: Container(
                        alignment: Alignment.center,
                        width: screenWidth * 0.9,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: buttonColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: const Text("Verify OTP",
                            style: TextStyle(fontSize: 20, color: whiteColor)),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                  ],
                )),
          )
        ]),
      ),
    ));
  }
}
