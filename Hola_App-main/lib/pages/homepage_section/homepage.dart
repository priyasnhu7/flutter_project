// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors



import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/data_constants.dart';

import 'package:hola_app/constants/size.dart';

import 'package:hola_app/pages/chat_section/chat.dart';
import 'package:hola_app/pages/homepage_section/notification.dart';
import 'package:hola_app/services/post_services.dart';
import 'package:hola_app/shared/homepage_card.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getHomePagePost();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _getHomePagePost() async {
    if (homePagePosts.isEmpty) {
      PostServices().getHomePagePosts().then((onValue) {
        setState(() {
          isLoading = false;
        });
      }).catchError((e) {
        setState(() {
          isLoading = false;
        });
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
              child: Image.asset("assets/Splash_image.png", fit: BoxFit.fill)),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NotificationPage()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.chat_outlined, color: Colors.white),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Chats()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Tab Bar
          TabBar(
            controller: _tabController,
            labelColor: iconColor,
            unselectedLabelColor: whiteColor,
            indicatorColor: iconColor,
            indicatorWeight: 3,
            indicatorSize: TabBarIndicatorSize.tab,
            // indicatorSize: .
            tabs: const [
              Tab(
                child: Text(
                  "All",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Tab(
                child: Text(
                  "Following",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          // Posts List
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildPostList(),
                _buildFollowingPage()
                // Column(
                //   children: [
                //     // _buildFollowingPage(),
                //     // SizedBox(height: 20),
                //     _buildPostList(),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFollowingPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Text(
            "Live",
            style: TextStyle(color: whiteColor, fontSize: 20),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          height: screenHeight * 0.15,
          width: screenWidth,
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      width: screenHeight * 0.1,
                      height: screenHeight * 0.1,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: iconColor, width: 5),
                          image: DecorationImage(
                              image: AssetImage("assets/person_image.png"),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "@AliceK",
                      style: TextStyle(color: whiteColor),
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 20,
                  height: 20,
                );
              },
              itemCount: 10),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Text(
            "Your Following",
            style: TextStyle(color: whiteColor, fontSize: 20),
          ),
        ),
        Expanded(child: _buildPostList())
      ],
    );
  }

  Widget _buildPostList() {
    return isLoading
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [CircularProgressIndicator()],
          )
        : ListView.separated(
            shrinkWrap: true,
            itemCount: homePagePosts.length,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              return HomepageCard(
                homepageModel: homePagePosts[index],
                onValueChanged: () {
                  setState(() {
                    homePagePosts[index].isliked =
                        !homePagePosts[index].isliked;
                    if (homePagePosts[index].isliked) {
                      homePagePosts[index].likes++;
                    } else {
                      homePagePosts[index].likes--;
                    }
                  });
                },
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: screenHeight * 0.02,
              );
            },
          );
  }
}
