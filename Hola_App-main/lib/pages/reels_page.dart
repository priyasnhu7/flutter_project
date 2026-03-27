import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';


class ReelsPage extends StatefulWidget {
  const ReelsPage({super.key});

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  final List<Map<String, dynamic>> posts = [];
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Reels Page",style: TextStyle(color: whiteColor,fontSize: 15),
      ),
    );
  }
}
