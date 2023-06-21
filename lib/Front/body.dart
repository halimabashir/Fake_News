import 'package:flutter/material.dart';

import 'RegisterL.dart';
import 'login.dart';

class body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          " FAKE ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w300,
                            fontFamily: "Roboto",
                            fontSize: 35,
                          ),
                        ),
                        Text(
                          " NEWS ",
                          style: TextStyle(
                            color: Colors.red,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w300,
                            fontFamily: "Roboto",
                            fontSize: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 160,
                        height: 45,
                        child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return RegisterL();
                              }));
                            },
                            child: const Text(
                              "REGISTER",
                              style: TextStyle(
                                  color: Color(0xFFFF0000),
                                  fontSize: 18,
                                  fontFamily: "outfit",
                                  fontWeight: FontWeight.w600,
                                  backgroundColor: Colors.white),
                            )),
                      ),
                      Container(
                        color: Colors.white,
                        child: SizedBox(
                          width: 160,
                          height: 45,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.black),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return login();
                                }));
                              },
                              child: const Text(
                                "LOG IN",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: "outfit",
                                    fontWeight: FontWeight.w600,
                                    backgroundColor: Colors.black),
                              )),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
