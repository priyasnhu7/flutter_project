// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/data_constants.dart';
import 'package:hola_app/constants/size.dart';
import 'package:hola_app/pages/landing_section/landing.dart';
import 'package:hola_app/services/user_services.dart';
import 'package:hola_app/shared/following_card.dart';

class Following extends StatefulWidget {
  const Following({super.key});

  @override
  State<Following> createState() => _FollowingState();
}

class _FollowingState extends State<Following> {
  @override
  void initState() {
    _getFollowings();
    super.initState();
  }

  _getFollowings(){
    if(followers.isEmpty){

    UserServices().getFollowings().then((onValue){}).catchError((e){
      print("error = " + e);
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: blackColor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: whiteColor),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>  Landing()));
              },
            ),
            title: const Text(
              "Following",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: whiteColor,
              ),
            ),
          ),
          body: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => DmPage()),
                    // );
                  },
                  child: FollowingCard(
                    imageUrl: followings[index].imageUrl!,
                    text: followings[index].name,
                    subtitle: followings[index].userName,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: screenHeight * 0.0);
              },
              itemCount: followings.length)),
    );
  }
}
