import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Community Page",style: TextStyle(color: whiteColor,fontSize: 15),
      ),
    );
  }
}