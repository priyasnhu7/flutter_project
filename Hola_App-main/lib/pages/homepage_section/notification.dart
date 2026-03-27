import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Notification Page",style: TextStyle(color: whiteColor,fontSize: 15),
        ),
      ),
    );
  }
}