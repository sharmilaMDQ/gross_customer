import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grosshop/UI/SplashScreens/ScreenTwo.dart';
import '../../Components/AppTheme.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const duration = Duration(seconds: 5);
    Timer(duration, () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ScreenTwo(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/Grosshop G.png',
                height: 80,
              ),
            ),
            Text(
              'express',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Center(
              child: CupertinoActivityIndicator(
                color: AppTheme.Buttoncolor,
                radius: 20,
                animating: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
