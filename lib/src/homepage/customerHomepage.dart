import 'package:flutter/material.dart';

import 'package:fancy_containers/fancy_containers.dart';
import 'package:flutter_login_signup/src/login-reg/loginPage.dart';

class customerHomepage extends StatefulWidget {
  @override
  State<customerHomepage> createState() => _customerHomepage();
}

class _customerHomepage extends State<customerHomepage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
            child: Form(
      child: Column(
        children: [
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
                  Material(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: 300,
                        height: 70,
                        alignment: Alignment.center,
                        child: Text(
                          "Electrician",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Material(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: 300,
                        height: 70,
                        alignment: Alignment.center,
                        child: Text(
                          "Plumber",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Material(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: 300,
                        height: 70,
                        alignment: Alignment.center,
                        child: Text(
                          "Janitor",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Material(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: 300,
                        height: 70,
                        alignment: Alignment.center,
                        child: Text(
                          "Chef",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Material(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: 300,
                        height: 70,
                        alignment: Alignment.center,
                        child: Text(
                          "Housekeeper",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Material(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: 300,
                        height: 70,
                        alignment: Alignment.center,
                        child: Text(
                          "Carpenter",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    )));
  }
}
