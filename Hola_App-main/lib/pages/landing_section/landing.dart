import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/pages/explore_section/explore.dart';
import 'package:hola_app/pages/landing_section/landing_2.dart';
import 'package:hola_app/pages/reels_page.dart';
import 'package:hola_app/pages/post_section/post.dart';
import 'package:hola_app/pages/post_section/post_created.dart';
import 'package:hola_app/pages/profile_section/profile.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});
  
  

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int selectedIndex = 0;


  _updateIndex(int i){
    setState(() {
      selectedIndex = i;
    });
  }

  _getBody(){
    switch (selectedIndex){
      case 0: return const Landing2();
      case 1: return const Explore();
      case 2: return const Post();
      case 3: return  const PostCreated();
      case 4: return const ReelsPage();
      case 5: return Profile();

    }
  }
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

      body: _getBody(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:blackColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: _updateIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              color: selectedIndex == 0 ? whiteColor :  iconColor,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore,
             color: selectedIndex == 1 ? whiteColor :  iconColor,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box_outlined,
              color: selectedIndex == 2 ? whiteColor :  iconColor,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.post_add,
              color: selectedIndex == 3 ? whiteColor :  iconColor,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pause,
              color: selectedIndex == 4 ? whiteColor :  iconColor,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: selectedIndex == 5 ? whiteColor :  iconColor,
            ),
            label: "",
          ),
        ],
      ),
    ));
  }
}


