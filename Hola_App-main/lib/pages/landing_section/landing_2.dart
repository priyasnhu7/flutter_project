// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hola_app/pages/chat_section/chat.dart';
import 'package:hola_app/pages/homepage_section/homepage.dart';

class Landing2 extends StatelessWidget {
  const Landing2({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        HomePage(),
        Chats()
      ],
    );
  }
}