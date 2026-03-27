import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';

class Tops extends StatefulWidget {
  const Tops({super.key});

  @override
  State<Tops> createState() => _TopsState();
}

class _TopsState extends State<Tops> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Tops Page",style: TextStyle(color: whiteColor,fontSize: 15),
      ),
    );
  }
}