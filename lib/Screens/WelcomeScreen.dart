import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_view/Screens/Login_Screen.dart';

import 'Register_Screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreen createState() => _WelcomeScreen();
}

class _WelcomeScreen extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey[200],
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
              child: Column(
                children: [
                  Image.asset(
                    'assets/res/AppLogo.png',
                    height: 150.0,
                    width: 150.0,
                    fit: BoxFit.cover,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Text(
                      "Welcome to Chat",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints.tightFor(height: 50),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        )),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: const Center(
                          child: Text('Log in'),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints.tightFor(height: 50),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        )),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SignupScreen(),
                            ),
                          );
                        },
                        child: const Center(
                          child: Text('Sign Up'),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: dividerWidget(text: "OR")),
                  InkWell(
                    child: Container(
                        height: 60,
                        margin: const EdgeInsets.only(top: 25),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Container(
                                height: 40.0,
                                width: 40.0,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/res/GoogleIcon.png'),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            const SizedBox(width: 40),
                            const Text(
                              'continue with Google',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ))),
                    onTap: () async {},
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget dividerWidget({required String text}) {
    final line = Expanded(
        child: Container(
      margin: const EdgeInsets.only(left: 5, right: 5),
      child: const Divider(height: 20, thickness: 2, color: Colors.black),
    ));
    return Row(children: [
      line,
      Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold, // light
          fontStyle: FontStyle.italic, // italic
        ),
      ),
      line
    ]);
  }
}
