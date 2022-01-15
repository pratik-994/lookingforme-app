import 'package:flutter/material.dart';
import 'package:flutter_login_signup/src/Widget/bezierContainer.dart';

import 'package:fancy_containers/fancy_containers.dart';
import 'package:flutter_login_signup/src/login-reg/loginPage.dart';

class workerHomepage extends StatefulWidget {
  @override
  State<workerHomepage> createState() => _workerHomepage();
}

class _workerHomepage extends State<workerHomepage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
            child: Form(
      child: Column(
        children: [
          Positioned(
            top: -MediaQuery.of(context).size.height * .15,
            right: -MediaQuery.of(context).size.width * .4,
            child: BezierContainer(),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                    
                  ),
                  Text("Job Offers", style: TextStyle(
                    fontSize: 34
                  ),),
                  const SizedBox(
                    height: 50,
                  ),
               
                ],
              ))
        ],
      ),
    )));
  }
}
