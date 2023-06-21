import 'dart:async';

import 'package:flutter/material.dart';

import 'body.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);
  static const String routeName = 'inital';
  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => body())));
  }

  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Profile.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
