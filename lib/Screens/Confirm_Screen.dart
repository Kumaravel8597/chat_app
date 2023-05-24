import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:chat_view/Screens/Start_Shift_Screen.dart';
import 'package:chat_view/globals.dart';

class ConfirmScreen extends StatefulWidget {
  @override
  _ConfirmScreenState createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  String formattedDated = DateFormat('dd/MM/yy').format(DateTime.now());
  var diff;
  var checkInTime = DateFormat.jms().format(startTime);
  var checkOutTime = DateFormat.jms().format(endTime);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    diff = endTime.difference(startTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appThemeColor,
        title: Text("Shift Details - $formattedDated"),
        elevation: 0,
      ),
      body: Stack(
          children: [
        Container(
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.only(left: 30, right: 30),
            child: SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Container(
                    height: 50,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [const Text("Shift date"), Text(formattedDate)],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey)),
                              height: 150,
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Clock In",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                  const Divider(
                                    height: 2,
                                    thickness: 2,
                                  ),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [Text(checkInTime)]),
                                  const Divider(
                                    height: 2,
                                    thickness: 2,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Text(
                                            Address,
                                            maxLines: 4,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 13.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ))
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey)),
                              height: 150,
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Clock Out",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                  const Divider(
                                    height: 2,
                                    thickness: 2,
                                  ),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [Text(checkOutTime)]),
                                  const Divider(
                                    height: 2,
                                    thickness: 2,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Text(
                                            Address,
                                            maxLines: 4,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 13.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ))
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    height: 50,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding:  const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total hours"),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey[300],
                                boxShadow: const [
                                  BoxShadow(color: Colors.grey, spreadRadius: 1),
                                ],
                              ),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    "Project A",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text("$diff")
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding:  const EdgeInsets.only(top: 100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(children: [
                          Image.asset(
                            'assets/res/edit.png',
                            height: 75.0,
                            width: 75.0,
                            fit: BoxFit.fill,
                          ),
                          const Text("Edit")
                        ]),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ShiftScreen(),
                              ),
                            );
                          },
                          child: Column(children: [
                            Image.asset(
                              'assets/res/confirm.png',
                              height: 75.0,
                              width: 75.0,
                              fit: BoxFit.fill,
                            ),
                            const Text("Confirm")
                          ]),
                        )
                      ],
                    ))
              ]),
            )),
      ]),
    );
  }
}
