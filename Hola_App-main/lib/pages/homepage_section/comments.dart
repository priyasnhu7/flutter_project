// ignore_for_file: prefer_const_constructors, use_super_parameters

import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/size.dart';
import 'package:hola_app/models/comments_model.dart';
import 'package:hola_app/pages/landing_section/landing.dart';
import 'package:hola_app/services/post_services.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key, required this.postId});

  final String postId;

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController _textController = TextEditingController();

  List<CommentsModel> comments = [];
  List<CommentsAddModel> addComment= [];
  bool isLoading = true;

  @override
  void initState() {
    _getComments();
    super.initState();
  }

  void _getComments() {
    PostServices().getCommentOfPost(widget.postId).then((onValue) {
      setState(() {
        comments = onValue;
        isLoading =false;
      });
    }).catchError((e) {
      setState(() {
        isLoading =false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackColor,
        title: const Text(
          'Comments',
          style: TextStyle(color: whiteColor),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: whiteColor,
          ),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Landing()));
          },
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(children: [
              Expanded(
                child: ListView.builder(
                  itemCount: comments.length,
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 30),
                      // leading: CircleAvatar(
                      //   backgroundImage: AssetImage(
                      //     'assets/person_image.png',
                      //   ),
                      // ),
                      title:
                          Text(comments[index].userName, style: TextStyle(color: whiteColor)),
                      subtitle: Text(comments[index].comment,
                          style: TextStyle(color: whiteColor)),
                      // trailing: Column(
                      //   children: [
                      //     IconButton(
                      //       visualDensity: VisualDensity.compact,
                      //       iconSize: 20,
                      //       padding: EdgeInsets.all(0),
                      //       icon: const Icon(
                      //         Icons.favorite_border,
                      //         color: whiteColor,
                      //       ),
                      //       onPressed: () {},
                      //     ),
                      //     const Text('3', style: TextStyle(color: whiteColor)),
                      //   ],
                      // ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.emoji_emotions,
                      color: Colors.yellow,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: whiteColor,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.mic,
                      color: whiteColor,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.send,
                      color: whiteColor,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
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
              ),
            ]),

      // bottomNavigationBar: BottomAppBar(

      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       IconButton(
      //         icon: const
      //          Icon(Icons.favorite),
      //         onPressed: () {},
      //       ),
      //       IconButton(
      //         icon: const Icon(Icons.emoji_emotions),
      //         onPressed: () {},
      //       ),
      //       IconButton(
      //         icon: const Icon(Icons.add_circle_outline),
      //         onPressed: () {},
      //       ),
      //       IconButton(
      //         icon: const Icon(Icons.mic),
      //         onPressed: () {},
      //       ),
      //       IconButton(
      //         icon: const Icon(Icons.send),
      //         onPressed: () {},
      //       ),
      //     ],
      //   ),
    );
  }
}
