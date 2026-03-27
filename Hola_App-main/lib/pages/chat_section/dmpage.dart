// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/size.dart';

class DmPage extends StatefulWidget {
  const DmPage({super.key});

  @override
  State<DmPage> createState() => _DmPageState();
}

class _DmPageState extends State<DmPage> {
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: blackColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/person_image.png"),
            ),
            SizedBox(
              width: screenWidth * 0.01,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Richard Wright",
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                    // height: screenHeight *0.01,
                    ),
                Text(
                  "Where should we go tomorrow?",
                  style: TextStyle(fontSize: 12),
                )
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: blackColor),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: whiteColor,
        child: Container(
          decoration: BoxDecoration(
              color: blackColor.withOpacity(0.8),
              image: DecorationImage(
                image: AssetImage("assets/chat_bg_image.png"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              )),
          child: Column(
            children: [
              Container(height: 40),
              Expanded(
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: index % 3 == 0
                              ? MainAxisAlignment.start
                              : MainAxisAlignment.end,
                          children: [
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                  minWidth: screenWidth * 0.1,
                                  maxWidth: screenWidth * 0.7),
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color:
                                        index % 3 == 0 ? iconColor : whiteColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text("Test" * index * 2),
                              ),
                            )
                          ],
                        );
                      },
                      itemCount: 20)),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: TextFormField(
                  style: TextStyle(color: iconColor),
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: "Type a message",hintStyle: TextStyle(color: whiteColor),
                    prefixIcon: Icon(Icons.message,color: whiteColor,),
                    suffixIcon: Icon(Icons.send,color: whiteColor,),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: iconColor)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: iconColor)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
