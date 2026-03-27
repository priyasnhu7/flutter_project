// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print, non_constant_identifier_names, unused_local_variable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/size.dart';
import 'package:hola_app/pages/login_section/emailverfiy.dart';
import 'package:hola_app/pages/login_section/signin.dart';
import 'package:hola_app/services/auth.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _form = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> createSign() async {
    final validateStatus = _form.currentState?.validate();
    if (validateStatus!) {
      setState(() {
        isLoading = true;
      });

      AuthAPI()
          .signup(
              name: _nameController.text,
              email: _emailController.text,
              password: _passwordController.text)
          .then((code) {
        setState(() {
          isLoading = false;
        });

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => Email(code)));
      }).catchError((e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e)));
      });
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
            fit: BoxFit.fill,
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
                      Image.asset("assets/signup_image.png"),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Use proper information to continue",
                        style: TextStyle(
                          color: greyColor,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      TextFormField(
                        style: TextStyle(color: iconColor),
                        controller: _nameController,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "Enter a Name";
                          }
                          return null;
                        },
                        decoration: _getTextFormFieldInputDecorationWithIcon(
                            Icon(Icons.person, color: iconColor),
                            "Enter name",
                            TextStyle(fontSize: 15, color: whiteColor)),
                      ),
                      SizedBox(height: screenHeight * 0.02),
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
                      SizedBox(height: screenHeight * 0.02),
                      TextFormField(
                        style: TextStyle(color: iconColor),
                        controller: _passwordController,
                         obscureText: true,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "Enter a password ";
                          }
                          return null;
                        },
                        decoration: _getTextFormFieldInputDecorationWithIcon(
                            Icon(Icons.lock, color: iconColor),
                            "Enter password",
                            TextStyle(fontSize: 15, color: whiteColor)),
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      isLoading
                          ? CircularProgressIndicator()
                          : GestureDetector(
                              onTap: () {
                                createSign();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: screenWidth * 0.9,
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: buttonColor,
                                    borderRadius: BorderRadius.circular(12)),
                                child: const Text("Create Account",
                                    style: TextStyle(
                                        fontSize: 20, color: whiteColor)),
                              ),
                            ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        "By signing up, you agree to our Terms & Conditions and Privacy Policy",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: whiteColor, fontSize: 15),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Row(
                        children: const [
                          Expanded(
                            child: Divider(color: whiteColor),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              "Or",
                              style: TextStyle(color: whiteColor),
                            ),
                          ),
                          Expanded(
                            child: Divider(color: whiteColor),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Container(
                          alignment: Alignment.center,
                          width: screenWidth * 0.9,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: buttonColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/google_icon.png",
                                height: screenHeight * 0.02,
                              ),
                              SizedBox(
                                width: screenWidth * 0.02,
                              ),
                              const Text("Continue with Google",
                                  style: TextStyle(
                                      fontSize: 20, color: whiteColor)),
                            ],
                          )),
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(color: whiteColor),
                          ),
                          TextButton(
                            onPressed: () {
                              // Navigate to Sign In page
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()),
                              );
                            },
                            child: Text("Sign In",
                                style: TextStyle(color: iconColor)),
                          ),
                        ],
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
