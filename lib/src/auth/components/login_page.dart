
import 'package:flutter/material.dart';
import 'package:flutter_login_signup/login_auth/login_auth.dart';
import 'package:flutter_login_signup/src/auth/components/end_part.dart';
import 'package:flutter_login_signup/src/auth/components/top_part.dart';
import 'package:provider/provider.dart';

import 'center_part.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    LoginAuthProvider loginAuthProvider =
        Provider.of<LoginAuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
        //   image: DecorationImage(
        //       image: AssetImage('assets/register.png'), fit: BoxFit.cover),
         ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // top part/
              TopPart(),
              // center part
              CenterPart(
                email: email,
                password: password,
                obscureText: visible,
                onPressed: () {
                  setState(() {
                    visible = !visible;
                  });
                },
                icon: Icon(
                  visible ? Icons.visibility_off : Icons.visibility,
                ),
              ),
              //end part
              EndPart(
                loading: loginAuthProvider.loading,
                onPressed: () {
                  loginAuthProvider.loginPageVaidation(
                    emailAdress: email,
                    password: password,
                    context: context,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
