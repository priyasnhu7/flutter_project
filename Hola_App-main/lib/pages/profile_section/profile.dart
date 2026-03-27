// ignore_for_file: prefer_conditional_assignment

import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/data_constants.dart';
import 'package:hola_app/constants/size.dart';
import 'package:hola_app/models/profile_model.dart';
import 'package:hola_app/pages/follow_section/follower.dart';
import 'package:hola_app/pages/follow_section/following.dart';
import 'package:hola_app/pages/post_section/post_created.dart';
import 'package:hola_app/pages/settings_section/settings_page.dart';
import 'package:hola_app/services/user_services.dart';

class Profile extends StatefulWidget {
  Profile({super.key, this.userId});

  String? userId;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isLoading = true;
  ProfileModel? profileModel;

  @override
  void initState() {
    if(widget.userId == null){
      widget.userId = loggedInUser?.id;
    }
    _getYourProfile();
    super.initState();
  }

  _profileStat1(String value, String label) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PostCreated()),
        );
      },
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: const TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const VerticalDivider(
            width: 20,
            thickness: 1,
            indent: 20,
            color: whiteColor,
            // endIndent: 0,
            // color: Colors.grey,
          )
        ],
      ),
    );
  }

  _profileStat2(String value, String label) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Follower()),
        );
      },
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: const TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const Divider()
        ],
      ),
    );
  }

  _profileStat3(String value, String label) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Following()),
        );
      },
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: const TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const Divider()
        ],
      ),
    );
  }

  void _getYourProfile() async {
    setState(() {
      isLoading = true;
    });
    UserServices().getUserData(widget.userId!).then((onValue) {
      setState(() {
        profileModel = onValue;
        isLoading = false;
      });
    }).catchError((onError) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        // Header Image

                        Container(
                          height: screenHeight * 0.25,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(profileModel!.coverImage), // Add your header image
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Settings()),
                                );
                              },
                              icon: const Icon(
                                Icons.settings,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: 0,
                          left: screenWidth / 2 - 50,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                NetworkImage(profileModel!.profileImage),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    // Profile Info
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          Text(
                            profileModel!.name,
                            style: const TextStyle(
                              color: whiteColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Text(
                            profileModel!.userName,
                            style: const TextStyle(color: whiteColor),
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _profileStat1(profileModel!.postsUrls.length.toString(), 'Posts'),
                              _profileStat2(profileModel!.followers.toString(), 'Followers'),
                              _profileStat3(profileModel!.followings.toString(), 'Following'),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Following()),
                                  );
                                },
                                child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(color: whiteColor)),
                                    child: const Text(
                                      'Edit Profile',
                                      style: TextStyle(
                                          color: whiteColor, fontSize: 15),
                                    )),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Follower()),
                                  );
                                },
                                child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(color: whiteColor)),
                                    child: const Text(
                                      'Share Profile',
                                      style: TextStyle(
                                          color: whiteColor, fontSize: 15),
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.02),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                              ),
                              itemCount: profileModel?.postsUrls.length, // Adjust based on the number of images
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(profileModel!.postsUrls[index]), // Add your photo assets
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
