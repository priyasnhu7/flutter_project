// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unused_local_variable, prefer_interpolation_to_compose_strings, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/size.dart';
import 'package:hola_app/pages/landing_section/landing.dart';
import 'package:hola_app/pages/login_section/password.dart';
import 'package:hola_app/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _form = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLoading = false;

  Future<void> createSign() async {
    final validateStatus = _form.currentState?.validate();
    if (validateStatus!) {
      print("here2");
      setState(() {
        isLoading = true;
      });

      AuthAPI()
          .signIn(
              email: _emailController.text, password: _passwordController.text)
          .then((onValue) {
        setState(() {
          isLoading = false;
        });

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => Landing()));
      }).catchError((e) {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          e,
          textAlign: TextAlign.center,
        )));
      });

      // try {
      //   setState(() {
      //     isLoading = true;
      //   });
      //   Response response = await post(
      //       Uri.parse('https://snapverse-6nqx.onrender.com/api/auth/login'),
      //       body: {
      //         'email': email,
      //         'password': password,
      //       });

      //   print("login = " + response.statusCode.toString());
      //   print("login = " + response.body.toString());

      //   if (response.statusCode == 200) {
      //     print(
      //         'Cookies from response:${response.headers['set-cookie']?.substring(0, response.headers['set-cookie']?.indexOf(';'))}');
      //     //token = response.headers['set-cookie']!.substring(0,response.headers['set-cookie']?.indexOf(';'));
      //     //print("token = $token");
      //     setState(() {
      //       isLoading = false;
      //     });
      //     Navigator.pushReplacement(context,
      //         MaterialPageRoute(builder: (BuildContext context) => Landing()));

      //     print(response.body.toString());

      //     print('Login successfully');
      //   } else {
      //     print('failed');
      //     setState(() {
      //       isLoading = false;
      //     });
      //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //         content: Text(
      //       "Login Failed!! \n Please try again",
      //       textAlign: TextAlign.center,
      //     )));
      //   }
      // } catch (e) {
      //   print(e.toString());
      //   setState(() {
      //     isLoading = false;
      //   });
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //       content: Text(
      //     "Login Failed!! \n Please try again",
      //     textAlign: TextAlign.center,
      //   )));
      // }
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
            // fit: StackFit.expand,
            children: [
              Container(
                height: screenHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/bg_image.png'), // Add your header image
                    fit: BoxFit.cover,
                  ),
                ),
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
                          Image.asset("assets/sign_in_image.png"),
                          SizedBox(height: screenHeight * 0.02),
                          Text(
                            "Sign In",
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Enter valid user name & password to continue",
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
                            decoration:
                                _getTextFormFieldInputDecorationWithIcon(
                                    Icon(Icons.email_outlined,
                                        color: iconColor),
                                    "Enter Email",
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
                            decoration:
                                _getTextFormFieldInputDecorationWithIcon(
                                    Icon(Icons.lock, color: iconColor),
                                    "Enter Password",
                                    TextStyle(fontSize: 15, color: whiteColor)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  // Navigate to Sign In page
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Password()),
                                  );
                                },
                                child: Text("Forgot password?",
                                    style: TextStyle(color: iconColor)),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.08),
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
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: const Text("Login",
                                        style: TextStyle(
                                            fontSize: 20, color: whiteColor)),
                                  ),
                                ),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(color: whiteColor),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
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
            ]),
      ),
    );
  }
}
