import 'package:flutter/material.dart';
import 'package:flutter_login_signup/src/profile/profileScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: editProfile(title: 'Flutter App'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class editProfile extends StatefulWidget {
  editProfile({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _editProfileState createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: GoogleFonts.dmSans(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              IconlyBold.profile,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => profileScreen(
                    role: 'Worker',
                  ),
                ),
              );
            },
          ),
        ],
        centerTitle: false,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                    child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 16.0),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xff3563B3),
                      ),
                    ),
                    child: Text(
                      'Worker Profile',
                      style: GoogleFonts.dmSans(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => profileScreen(
                            role: 'Worker',
                          ),
                        ),
                      );
                    },
                  ),
                )),
                SizedBox(
                  width: 16.0,
                ),
                Expanded(
                    child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 16.0),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xff3563B3),
                      ),
                    ),
                    child: Text(
                      'User Profile',
                      style: GoogleFonts.dmSans(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => profileScreen(
                            role: 'User',
                          ),
                        ),
                      );
                    },
                  ),
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
