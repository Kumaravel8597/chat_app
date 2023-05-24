import 'package:flutter/material.dart';
import 'package:chat_view/Screens/Start_Shift_Screen.dart';
import 'package:chat_view/Screens/chatHomePage.dart';
import 'package:chat_view/globals.dart';
import 'package:location/location.dart' as location;

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // locations = location.Location();
    // _getLoc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(75.0),
          child: AppBar(
            backgroundColor: appThemeColor,
            title: Text("Good Afternoon,${name=="" ? "Sir" : name}"),
            elevation: 0,
            automaticallyImplyLeading: false,
            // leading: IconButton(
            //   icon: Icon(Icons.arrow_back, color: Colors.black,size: 30,),
            //   onPressed: () => Navigator.of(context).pop(),
            // ),
          ),
        ),
        body: Stack(children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
                child: Column(
              children: [
                NavigationView(),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextButton(
                            onPressed: () => {
                              // Future.delayed(const Duration(milliseconds: 500),
                              //     () {
                              //   Navigator.of(context).push(
                              //     MaterialPageRoute(
                              //       builder: (context) => ShiftScreen(),
                              //     ),
                              //   );
                              // }),
                            },
                            // padding: EdgeInsets.all(10.0),
                            child: Column(
                              // Replace with a Row for horizontal icon + text
                              children: <Widget>[
                                Image.asset(
                                  'assets/res/Clock.png',
                                  height: 50.0,
                                  width: 50.0,
                                  fit: BoxFit.cover,
                                ),
                                const Text(
                                  "Time Clock",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextButton(
                            onPressed: () => {
                              Navigator.of(context).push(
                            MaterialPageRoute(
                            builder: (context) => ChatHomePage(),
                            ),
                            )},
                            // padding: EdgeInsets.all(10.0),
                            child: Column(
                              // Replace with a Row for horizontal icon + text
                              children: <Widget>[
                                Image.asset(
                                  'assets/res/chat.png',
                                  height: 50.0,
                                  width: 50.0,
                                  fit: BoxFit.cover,
                                ),
                                const Text(
                                  "Chat",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ),
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
        floatingActionButton: Transform.translate(
          offset: const Offset(0, 60),
          child: SizedBox(
            height: 100.0,
            width: 100.0,
            child: FloatingActionButton(
              onPressed: () {},
              child: Image.asset(
                'assets/res/miRounded.png',
                height: 150.0,
                width: 150.0,
                fit: BoxFit.cover,
              ),
              elevation: 2.0,
            ),
          ),
        ));
  }

  Future<void> _getLoc() async {
    location.LocationData? currentLocation;
    try {
      currentLocation = await locations.getLocation();
      userLat = currentLocation.latitude!;
      userLon = currentLocation.longitude!;
      print("initlocation: userLat: ${userLat}");
      print("initlocation: userLon: ${userLon}");
    } on Exception catch (e) {
      currentLocation = null;
      print("first.exception: _getLocation: ${e}");
    }
  }
}

class NavigationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0.0, -10),
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 10),
        // padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: ShapeDecoration(
          color: appThemeColor,
          shape: MyBorderShape(),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildMiddleTabItem(),
          ],
        ),
      ),
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: 60,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            SizedBox(height: 24),
            Text(''),
          ],
        ),
      ),
    );
  }
}

class MyBorderShape extends ShapeBorder {
  MyBorderShape();

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    print(rect.height);
    return Path.combine(
      PathOperation.difference,
      Path()
        ..addRRect(RRect.fromRectAndRadius(rect, Radius.zero))
        ..close(),
      Path()
        ..addOval(Rect.fromCenter(
            center: rect.center.translate(0, rect.height / 2),
            height: 100,
            width: 120))
        ..close(),
    );
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    // TODO: implement getInnerPath
    throw UnimplementedError();
  }
}
