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
  List<dynamic> devicesData = Devices_DATA;
  List<dynamic> roomsData = Rooms_DATA;

  @override
  Widget build(BuildContext context) {
    final double iconSize = 40.0;
    final Size size = MediaQuery.of(context).size;
    final double roomsHeight = size.height * 0.4;

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
            )),
            leading: RawMaterialButton(
              onPressed: () {},
              constraints: BoxConstraints.tight(Size(40, 40)),
              child: Icon(
                Icons.menu,
                size: 40,
                color: Colors.blue,
              ),
              shape: CircleBorder(),
            ),
            actions: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 10),
                child: RawMaterialButton(
                  onPressed: () {},
                  constraints: BoxConstraints.tight(Size(40, 40)),
                  elevation: 10.0,
                  fillColor: Colors.blue,
                  child: Icon(
                    Icons.add_rounded,
                    size: 40,
                    color: Colors.white,
                  ),
                  shape: CircleBorder(),
                ),
              ),
            ],
          ),
          body: Container(
            height: size.height,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                      itemCount: roomsData.length,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            child: FittedBox(
                              fit: BoxFit.fill,
                              alignment: Alignment.topCenter,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 150,
                                    height: roomsHeight,
                                    margin: EdgeInsets.only(right: 0),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: ExactAssetImage(
                                              "assets/images/${roomsData[index]["image"]}"),
                                          fit: BoxFit.cover,
                                          colorFilter: ColorFilter.mode(
                                              Colors.black.withOpacity(0.5),
                                              BlendMode.darken),
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.black.withAlpha(100),
                                              blurRadius: 10.0),
                                        ]),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            roomsData[index]["name"],
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '${roomsData[index]["devices"].toString()} Devices',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
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
                      itemCount: devicesData.length,
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          child: Container(
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
                                  boxShadow: [
                                    BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
                                  ]),
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
                                              devicesData[index]["name"],
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                RawMaterialButton(
                                                  onPressed: () {},
                                                  constraints: BoxConstraints.tight(
                                                      Size(iconSize, iconSize)),
                                                  elevation: 5.0,
                                                  fillColor: Colors.white,
                                                  child: Icon(
                                                    Icons.arrow_upward,
                                                    size: iconSize,
                                                  ),
                                                  shape: CircleBorder(),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                RawMaterialButton(
                                                  onPressed: () {},
                                                  constraints: BoxConstraints.tight(
                                                      Size(iconSize, iconSize)),
                                                  elevation: 5.0,
                                                  fillColor: Colors.white,
                                                  child: Icon(
                                                    Icons.pause,
                                                    size: iconSize,
                                                  ),
                                                  shape: CircleBorder(),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                RawMaterialButton(
                                                  onPressed: () {},
                                                  constraints: BoxConstraints.tight(
                                                      Size(iconSize, iconSize)),
                                                  elevation: 5.0,
                                                  fillColor: Colors.white,
                                                  child: Icon(
                                                    Icons.arrow_downward,
                                                    size: iconSize,
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
                                          "assets/images/${devicesData[index]["image"]}",
                                          height: double.infinity,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void function() {
    // print(roomsData[index]);
  }

  @override
  void initState() {
    super.initState();
    // getPostsData();
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
