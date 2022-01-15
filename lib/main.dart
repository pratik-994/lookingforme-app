

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_signup/login_auth/login_auth.dart';
import 'package:flutter_login_signup/login_auth/sign_up.dart';
import 'package:flutter_login_signup/login_auth/sign_up2.dart';
import 'package:flutter_login_signup/main/main.dart';
import 'package:flutter_login_signup/sign_up/sign_up_page2.dart';
import 'package:flutter_login_signup/src/Widget/colors.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignupAuthProvider>(
          create: (context) => SignupAuthProvider(),
        ),
           ChangeNotifierProvider<SignupAuthProvider2>(
          create: (context) => SignupAuthProvider2(),
        ),
      
        ChangeNotifierProvider<LoginAuthProvider>(
          create: (context) => LoginAuthProvider(),
        ),

      ],
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: primaryColor,
            scaffoldBackgroundColor: scaffoldBackgroundColor),
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                //  return MyHomePage();
              }
              return SignupPage2();
            }),
      ),
    );
  }
}
