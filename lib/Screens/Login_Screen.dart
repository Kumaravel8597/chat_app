import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat_view/Widgets/button.dart';
import 'package:chat_view/Screens/Register_Screen.dart';
import 'package:chat_view/globals.dart';
import '../constants.dart';
import 'Home_Screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  bool isloading = false;
  bool _obscureText = true;
  dynamic _radioValue1 = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: formkey,
              child: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle.light,
                child: Stack(
                  children: [
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: Colors.grey[200],
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 80),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: const Text(
                                "Log In",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                                onChanged: (value) {
                                  email = value.toString().trim();
                                },
                                validator: (value) => (value!.isEmpty)
                                    ? ' Please enter email address'
                                    : null,
                                decoration: kTextFieldDecoration.copyWith(
                                  hintText: '@mail.com',
                                  contentPadding: const EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                  hintStyle:
                                      const TextStyle(color: Colors.blue),
                                  fillColor: Colors.blue,
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                    // borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  icon: Image.asset(
                                    'assets/res/email.png',
                                    height: 30.0,
                                    width: 30.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                                onChanged: (value) {
                                  password = value;
                                },
                                validator: (value) => (value!.isEmpty)
                                    ? ' Please enter Password'
                                    : null,
                                obscureText: _obscureText,
                                decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Enter your Password',
                                  contentPadding: const EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                    child: Icon(_obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                  ),
                                  hintStyle:
                                      const TextStyle(color: Colors.blue),
                                  fillColor: Colors.blue,
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                    // borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  icon: Image.asset(
                                    'assets/res/lock.png',
                                    height: 30.0,
                                    width: 30.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 20),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Radio(
                                            value: 1,
                                            groupValue: _radioValue1,
                                            onChanged: (value) {
                                              setState(() {
                                                _radioValue1 = value;
                                              });
                                            },
                                            activeColor: Colors.blue,
                                          ),
                                          const Text(
                                            'Remember Me',
                                            style: TextStyle(fontSize: 13.0),
                                          ),
                                        ]),
                                    const Text(
                                      'Forgot your Password?',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30, top: 40),
                              child: LoginSignupButton(
                                title: 'Log in',
                                ontapp: () async {
                                  if (formkey.currentState!.validate()) {
                                    setState(() {
                                      isloading = true;
                                    });
                                    try {
                                      await _auth.signInWithEmailAndPassword(
                                          email: email, password: password);

                                      await Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (contex) => HomeScreen(),
                                        ),
                                      );

                                      setState(() {
                                        isloading = false;
                                      });
                                    } on FirebaseAuthException catch (e) {
                                      showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                          title:
                                              const Text("Ops! Login Failed"),
                                          content: Text('${e.message}'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(ctx).pop();
                                              },
                                              child: const Text('Okay'),
                                            )
                                          ],
                                        ),
                                      );
                                      print(e);
                                    }
                                    setState(() {
                                      isloading = false;
                                    });
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Don't Have an Account? "),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => SignupScreen(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      "Sign up here",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.blue,
                                          fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;
    });
  }
}
