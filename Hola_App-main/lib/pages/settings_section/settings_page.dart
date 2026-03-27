// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/size.dart';
import 'package:hola_app/pages/login_section/signup.dart';
import 'package:hola_app/pages/settings_section/account_center.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final TextEditingController _searchController = TextEditingController();

  OutlineInputBorder _getOutlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: color),
    );
  }

  InputDecoration _getTextFormFieldInputDecorationWithIcon(
      Icon icon, String hintText, TextStyle hintStyle) {
    return InputDecoration(
      prefixIcon: icon,
      hintText: hintText,
      hintStyle: hintStyle,
      enabledBorder: _getOutlineInputBorder(whiteColor),
      focusedBorder: _getOutlineInputBorder(whiteColor),

      // errorBorder: _getOutlineInputBorder(Colors.red),
      // focusedErrorBorder: _getOutlineInputBorder(Colors.red)
    );
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
            // Navigator.pushReplacement(context,
            //   MaterialPageRoute(builder: (BuildContext context) => Landing()));
          },
        ),
        title: Text(
          "Settings and activity",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: whiteColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.02),
              TextFormField(
                style: TextStyle(color: iconColor),
                controller: _searchController,
                // validator: (text) {
                //   if (text == null || text.isEmpty) {
                //     return "Enter a Name";
                //   }
                //   return null;
                // },
                decoration: _getTextFormFieldInputDecorationWithIcon(
                    Icon(Icons.search, color: iconColor),
                    "Search",
                    TextStyle(fontSize: 15, color: whiteColor)),
              ),
              SizedBox(height: screenHeight * 0.02),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Your Account",
                    style: TextStyle(fontSize: 15, color: whiteColor),
                  )),
              SizedBox(height: screenHeight * 0.02),
              GestureDetector(
                onTap:(){
                  Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AccountCenter()));
                } ,
                child: ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    height: screenWidth * 0.15,
                    width: screenWidth * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.person, color: iconColor),
                  ),
                  title: Text(
                    "Accounts Center",
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: whiteColor),
                  ),
                  subtitle: Text(
                    "Password, security, personal details, ad preferences",
                    style: const TextStyle(fontSize: 16, color: greyColor),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Divider(
                color: greyColor,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "How you use Hola",
                    style: TextStyle(fontSize: 15, color: greyColor),
                  )),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Row(
                
                children: [
                  Icon(Icons.bookmark_border, color: whiteColor),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Saved",
                      style: TextStyle(color: whiteColor, fontSize: 15),
                    ),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.arrow_forward_ios_outlined,
                          color: whiteColor,size: 15,)),
                ],
              ),
              SizedBox(
                height: screenHeight*0.01
              ),
              Row(
                
                children: [
                  Icon(Icons.more_time, color: whiteColor),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Archive",
                      style: TextStyle(color: whiteColor, fontSize: 15),
                    ),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.arrow_forward_ios_outlined,
                          color: whiteColor,size: 15,)),
                ],
              ),
              SizedBox(
                height: screenHeight*0.01
              ),
              Row(
                
                children: [
                  Icon(Icons.access_time, color: whiteColor),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Time Management",
                      style: TextStyle(color: whiteColor, fontSize: 15),
                    ),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.arrow_forward_ios_outlined,
                          color: whiteColor,size: 15,)),
                ],
              ),
              SizedBox(
                height: screenHeight*0.01
              ),
              Row(
                
                children: [
                  Icon(Icons.stars, color: whiteColor),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Close Friend",
                      style: TextStyle(color: whiteColor, fontSize: 15),
                    ),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.arrow_forward_ios_outlined,
                          color: whiteColor,size: 15,)),
                ],
              ),
              SizedBox(
                height: screenHeight*0.01
              ),
              Row(
                
                children: [
                  Icon(Icons.block, color: whiteColor),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Blocked",
                      style: TextStyle(color: whiteColor, fontSize: 15),
                    ),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.arrow_forward_ios_outlined,
                          color: whiteColor,size: 15,)),
                ],
              ),
              SizedBox(
                height: screenHeight*0.01
              ),
              Row(
               
                children: [
                  Icon(Icons.lock, color: whiteColor),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Account Privacy",
                      style: TextStyle(color: whiteColor, fontSize: 15),
                    ),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.arrow_forward_ios_outlined,
                          color: whiteColor,size: 15,)),
                ],
              ),
              SizedBox(
                height: screenHeight*0.01
              ),
              Row(
               
                children: [
                  Icon(Icons.language, color: whiteColor),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Language",
                      style: TextStyle(color: whiteColor, fontSize: 15),
                    ),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.arrow_forward_ios_outlined,
                          color: whiteColor,size: 15,)),
                ],
              ),
              SizedBox(
                height: screenHeight*0.01
              ),
              Row(
               
                children: [
                  Icon(Icons.question_mark, color: whiteColor),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Help",
                      style: TextStyle(color: whiteColor, fontSize: 15),
                    ),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.arrow_forward_ios_outlined,
                          color: whiteColor,size: 15,)),
                ],
              ),
              SizedBox(
                height: screenHeight*0.1
              ),
              GestureDetector(
                onTap: (){
                 Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
    Signup()), (Route<dynamic> route) => false);
                },
                child: Container(
                              alignment: Alignment.center,
                              width: screenWidth * 0.9,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: buttonColor,
                                  borderRadius: BorderRadius.circular(12)),
                              child: const Text("Log Out",
                                  style:
                                      TextStyle(fontSize: 20, color: whiteColor)),
                            ),
              ),
        
            ],
          ),
        ),
      ),
    ));
  }
}
