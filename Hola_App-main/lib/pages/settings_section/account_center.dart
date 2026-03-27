// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/size.dart';
import 'package:hola_app/pages/settings_section/password_security.dart';

class AccountCenter extends StatelessWidget {
  const AccountCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: blackColor,
        leading: Container(),
        title: Text(
          "Account Center",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: whiteColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            ListTile(
              leading: Container(
                  padding: const EdgeInsets.all(8),
                  height: screenWidth * 0.15,
                  width: screenWidth * 0.15,

                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/person_image.png"),
                  )),
              title: Text(
                "Profiles",
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: iconColor),
              ),
              subtitle: Text(
                "_Allana01",
                style: const TextStyle(fontSize: 16, color: greyColor),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_outlined,
                color: whiteColor,
                size: 15,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
              // color: whiteColor,

              child: Column(
                children: [
                  Text(
                    "Accounts Setting",
                    style: TextStyle(color: whiteColor),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PasswordSecurity()));
                    },
                    child: Container(
                      height: screenHeight*0.08,
                      decoration: BoxDecoration(
                                border: Border.all(color: iconColor),
                                borderRadius: BorderRadius.circular(10)),
                                
                      child: Row(
                        children: const [
                          Icon(Icons.lock, color: whiteColor),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "Password and Security",
                              style: TextStyle(color: whiteColor, fontSize: 15),
                            ),
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: whiteColor,
                                size: 15,
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Container(
                    height: screenHeight*0.08,
                    decoration: BoxDecoration(
                              border: Border.all(color: iconColor),
                              borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: const [
                        Icon(Icons.person, color: whiteColor),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Personal Details",
                            style: TextStyle(color: whiteColor, fontSize: 15),
                          ),
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: whiteColor,
                              size: 15,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight*0.02,
            ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: iconColor)),
                  
              // color: whiteColor,

              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  ListTile(
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
                      "Accounts ",
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: whiteColor),
                    ),
                    subtitle: Expanded(
                      child: Text(
                        "Password, security, personal details, ad preferences",
                        style: const TextStyle(fontSize: 16, color: greyColor),
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: whiteColor,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
