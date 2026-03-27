

// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/size.dart';
import 'package:hola_app/models/post_model.dart';
import 'package:hola_app/pages/homepage_section/comments.dart';

class PostCard extends StatelessWidget {
  const PostCard(
      {super.key,
      required this.postModel,
      required this.onValueChanged,
      });

   final PostModel postModel;
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
          height: screenHeight * 0.45,

          decoration: BoxDecoration(
              border: Border.all(color: iconColor),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                   
                    SizedBox(
                      width: screenWidth * 0.02,
                    ),
                    Expanded(
                      child: Text(postModel.caption,
                          style: const TextStyle(fontSize: 20, color: whiteColor)),
                    ),
                    
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Text(postModel.text,
                    style: const TextStyle(fontSize: 15, color: whiteColor)),
                SizedBox(height: screenHeight * 0.02),
                // ClipRRect(
                //       borderRadius: BorderRadius.circular(20),
                //       child: Image.file(
                //         postModel.image!,
                //         height: 200,
                //         width: double.infinity,
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                Container(
                  height: screenHeight * 0.2,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    border: Border.all(color: iconColor),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: FileImage(postModel.image),
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
                          postModel.isliked
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          color: postModel.isliked ? redColor : whiteColor,
                        )),
                    SizedBox(
                      width: screenWidth * 0.01,
                    ),
                    Text(
                      postModel.likes.toString(),
                      style: const TextStyle(color: whiteColor),
                    ),
                    SizedBox(
                      width: screenWidth * 0.02,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CommentScreen(postId: "",)));
                        },
                        icon: const Icon(
                          Icons.comment,
                          color: whiteColor,
                        )),
                    SizedBox(
                      width: screenWidth * 0.01,
                    ),
                    Text(
                      postModel.comments.toString(),
                      style: const TextStyle(color: whiteColor),
                    ),
                    SizedBox(
                      width: screenWidth * 0.03,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
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
