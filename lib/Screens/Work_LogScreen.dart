import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:chat_view/Screens/Confirm_Screen.dart';
import 'package:chat_view/globals.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class WorkLogScreen extends StatefulWidget {
  @override
  _WorkLogScreenState createState() => _WorkLogScreenState();
}

class _WorkLogScreenState extends State<WorkLogScreen> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(userLat, userLon),
    zoom: 15,
  );
  bool endShiftTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appThemeColor,
          title: const Text("Time Clock"),
          elevation: 0,
        ),
        body: Stack(children: [
          SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                    children: [
                  Container(
                    color: appThemeColor,
                    height: MediaQuery.of(context).size.height/3,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.lightBlueAccent,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Card(
                                  margin: const EdgeInsets.all(0),
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Text(
                                            "Work Time on",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Container(
                                              height: 30,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: Colors.grey[300],
                                                boxShadow: const [
                                                  BoxShadow(
                                                      color: Colors.grey,
                                                      spreadRadius: 1),
                                                ],
                                              ),
                                              child: const Center(
                                                child: Padding(
                                                  padding: EdgeInsets.all(5),
                                                  child: Text(
                                                    "Project A",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            DigitalClock(
                                              areaWidth:220,
                                              areaDecoration: const BoxDecoration(
                                                // borderRadius: BorderRadius.circular(20),
                                                color: Colors.white,
                                              ),
                                              hourMinuteDigitTextStyle:
                                                  const TextStyle(
                                                color: Colors.black,
                                                fontSize: 50,
                                              ),
                                              secondDigitTextStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 50,
                                              ),
                                            ),
                                          ],
                                        ),
                                      const Divider(height: 5, thickness: 2),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, bottom: 7),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/res/mapMarker.png',
                                              height: 20.0,
                                              width: 15.0,
                                              fit: BoxFit.fill,
                                            ),
                                            const SizedBox(width: 10),
                                            Text("Clock in at : $Address")
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [Text("Total hours for $formattedDate")],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  endShiftTapped ? _showMap() : Container(),
                  !endShiftTapped
                      ? Padding(
                          padding: const EdgeInsets.only(top: 250,left: 30,right: 30,bottom: 30),
                          child: ConstrainedBox(
                            constraints:
                                const BoxConstraints.tightFor(height: 50),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              )),
                              onPressed: () {
                                setState(() {
                                  endShiftTapped = true;
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.alarm,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                  Text(
                                    ' End Shift',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ]),
              )),
        ]));
  }

  _showMap() {
    return Padding(
      padding: const EdgeInsets.only(top: 20,bottom: 20),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      endShiftTapped = false;
                    });
                  },
                  icon: const Icon(Icons.close_outlined)),
              const SizedBox(width: 60),
              const Text(
                "Your clock out location",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            children: [
              Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: SafeArea(
                  child: GoogleMap(
                    mapType: MapType.hybrid,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top:20,bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints:
                      const BoxConstraints.tightFor(height: 50, width: 110),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        )),
                    onPressed: () {
                      setState(() {
                        endShiftTapped = false;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      Text(
                          ' Cancel',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )
                      ],
                        ),
                  ),
                ),
                const SizedBox(width: 20),
                ConstrainedBox(
                  constraints:
                      const BoxConstraints.tightFor(height: 50, width: 175),
                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    )),
                    onPressed: () {
                      setState(() {
                        endShiftTapped = false;
                      });
                      endTime = DateTime.now();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ConfirmScreen(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.alarm,
                          color: Colors.black,
                          size: 25,
                        ),
                        Text(
                          ' End Shift',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
