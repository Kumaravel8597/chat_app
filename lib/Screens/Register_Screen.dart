import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chat_view/Widgets/button.dart';
import 'package:chat_view/Screens/Home_Screen.dart';
import 'package:chat_view/constants.dart';
import 'package:chat_view/globals.dart';

import 'Login_Screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  String confirmPassword = '';
  bool _obscureText = true;
  bool _obscureTextC = true;
  bool isloading = false;

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
                            horizontal: 15, vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: const Text(
                                "Sign up",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),

                            // const Hero(
                            //   tag: '1',
                            //   child:
                            // ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                                onChanged: (value) {
                                  name = value.toString().trim();
                                },
                                onSaved: (value) {
                                  name = value!;
                                },
                                validator: (value) => (value!.isEmpty)
                                    ? ' Please enter Name'
                                    : null,
                                decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Enter Your Name',
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
                                    'assets/res/person.png',
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
                              padding: const EdgeInsets.only(top: 30),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                style: new TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                                onChanged: (value) {
                                  confirmPassword = value;
                                },
                                validator: (value) => (value!.isEmpty)
                                    ? ' Please enter Confirm Password'
                                    : null,
                                obscureText: _obscureTextC,
                                decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Enter Your Confirm Password',
                                  contentPadding: const EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _obscureTextC = !_obscureTextC;
                                      });
                                    },
                                    child: Icon(_obscureTextC
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
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    ),
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
                            const SizedBox(height: 40),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: LoginSignupButton(
                                title: 'Sign Up',
                                ontapp: () async {
                                  if (password != confirmPassword) {
                                    setState(() {
                                      isloading = false;
                                    });
                                    showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        title: const Text(
                                            'Password has Mismatched'),
                                        content: const Text(
                                            'Password has Mismatched'),
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
                                  } else {
                                    if (formkey.currentState!.validate()) {
                                      setState(() {
                                        isloading = true;
                                      });
                                      try {
                                        await _auth
                                            .createUserWithEmailAndPassword(
                                                email: email,
                                                password: password);

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            backgroundColor: Colors.blueGrey,
                                            content: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                  'Sucessfully Register.You Can Login Now'),
                                            ),
                                            duration: Duration(seconds: 5),
                                          ),
                                        );
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
                                            title: const Text(
                                                ' Ops! Registration Failed'),
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
                                      }
                                      setState(() {
                                        isloading = false;
                                      });
                                    }
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Already have an account? "),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      "Log in here",
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
}
