import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  static const RouteName = 'Forget Password';
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Forget Password ',
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Stack(
                children: [
                  Container(
                    color: Colors.white,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Image.asset(
                            'assets/forgot-password.png',
                            width: 320,
                            height: 310,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            width: double.infinity,
                            child: Text(
                              "We will send a mail to \n the email address you registered \n to regain the password ",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 24),
                            )),
                        SizedBox(
                          height: 35,
                        ),
                        //Email Address
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              onFieldSubmitted: (value) {
                                print(value);
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[300],
                                labelText: 'Email Address',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                              )),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Container(
                          width: double.infinity,
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 40),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                'Send',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.red),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ))),
                            ),
                          ),
                        ),
                      ]),
                ],
              ),
            )),
      ),
    );
  }
}
