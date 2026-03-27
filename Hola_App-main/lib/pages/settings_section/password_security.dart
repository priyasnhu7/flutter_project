import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';

class PasswordSecurity extends StatelessWidget {
  const PasswordSecurity({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Password and Security Page",style: TextStyle(color: whiteColor,fontSize: 15),
        ),
      ),
    );
  }
}