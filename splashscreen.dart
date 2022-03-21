import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'mainmenu.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 8),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (content) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Container(
        alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height:300,
                width:300,
                child: Lottie.asset('assets/images/splashicon.json')
              ),
              Text("SafeGame Academy", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
            ],
          )
        ),
    );
  }
}