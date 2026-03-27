// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/size.dart';
import 'package:hola_app/models/homepage_model.dart';
import 'package:hola_app/pages/homepage_section/comments.dart';

class HomepageCard extends StatelessWidget {
  const HomepageCard({
    super.key,
    required this.homepageModel,
    required this.onValueChanged,
  });
  final HomepageModel homepageModel;
  final onValueChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: blackColor,
        // height: screenHeight*0.5,
        child: Container(
          // color: blackColor,
          height: screenHeight * 0.47,

          decoration: BoxDecoration(
              border: Border.all(color: iconColor),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(homepageModel.image),
                    ),
                    SizedBox(
                      width: screenWidth * 0.02,
                    ),
                    Expanded(
                      child: Text(homepageModel.userName,
                          style: TextStyle(fontSize: 20, color: whiteColor)),
                    ),
                    Icon(
                      Icons.more_horiz,
                      color: whiteColor,
                    )
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Text(homepageModel.caption,
                    style: TextStyle(fontSize: 15, color: whiteColor)),
                SizedBox(height: screenHeight * 0.02),
                Container(
                  height: screenHeight * 0.2,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    border: Border.all(color: iconColor),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(homepageModel.imageUrl),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: onValueChanged,
                        icon: Icon(
                          homepageModel.isliked
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          color: homepageModel.isliked ? redColor : whiteColor,
                        )),
                    SizedBox(
                      width: screenWidth * 0.01,
                    ),
                    Text(
                      homepageModel.likes.toString(),
                      style: TextStyle(color: whiteColor),
                    ),
                    SizedBox(
                      width: screenWidth * 0.02,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CommentScreen(postId: homepageModel.id,)));
                        },
                        icon: Icon(
                          Icons.comment,
                          color: whiteColor,
                        )),
                    SizedBox(
                      width: screenWidth * 0.01,
                    ),
                    Text(
                      homepageModel.comments.toString(),
                      style: TextStyle(color: whiteColor),
                    ),
                    SizedBox(
                      width: screenWidth * 0.03,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.near_me,
                          color: whiteColor,
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
