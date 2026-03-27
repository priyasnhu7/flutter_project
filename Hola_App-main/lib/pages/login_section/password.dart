// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/size.dart';
import 'package:http/http.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final _form = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  

  Future<void> createSign(String email) async {
    final validateStatus = _form.currentState?.validate();
    if (validateStatus!) {
      print("here2");

      try {
        Response response = await post(
            Uri.parse(
                'https://snapverse-6nqx.onrender.com/api/auth/forgot-password'),
            body: {
              'email': email,
            });
        print(response.statusCode);

        if (response.statusCode == 201) {
          print(response.body.toString());

          // var data = jsonDecode(response.body.toString());
          // print(data['id']);
          print('Login successfully');
        } else {
          print('failed');
        }
      } catch (e) {
        print(e.toString());
      }

      // Navigator.pop(context, signup);
    } else {
      print("here");
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
      body: Stack(
        children: [
          Image.asset(
            "assets/bg_image.png",
            width: screenWidth,
            height: screenHeight,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Form(
                  key: _form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: screenHeight * 0.1),
                      Image.asset("assets/Password_image.png"),
                      SizedBox(height: screenHeight * 0.05),
                      Text(
                        "Forgot Password",
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Don’t worry it happens. Please enter the E-mail address associated with your account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: greyColor,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      TextFormField(
                        style: TextStyle(color: iconColor),
                        controller: _emailController,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "Enter a email ";
                          }
                          return null;
                        },
                        decoration: _getTextFormFieldInputDecorationWithIcon(
                            Icon(Icons.email_outlined, color: iconColor),
                            "Enter email",
                            TextStyle(fontSize: 15, color: whiteColor)),
                      ),
                      SizedBox(height: screenHeight * 0.08),
                      GestureDetector(
                        onTap: () {
                          createSign(_emailController.text.toString());
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: screenWidth * 0.9,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: buttonColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Text("Get OTP",
                              style:
                                  TextStyle(fontSize: 20, color: whiteColor)),
                        ),
                      ),
                    ],
                  )),
            ),
          )
        ],
      ),
    ));
  }
}
