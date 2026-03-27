import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/post_list.dart';
import 'package:hola_app/constants/size.dart';
import 'package:hola_app/shared/post_card.dart';

class PostCreated extends StatefulWidget {


  const PostCreated({super.key});

  @override
  State<PostCreated> createState() => _PostCreatedState();
}

class _PostCreatedState extends State<PostCreated> {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Your Post',
              style: TextStyle(fontSize: 15, color: whiteColor)),
          centerTitle: true,
        ),
        body: ListView.separated(
          itemCount: postList.length,
          itemBuilder: (context, index) {
            return PostCard(
              postModel : postList[index], onValueChanged: null,
        
              
            );
          },
          separatorBuilder: (context, index) {
          return SizedBox(
            height: screenHeight*0.02,
          );
          },
        ),
      ),
    );
  }
}
 