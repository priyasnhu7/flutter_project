import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';

class Tags extends StatefulWidget {
  const Tags({super.key});

  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Tags Page",style: TextStyle(color: whiteColor,fontSize: 15),
      ),
    );
  }
}