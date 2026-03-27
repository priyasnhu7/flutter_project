import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/size.dart';
import 'package:hola_app/pages/chat_section/chat.dart';

// ignore: must_be_immutable
class FollowingCard extends StatelessWidget {
  FollowingCard({super.key, 
    required this.imageUrl,
    required this.text,
    required this.subtitle,
  });
  String imageUrl;
  String text;
  String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        height: screenWidth * 0.15,
        width: screenWidth * 0.15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: CircleAvatar(
          backgroundImage: AssetImage(imageUrl),
        ),
        // child: Image.asset(imageUrl),
        // decoration: BoxDecoration(
        //   image: DecorationImage(image: NetworkImage(imageUrl))
        // ),
      ),
      title: Text(
        text,
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: whiteColor),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 16, color: greyColor),
      ),
      trailing: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Chats()),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: iconColor, borderRadius: BorderRadius.circular(15)),
            child: const Text(
              "Message",
              style: TextStyle(fontSize: 12),
            ),
          )),
    );
  }
}
