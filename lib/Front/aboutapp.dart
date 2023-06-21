import 'package:flutter/material.dart';

class about extends StatelessWidget {
  const about({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Fra.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              "The aim of the fake news project is to help news readers to identify the truth."
              "we try to provide the news with its details and sources with\n the addition of the user's"
              " ability to test the news, is it real or fake?\n  So we were able"
              " to know everything about the news in one application,"
              " and we reduced the spread of fake news.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
