import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'detalis.dart';

class Check extends StatefulWidget {
  @override
  State<Check> createState() => _CheckState();
}

class _CheckState extends State<Check> {
  Future<String> searchIfFake({
    required String news,
  }) async {
    final url = Uri.parse('https://modelsvm.onrender.com/predict');
    final body = jsonEncode({"text": news});
    final headers = {'Content-Type': 'application/json'};
    String prediction = '';
    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        // Prediction successful
        print('Prediction successful!');

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Prediction received successfully!',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ));
        prediction = jsonDecode(response.body)['prediction'];
        print(prediction);
        return prediction;
      } else {
        // failed
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Prediction failed',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ));
        print('Prediction failed with status code: ${response.statusCode}');
        print(response.body);
        return prediction;
      }
    } catch (e) {
      // Handle the error
      return prediction;
      print('Error predicting the news: $e');
    }
  }

  TextEditingController searchController = TextEditingController();
  String output = '';
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/Group.png'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text("Fake News Detection",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 32,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 40.0),
                TextField(
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.center,
                  controller: searchController,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter News Text',
                      hintStyle: TextStyle(color: Colors.white)),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 40.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.white),
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () async {
                            setState(() => show = true);
                            print(
                                'value in search is: ${searchController.text}');
                            output =
                                await searchIfFake(news: searchController.text);
                            setState(() {});
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) => SingleChildScrollView(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                  child: Container(
                                    color: Colors.white,
                                    child: Container(
                                      padding: EdgeInsets.all(20.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(child: SizedBox()),
                                                Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: IconButton(
                                                    icon: Icon(Icons.close,
                                                        color: Colors.red,
                                                        size: 28),
                                                    onPressed: () {
                                                      setState(() {
                                                        show = false;
                                                      });
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                SizedBox(height: 30.0),
                                                Center(
                                                  child: Text(
                                                      "This news is most likely",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 36)),
                                                ),
                                                Center(
                                                  child: Text("TO BE..",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 39)),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 40),
                                            Text(
                                              output,
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 60,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 100),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            "Submit",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40.0),
                show
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Container()
              ],
            ),
          )
        ],
      ),
    );
  }
}
