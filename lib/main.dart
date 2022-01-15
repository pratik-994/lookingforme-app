import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_signup/src/authenticate/authenticate.dart';
import 'package:flutter_login_signup/src/homepage/workerHomepage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'src/login-reg/welcomePage.dart';

void main() async{ 

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   runApp(MyApp());}

class MyApp extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Looking For Me?',
      theme: ThemeData(
         primarySwatch: Colors.blue,
         textTheme:GoogleFonts.latoTextTheme(textTheme).copyWith(
           bodyText1: GoogleFonts.montserrat(textStyle: textTheme.bodyText1),
         ),
      ),
      debugShowCheckedModeBanner: false,
      home: workerHomepage(),
    );
  }
}
