// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hola_app/pages/login_section/signup.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    _goToMenuPage();
    super.initState();
  }

  _goToMenuPage() {
    Future.delayed(const Duration(seconds: 2)).then((_) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const Signup()),
          (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(child: Image.asset("assets/Splash_image.png")),
    ));
  }
}
