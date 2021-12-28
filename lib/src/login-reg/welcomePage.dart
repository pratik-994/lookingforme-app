import 'package:flutter/material.dart';
import 'package:flutter_login_signup/src/login-reg/loginPage.dart';
import 'package:flutter_login_signup/src/login-reg/regSelect.dart';

import 'package:flutter_login_signup/src/login-reg/workerReg.dart';
import 'package:flutter_login_signup/src/profile/MyProfile.dart';

import '../Widget/bezierContainer.dart';

// ignore: camel_case_types
class welcomePage extends StatefulWidget {
  welcomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _welcomePageState createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFF26c6DA), Color(0xFFB2EBF2)])),
      child: MaterialButton(
          child: Text("Login"),
          //   color: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            );
          }),
    );
  }

  Widget _sinupButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFF26c6DA), Color(0xFFB2EBF2)])),
      child: MaterialButton(
          child: Text("Sign Up"),
          //   color: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MyProfile(),
              ),
            );
          }),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Looking',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w500, color: Colors.cyan),
          children: [
            TextSpan(
              text: ' For ',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'Me?',
              style: TextStyle(color: Colors.cyan, fontSize: 30),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      height: height,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: -height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer()),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * .2),
                  _title(),
                  SizedBox(height: 50),
                  _submitButton(),
                  SizedBox(height: 40),
                  _sinupButton(),

                  SizedBox(height: height * .055),
                  //   _createAccountLabel(),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}