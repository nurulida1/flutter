import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sga/signup.dart';

import 'login.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          "Welcome",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        SizedBox(height: 20),
                        Text("Let's have some fun together!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 15))
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 2.5,
                      child: Lottie.asset('assets/images/welcome.json'),
                    ),
                    Column(
                      children: <Widget>[
                        MaterialButton(
                            minWidth: double.infinity,
                            height: 50,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text("Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18))),
                        SizedBox(height: 20),
                        MaterialButton(
                            minWidth: double.infinity,
                            height: 50,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpPage()));
                            },
                            color: Color(0xff0095FF),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            child: Text("Sign Up",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18)))
                      ],
                    )
                  ],
                ))));
  }
}
