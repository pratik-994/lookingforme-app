// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_login_signup/src/Widget/bezierContainer.dart';




// class customerHomepage extends StatelessWidget {
//   const customerHomepage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Looking for me',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final CategoriesScroller categoriesScroller = const CategoriesScroller();
//   ScrollController controller = ScrollController();
//   bool closeTopContainer = false;
//   double topContainer = 0;

//   List<Widget> itemsData = [];

//   void getPostsData() {
//     List<dynamic> responseList = [
//       {"name": "Electrician"},
//       {"name": "Janitor"},
//       {"name": "Plumber"},
//       {"name": "Housekeeper"},
//       {"name": "Chef"},
//       {"name": "Carpenter"},

//     ];
//     List<Widget> listItems = [];
//     for (var post in responseList) {
//       listItems.add(Container(
//           height: 150,
//           margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           decoration: BoxDecoration(
//               borderRadius: const BorderRadius.all(Radius.circular(20.0)),
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
//               ]),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       post["name"],
//                       style: const TextStyle(
//                           fontSize: 28, fontWeight: FontWeight.bold),
//                     ),
//                ],
//                 )
//               ],
//             ),
//           )));
//     }
//     setState(() {
//       itemsData = listItems;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     getPostsData();
//     controller.addListener(() {
//       double value = controller.offset / 119;

//       setState(() {
//         topContainer = value;
//         closeTopContainer = controller.offset > 50;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     final double categoryHeight = size.height * 0.30;
//     // final height = MediaQuery.of(context).size.height;
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: Colors.white,
//           actions: <Widget>[
//             IconButton(
//               icon: const Icon(Icons.person, color: Colors.black),
//               onPressed: () {},
//             )
//           ],
//         ),
//         body: SizedBox(
//           height: size.height,
//           child: Column(
//             children: <Widget>[
//               // Positioned(
//               // top: -height * .15,
//               // right: -MediaQuery.of(context).size.width * .4,
//               // child: BezierContainer()),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: const <Widget>[
//                   Text(
//                     "Who are you looking for?",
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               AnimatedOpacity(
//                 duration: const Duration(milliseconds: 200),
//                 opacity: closeTopContainer ? 0 : 1,
//                 child: AnimatedContainer(
//                     duration: const Duration(milliseconds: 200),
//                     width: size.width,
//                     alignment: Alignment.topCenter,
//                     height: closeTopContainer ? 0 : categoryHeight,
//                     child: categoriesScroller),
//               ),
//               Expanded(
//                   child: ListView.builder(
//                       controller: controller,
//                       itemCount: itemsData.length,
//                       physics: const BouncingScrollPhysics(),
//                       itemBuilder: (context, index) {
//                         double scale = 1.0;
//                         if (topContainer > 0.5) {
//                           scale = index + 0.5 - topContainer;
//                           if (scale < 0) {
//                             scale = 0;
//                           } else if (scale > 1) {
//                             scale = 1;
//                           }
//                         }
//                         return Opacity(
//                           opacity: scale,
//                           child: Transform(
//                             transform: Matrix4.identity()..scale(scale, scale),
//                             alignment: Alignment.bottomCenter,
//                             child: Align(
//                                 heightFactor: 0.7,
//                                 alignment: Alignment.topCenter,
//                                 child: itemsData[index]),
//                           ),
//                         );
//                       })),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CategoriesScroller extends StatelessWidget {
//   const CategoriesScroller();

//   @override
//   Widget build(BuildContext context) {
//     final double categoryHeight =
//         MediaQuery.of(context).size.height * 0.30 - 50;
//         final height = MediaQuery.of(context).size.height;
//     return SingleChildScrollView(
      
//       physics: const BouncingScrollPhysics(),
//       scrollDirection: Axis.horizontal,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//         child: FittedBox(
//           fit: BoxFit.fill,
//           alignment: Alignment.topCenter,
//           child: Row(
//             children: <Widget>[Positioned(
//               top: -height * .15,
//               right: -MediaQuery.of(context).size.width * .4,
//               child: BezierContainer()),
//               ],
//           ),
//         ),
//       ),
//     );
//   }
// }
