import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'devices_db.dart';
import 'rooms_db.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Oreca',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final CategoriesScroller categoriesScroller = CategoriesScroller();
  // final RoomsScroller roomsScroller = RoomsScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];
  List<dynamic> roomsData = Rooms_DATA;


  List roomsDATA = [
  {
  "name":"Living Room",
  "devices":5,
  "image":"living_room.jpg"
  },{
  "name":"Bedroom",
  "devices":9,
  "image":"bedroom.jpg"
  },
  {
  "name":"Bathroom",
  "devices":6,
  "image":"bathroom.jpg"
  },
  {
  "name":"Kitchen",
  "devices":3,
  "image":"kitchen_x.jpg"
  },
  {
  "name":"Room",
  "devices":0,
  "image":"kitchen.jpg"
  }
  ];




  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // final double categoryHeight = size.height * 0.40;
    final double roomsHeight = size.height * 0.40;

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              // const Color(0xFF2196F3),
              // const Color(0xFF382cb4),
              // const Color(0xFFC0C0C0),
              const Color(0xFFFFFFFF),
              const Color(0xFFFFFFFF),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Center(
                child: Text(
                    'Devices Grouping',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                  ),
                )
            ),
            leading: Icon(
              Icons.menu,
              color: Colors.blue,
            ),
            actions: <Widget>[
              // IconButton(
              //   icon: Icon(Icons.search, color: Colors.black),
              //   onPressed: () {},
              // ),
              IconButton(
                icon: Icon(Icons.person, color: Colors.blue),
                onPressed: () {},
              )
            ],
          ),
          body: Container(
            height: size.height,
            child: Column(
              children: <Widget>[
                // AnimatedOpacity(
                //   duration: const Duration(milliseconds: 200),
                //   opacity: closeTopContainer?0:1,
                //   child: AnimatedContainer(
                //       duration: const Duration(milliseconds: 200),
                //       width: size.width,
                //       alignment: Alignment.topCenter,
                //       height: closeTopContainer?0:categoryHeight,
                //       child: roomsScroller),
                // ),


                Expanded(
                  child: ListView.builder(
                      itemCount: roomsData.length,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index){
                      return SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                          child: FittedBox(
                            fit: BoxFit.fill,
                            alignment: Alignment.topCenter,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 150,
                                  margin: EdgeInsets.only(right: 0),
                                  height: roomsHeight,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: ExactAssetImage("assets/images/living_room.jpg"),
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0.5),
                                            BlendMode.darken
                                        ),
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                      boxShadow: [BoxShadow(
                                          color: Colors.black.withAlpha(100),
                                          blurRadius: 10.0),
                                      ]
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Living\nRoom",
                                          style: TextStyle(fontSize: 25,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "5 Devices",
                                          style: TextStyle(fontSize: 16, color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                ),



                Expanded(
                    child: ListView.builder(
                        controller: controller,
                        itemCount: itemsData.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          double scale = 1.0;
                          if (topContainer > 0.5) {
                            scale = index + 0.5 - topContainer;
                            if (scale < 0) {
                              scale = 0;
                            } else if (scale > 1) {
                              scale = 1;
                            }
                          }
                          return Opacity(
                            opacity: scale,
                            child: Transform(
                              transform: Matrix4.identity()
                                ..scale(scale, scale),
                              alignment: Alignment.bottomCenter,
                              child: itemsData[index],
                            ),
                          );
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void getRoomsData() {
  //   List<dynamic> _responseList = Rooms_DATA;
  //   List<Widget> listItems = [];
  //   final double categoryHeight = MediaQuery.of(context).size.height * 0.40;
  //   _responseList.forEach((post) {
  //     listItems.add(Container(
  //       width: 150,
  //       margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
  //       decoration: BoxDecoration(
  //           borderRadius: BorderRadius.all(Radius.circular(20.0)),
  //           // color: Colors.blue.shade400,
  //           gradient: LinearGradient(
  //             // center: const Alignment(0.7, -0.6),
  //             // radius: 0.2,
  //             colors: [
  //               const Color(0xFFC0C0C0),
  //               const Color(0xFFFFFFFF),
  //             ],
  //             // stops: [0.4, 1.0],
  //           ),
  //           boxShadow: [BoxShadow(
  //               color: Colors.black.withAlpha(100),
  //               blurRadius: 10.0),
  //           ]
  //       ),
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
  //         child: Row(
  //           children: <Widget>[
  //             Container(
  //               margin: EdgeInsets.only(right: 20),
  //               height: categoryHeight,
  //               decoration: BoxDecoration(
  //                   image: DecorationImage(
  //                     image: ExactAssetImage('assets/images/living_room.jpg'),
  //                     fit: BoxFit.cover,
  //                     colorFilter: ColorFilter.mode(
  //                         Colors.black.withOpacity(0.5),
  //                         BlendMode.darken
  //                     ),
  //                   ),
  //                   borderRadius: BorderRadius.all(Radius.circular(20.0)),
  //                   boxShadow: [BoxShadow(
  //                       color: Colors.black.withAlpha(100),
  //                       blurRadius: 10.0),
  //                   ]
  //               ),
  //               child: Padding(
  //                 padding: const EdgeInsets.all(12.0),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: <Widget>[
  //                     Text(
  //                       "Living\nRoom",
  //                       style: TextStyle(fontSize: 25,
  //                           color: Colors.white,
  //                           fontWeight: FontWeight.bold),
  //                     ),
  //                     SizedBox(
  //                       height: 10,
  //                     ),
  //                     Text(
  //                       "5 Devices",
  //                       style: TextStyle(fontSize: 16, color: Colors.white),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),);
  //   });
  //   setState(() {
  //     roomsData = listItems;
  //   });
  // }

  void getPostsData() {
    const double _iconSize = 40.0;
    List<dynamic> _responseList = Devices_DATA;
    List<Widget> listItems = [];
    _responseList.forEach((post) {
      listItems.add(Container(
          height: 100,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              // color: Colors.blue.shade400,
              gradient: LinearGradient(
                // center: const Alignment(0.7, -0.6),
                // radius: 0.2,
                colors: [
                  const Color(0xFFFFFFFF),
                  const Color(0xFFC0C0C0),
                ],
                // stops: [0.4, 1.0],
              ),
              boxShadow: [BoxShadow(
                  color: Colors.black.withAlpha(100),
                  blurRadius: 10.0),
              ]
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          post["name"],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(height: 5.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RawMaterialButton(
                              onPressed: () {},
                              constraints: BoxConstraints.tight(
                                  Size(_iconSize, _iconSize)),
                              elevation: 5.0,
                              fillColor: Colors.white,
                              child: Icon(
                                Icons.arrow_upward,
                                size: _iconSize,
                              ),
                              shape: CircleBorder(),
                            ),
                            SizedBox(width: 10.0,),
                            RawMaterialButton(
                              onPressed: () {},
                              constraints: BoxConstraints.tight(
                                  Size(_iconSize, _iconSize)),
                              elevation: 5.0,
                              fillColor: Colors.white,
                              child: Icon(
                                Icons.pause,
                                size: _iconSize,
                              ),
                              shape: CircleBorder(),
                            ),
                            SizedBox(width: 10.0,),
                            RawMaterialButton(
                              onPressed: () {},
                              constraints: BoxConstraints.tight(
                                  Size(_iconSize, _iconSize)),
                              elevation: 5.0,
                              fillColor: Colors.white,
                              child: Icon(
                                Icons.arrow_downward,
                                size: _iconSize,
                              ),
                              shape: CircleBorder(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      "assets/images/${post["image"]}",
                      height: double.infinity,
                    ),
                  ],
                )
              ],
            ),
          )));
    });
    setState(() {
      itemsData = listItems;
    });
  }


  void function(){
    List<dynamic> list = Rooms_DATA;
    list.forEach((post) {
      print(post["name"]);
      print(post["image"]);
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
    function();
    /** This is to Disappear Room Cards by scrolling **/
    // controller.addListener(() {
    //
    //   double value = controller.offset/119;
    //
    //   setState(() {
    //     topContainer = value;
    //     closeTopContainer = controller.offset > 50;
    //   });
    // });
  }
}

//
// class RoomsScroller extends StatefulWidget {
//   @override
//   _RoomsScrollerState createState() => _RoomsScrollerState();
// }
//
// class _RoomsScrollerState extends State<RoomsScroller> {
//   List<dynamic> roomsList = Rooms_DATA;
//   List<Widget> listRooms = [];
//
//   @override
//   Widget build(BuildContext context) {
//     final double roomsHeight = MediaQuery.of(context).size.height * 0.40;
//
//     roomsList.forEach((post){
//       listRooms.add(Container(
//         margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//         child: FittedBox(
//           fit: BoxFit.fill,
//           alignment: Alignment.topCenter,
//           child: Row(
//             children: <Widget>[
//               Container(
//                 width: 150,
//                 margin: EdgeInsets.only(right: 20),
//                 height: roomsHeight,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: ExactAssetImage('assets/images/living_room.jpg'),
//                       fit: BoxFit.cover,
//                       colorFilter: ColorFilter.mode(
//                           Colors.black.withOpacity(0.5),
//                           BlendMode.darken
//                       ),
//                     ),
//                     borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                     boxShadow: [BoxShadow(
//                         color: Colors.black.withAlpha(100),
//                         blurRadius: 10.0),
//                     ]
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         "Living\nRoom",
//                         style: TextStyle(fontSize: 25,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "5 Devices",
//                         style: TextStyle(fontSize: 16, color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),);
//     });
//     return SingleChildScrollView(
//       physics: BouncingScrollPhysics(),
//       scrollDirection: Axis.horizontal,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//         child: FittedBox(
//           fit: BoxFit.fill,
//           alignment: Alignment.topCenter,
//           child: Row(
//             children: <Widget>[
//               Container(
//                 width: 150,
//                 margin: EdgeInsets.only(right: 20),
//                 height: roomsHeight,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: ExactAssetImage('assets/images/living_room.jpg'),
//                       fit: BoxFit.cover,
//                       colorFilter: ColorFilter.mode(
//                           Colors.black.withOpacity(0.5),
//                           BlendMode.darken
//                       ),
//                     ),
//                     borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                     boxShadow: [BoxShadow(
//                         color: Colors.black.withAlpha(100),
//                         blurRadius: 10.0),
//                     ]
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         "Living\nRoom",
//                         style: TextStyle(fontSize: 25,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "5 Devices",
//                         style: TextStyle(fontSize: 16, color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 150,
//                 margin: EdgeInsets.only(right: 20),
//                 height: roomsHeight,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: ExactAssetImage('assets/images/bedroom.jpg'),
//                       fit: BoxFit.cover,
//                       colorFilter: ColorFilter.mode(
//                           Colors.black.withOpacity(0.5),
//                           BlendMode.darken
//                       ),
//                     ),
//                     borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                     boxShadow: [BoxShadow(
//                         color: Colors.black.withAlpha(100),
//                         blurRadius: 10.0),
//                     ]
//                 ),
//                 child: Container(
//                   child: Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           "Bed\nRoom",
//                           style: TextStyle(fontSize: 25,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           "2 Devices",
//                           style: TextStyle(fontSize: 16, color: Colors.white),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 150,
//                 margin: EdgeInsets.only(right: 20),
//                 height: roomsHeight,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: ExactAssetImage('assets/images/kitchen_x.jpg'),
//                       fit: BoxFit.cover,
//                       colorFilter: ColorFilter.mode(
//                           Colors.black.withOpacity(0.5),
//                           BlendMode.darken
//                       ),
//                     ),
//                     borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                     boxShadow: [BoxShadow(
//                         color: Colors.black.withAlpha(100),
//                         blurRadius: 10.0),
//                     ]
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         "Super\nSaving",
//                         style: TextStyle(
//                             fontSize: 25,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "10 Devices",
//                         style: TextStyle(fontSize: 16, color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



// class CategoriesScroller extends StatelessWidget {
//   const CategoriesScroller();
//
//   @override
//   Widget build(BuildContext context) {
//     final double categoryHeight = MediaQuery.of(context).size.height * 0.40;
//     return SingleChildScrollView(
//       physics: BouncingScrollPhysics(),
//       scrollDirection: Axis.horizontal,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//         child: FittedBox(
//           fit: BoxFit.fill,
//           alignment: Alignment.topCenter,
//           child: Row(
//             children: <Widget>[
//               Container(
//                 width: 150,
//                 margin: EdgeInsets.only(right: 20),
//                 height: categoryHeight,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: ExactAssetImage('assets/images/living_room.jpg'),
//                       fit: BoxFit.cover,
//                       colorFilter: ColorFilter.mode(
//                           Colors.black.withOpacity(0.5),
//                           BlendMode.darken
//                       ),
//                     ),
//                     borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                     boxShadow: [BoxShadow(
//                         color: Colors.black.withAlpha(100),
//                         blurRadius: 10.0),
//                     ]
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         "Living\nRoom",
//                         style: TextStyle(fontSize: 25,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "5 Devices",
//                         style: TextStyle(fontSize: 16, color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 150,
//                 margin: EdgeInsets.only(right: 20),
//                 height: categoryHeight,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: ExactAssetImage('assets/images/bedroom.jpg'),
//                       fit: BoxFit.cover,
//                       colorFilter: ColorFilter.mode(
//                           Colors.black.withOpacity(0.5),
//                           BlendMode.darken
//                       ),
//                     ),
//                     borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                     boxShadow: [BoxShadow(
//                         color: Colors.black.withAlpha(100),
//                         blurRadius: 10.0),
//                     ]
//                 ),
//                 child: Container(
//                   child: Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           "Bed\nRoom",
//                           style: TextStyle(fontSize: 25,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           "2 Devices",
//                           style: TextStyle(fontSize: 16, color: Colors.white),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 150,
//                 margin: EdgeInsets.only(right: 20),
//                 height: categoryHeight,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: ExactAssetImage('assets/images/kitchen_x.jpg'),
//                       fit: BoxFit.cover,
//                       colorFilter: ColorFilter.mode(
//                           Colors.black.withOpacity(0.5),
//                           BlendMode.darken
//                       ),
//                     ),
//                     borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                     boxShadow: [BoxShadow(
//                         color: Colors.black.withAlpha(100),
//                         blurRadius: 10.0),
//                     ]
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         "Super\nSaving",
//                         style: TextStyle(
//                             fontSize: 25,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "10 Devices",
//                         style: TextStyle(fontSize: 16, color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
