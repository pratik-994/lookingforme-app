// import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:iconly/iconly.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class profileScreen extends StatefulWidget {
  profileScreen({Key? key, required this.role}) : super(key: key);

  final String role;

  @override
  _profileScreenState createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String fullName = '';
  String email = '';
  String contact = '';
  String address = '';
  String bio = '';

  String userAvatar =
      'https://yorktonrentals.com/wp-content/uploads/2017/06/usericon.png';

  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _contactController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _bioController = TextEditingController();

  bool isEditing = false;

  @override
  void initState() {
    init();

    super.initState();

    // _fullNameController.dispose();
    // _contactController.dispose();
    // _emailController.dispose();
  }

  init() async {
    setState(() {
      fullName = 'Pratik Gyawali';
      email = 'pratik.gyawali@gmail.com';
      contact = '9348023752';
      address = 'Baneshwor, KTM, Nepal';
      bio = 'Bio';
      _fullNameController.text = fullName;
      _contactController.text = contact;
      _emailController.text = email;
      _addressController.text = address;
      _bioController.text = bio;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Color(0xff2596be),
        title: Text(
          'My Profile',
          style: GoogleFonts.dmSans(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          !isEditing
              ? IconButton(
                  icon: Icon(
                    IconlyLight.edit_square,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      isEditing = !isEditing;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(
                    IconlyLight.close_square,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      isEditing = !isEditing;
                    });
                  },
                ),
        ],
        leading: IconButton(
          icon: Icon(
            IconlyLight.arrow_left_2,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      key: _scaffoldKey,
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 16.0,
            ),
            userAvatar.isNotEmpty
                ? FutureBuilder(
                    future: imageURLCheck(userAvatar),
                    builder: (context, asyncSnapshot) {
                      if (asyncSnapshot.hasData) {
                        if (asyncSnapshot.data != null) {
                          return Container(
                            // color: Colors.black,
                            // width: 200,
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: Color(0xff3563B3),
                              child: CircleAvatar(
                                radius: 39,
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage(
                                  userAvatar,
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            // color: Colors.black,
                            // width: 200,
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(
                                "assets/images/user_d.png",
                              ),
                            ),
                          );
                        }
                      } else {
                        return Container(
                          // color: Colors.black,
                          // width: 200,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Color(0xff2596be),
                            child: CircleAvatar(
                              radius: 39,
                              backgroundColor: Colors.white,
                              // backgroundImage: AssetImage(
                              //   "assets/images/user_d.png",
                              // ),
                              child: CupertinoActivityIndicator(),
                            ),
                          ),
                        );
                      }
                    },
                  )
                : Container(
                    // color: Colors.black,
                    // width: 200,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(
                        "assets/images/user_d.png",
                      ),
                    ),
                  ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              fullName,
              style: GoogleFonts.dmSans(
                textStyle: TextStyle(
                  color: Colors.black87,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              widget.role,
              style: GoogleFonts.dmSans(
                textStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0,
                  color: Colors.black87,
                ),
              ),
            ),
            Divider(
              color: Color(0xff979BB5),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'First Name',
                          style: GoogleFonts.dmSans(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      isEditing
                          ? TextFormField(
                              controller: _fullNameController,
                              style: GoogleFonts.dmSans(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                  color: Colors.black87,
                                ),
                              ),
                              cursorColor: Colors.black54,
                              decoration: InputDecoration(
                                // labelText: 'Enter something',
                                hintText: 'Enter your full name',
                                hintStyle: GoogleFonts.dmSans(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.0,
                                    color: Color(0xff818194),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 0.75,
                                    color: Color(0xff979BB5),
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.black54,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    12,
                                  ),
                                ),
                              ),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                            )
                          : Text(
                              fullName,
                              style: GoogleFonts.dmSans(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                      SizedBox(
                        height: 16.0,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Email Address',
                          style: GoogleFonts.dmSans(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      isEditing
                          ? TextFormField(
                              controller: _emailController,
                              style: GoogleFonts.dmSans(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16.0,
                                  color: Colors.black87,
                                ),
                              ),
                              cursorColor: Colors.black54,
                              decoration: InputDecoration(
                                // labelText: 'Enter something',
                                hintText: 'Enter your email address',
                                hintStyle: GoogleFonts.dmSans(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.0,
                                    color: Color(0xff818194),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 0.75,
                                    color: Color(0xff979BB5),
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.black54,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    12,
                                  ),
                                ),

                                // suffix: GestureDetector(
                                //   child: Icon(Icons.remove_red_eye_rounded),
                                //   onTap: (() {}),
                                // ),
                              ),
                              // obscureText: !showPassword,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                            )
                          : Text(
                              email,
                              style: GoogleFonts.dmSans(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                      SizedBox(
                        height: 16.0,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Contact Number',
                          style: GoogleFonts.dmSans(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      isEditing
                          ? TextFormField(
                              controller: _contactController,
                              style: GoogleFonts.dmSans(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                  color: Colors.black87,
                                ),
                              ),
                              cursorColor: Colors.black54,
                              decoration: InputDecoration(
                                // labelText: 'Enter something',
                                hintText: 'Enter your contact number',
                                hintStyle: GoogleFonts.dmSans(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.0,
                                    color: Color(0xff818194),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 0.75,
                                    color: Color(0xff979BB5),
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.black54,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    12,
                                  ),
                                ),

                                // suffix: GestureDetector(
                                //   child: Icon(Icons.remove_red_eye_rounded),
                                //   onTap: (() {}),
                                // ),
                              ),
                              // obscureText: !showPassword,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.number,
                            )
                          : Text(
                              contact,
                              style: GoogleFonts.dmSans(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                      widget.role.toLowerCase() != 'user'
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 16.0,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'Bio',
                                    style: GoogleFonts.dmSans(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                ),
                                isEditing
                                    ? TextFormField(
                                        controller: _bioController,
                                        style: GoogleFonts.dmSans(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14.0,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        cursorColor: Colors.black54,
                                        decoration: InputDecoration(
                                          // labelText: 'Enter something',
                                          hintText: 'Enter your bio',
                                          hintStyle: GoogleFonts.dmSans(
                                            textStyle: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14.0,
                                              color: Color(0xff818194),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 0.75,
                                              color: Color(0xff979BB5),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 1,
                                              color: Colors.black54,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                        ),
                                        textInputAction: TextInputAction.done,
                                        keyboardType: TextInputType.multiline,
                                      )
                                    : Text(
                                        bio,
                                        style: GoogleFonts.dmSans(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14.0,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),
                              ],
                            )
                          : Container(),
                      SizedBox(
                        height: 32.0,
                      ),
                      isEditing
                          ? Container(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(vertical: 16.0),
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                    Color(0xff3563B3),
                                  ),
                                ),
                                child: Text(
                                  'Update',
                                  style: GoogleFonts.dmSans(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  print('Pressed');
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());

                                  _userUpdate();
                                },
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _userUpdate() async {}

  Future<bool> imageURLCheck(String url) async {
    final response = await http.head(Uri.parse(url));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
