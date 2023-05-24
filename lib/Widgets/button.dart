import 'package:flutter/material.dart';

class LoginSignupButton extends StatelessWidget {
  final String title;
  final dynamic  ontapp;

  LoginSignupButton({required this.title, required this.ontapp});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/1.25,
      child: SizedBox(
        height: 45,
        child: ElevatedButton(
          onPressed: 
            ontapp,
            style:  ElevatedButton.styleFrom(
            shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 20),
            ),
          ),
          // style: ButtonStyle(
          //   backgroundColor: MaterialStateProperty.all(Colors.blue)
          // ),
        ),
      ),
    );
  }
}