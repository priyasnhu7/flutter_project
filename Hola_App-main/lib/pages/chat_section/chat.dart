// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hola_app/constants/chatting_list.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/size.dart';
import 'package:hola_app/pages/chat_section/dmpage.dart';
import 'package:hola_app/pages/landing_section/landing.dart';
import 'package:hola_app/shared/chatting_card.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  List<String> chatType = [
    "All",
    "Unread",
    "Unreplied",
    "Group",
    "Close Friends"
  ];
  int selectedChatType = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: blackColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: whiteColor),
          onPressed: () {
            Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext context) => Landing()));
          },

        ),
        title: Text(
          "_Allana01",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: whiteColor,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: iconColor),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person_add, color: iconColor),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.07,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedChatType = index;
                        }
                        );
                      },
                      child: Column(children: [
                            Text(chatType[index],
                                style: TextStyle(
                                    color: selectedChatType == index
                                        ? iconColor
                                        : whiteColor,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 5),
                            selectedChatType == index
                                ? Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                        color: iconColor,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                  )
                                : Container()
                          ])
                      // child: Text(
                      //   chatType[index],
                      //   style: TextStyle(fontSize: 15, color: whiteColor),
                      // ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: screenWidth * 0.09);
                  },
                  itemCount: chatType.length),
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DmPage()),
                        );
                      },
                      child: ChattingCard(
                        imageUrl: chatList[index].imageUrl,
                        text: chatList[index].text,
                        subtitle: chatList[index].subtitle,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: screenHeight * 0.04);
                  },
                  itemCount: chatList.length),
            )
          ],
        ),
      ),
    ));
  }
}
