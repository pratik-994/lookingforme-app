// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_login_signup/src/Widget/colors.dart';
import 'package:flutter_login_signup/src/profile/EditProfile.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget listTile({required IconData icon, required String title}) {
    return Column(
      children: [
        Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        // ignore: prefer_const_constructors
        title: Text(
          "My Profile",
          style: TextStyle(
            fontSize: 18,
            color: textColor,
          ),
        ),
      ),
      // drawer: DrawerSide(),
      body: Stack(
        children: [
          Column(children: [
            Container(
              height: 100,
              color: primaryColor,
            ),
            Container(
              height: 548,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 250,
                        height: 80,
                        padding: EdgeInsets.only(left: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              
                              children: [
                                Text(
                                  "User",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: textColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("user@user.com"),
                              ],
                            ),
                            CircleAvatar(
                                radius: 15,
                                backgroundColor: primaryColor,
                                child: CircleAvatar(
                                  radius: 20,
                                  child: IconButton(iconSize: 20, icon: Icon(Icons.edit), onPressed: () {editProfile; } ),
                                  // child: Icon(
                                  //   Icons.edit,
                                  //   color: primaryColor,
                                  // ),
                                  backgroundColor: scaffoldBackgroundColor,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                  listTile(
                      icon: Icons.person_outline, title: "My Information"),
                  listTile(
                      icon: Icons.file_copy_outlined,
                      title: "Terms & Conditions"),
                  listTile(
                      icon: Icons.policy_outlined, title: "Privacy Policy"),
                  listTile(icon: Icons.add_chart, title: "About"),
                  listTile(
                      icon: Icons.exit_to_app_outlined, title: "Sign Out"),
                ],
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 30),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: primaryColor,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://yorktonrentals.com/wp-content/uploads/2017/06/usericon.png"),
                radius: 45,
                backgroundColor: scaffoldBackgroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}