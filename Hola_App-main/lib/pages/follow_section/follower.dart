import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/data_constants.dart';
import 'package:hola_app/constants/size.dart';
import 'package:hola_app/pages/profile_section/profile.dart';
import 'package:hola_app/services/user_services.dart';
import 'package:hola_app/shared/follower_card.dart';

class Follower extends StatefulWidget {
  const Follower({super.key});

  @override
  State<Follower> createState() => _FollowerState();
}

class _FollowerState extends State<Follower> {
  @override
  void initState() {
    _getFollowers();
    super.initState();
  }

  _getFollowers(){
    if(followers.isEmpty){

    UserServices().getFollowers().then((onValue){}).catchError((e){});
    }
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: blackColor,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: whiteColor),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Profile()));
              },
            ),
            title: const Text(
              "Followers",
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
                  child: FollowerCard(
                    imageUrl: followers[index].imageUrl!,
                    text: followers[index].name,
                    subtitle: followers[index].userName,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: screenHeight * 0.0);
              },
              itemCount: followers.length)),
    );
  }
}
