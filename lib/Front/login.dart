import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:untitled3/helper/home_view.dart';

import 'Loginapp.dart';
import 'RegisterL.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);
  static const RouteName = 'Login';
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();
  var rememberMe = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool passwordVisible = false;
  void login(String email, String password) async {
    try {
      var response = await post(
          Uri.parse("https://api.ezdrug.tech/Account/Login"),
          body: {"Email": email, "Password": password});
      if (response.statusCode == 200) {
        print("account logged in ");
        Navigator.pushNamed(context, HomeView.routeName);
      } else {
        print("failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }

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
            'Log in ',
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                        ),
                        color: Colors.white,
                        width: double.infinity,
                        height: 900,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Welcome Back  ',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 26,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .01,
                                        ),
                                        //EmailAddress
                                        Container(
                                          color: Colors.white,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .9,
                                          child: Form(
                                            child: TextFormField(
                                                controller: emailController,
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Please enter your email';
                                                  }
                                                  return null;
                                                },
                                                onFieldSubmitted: (value) {
                                                  print(value);
                                                },
                                                decoration: InputDecoration(
                                                  labelText: 'Email Address',
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50)),
                                                  prefixIcon: Icon(Icons.email),
                                                )),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .01,
                                        ),
                                        //Password
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .9,
                                          child: TextFormField(
                                            controller: passwordController,
                                            obscureText: !passwordVisible,
                                            onFieldSubmitted: (value) {
                                              print(value);
                                            },
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Please enter your password';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              labelText: 'Password',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              prefixIcon: Icon(
                                                Icons.lock,
                                              ),
                                              suffixIcon: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    passwordVisible =
                                                        !passwordVisible;
                                                  });
                                                },
                                                child: Icon(
                                                  passwordVisible
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .003,
                                        ),
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: rememberMe,
                                                onChanged: ((val) {
                                                  setState(() {
                                                    rememberMe = val!;
                                                  });
                                                  ;
                                                })),
                                            TextButton(
                                                onPressed: () {},
                                                child: Text('Remember me ?',
                                                    style: TextStyle(
                                                        color: Colors.black))),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .1,
                                            ),
                                            //Forget Password
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 4),
                                              child: TextButton(
                                                  onPressed: () {
                                                    Navigator.pushNamed(
                                                        context,
                                                        ForgetPassword
                                                            .RouteName);
                                                  },
                                                  child: Text(
                                                    'Forget Password ?',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  )),
                                            ),
                                          ],
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 25),
                                          child: Container(
                                            width: double.infinity,
                                            height: 60,
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  login(
                                                    emailController.text
                                                        .toString(),
                                                    passwordController.text
                                                        .toString(),
                                                  );
                                                },
                                                style: ButtonStyle(
                                                    foregroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                                Colors.white),
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                                Colors.red),
                                                    shape: MaterialStateProperty
                                                        .all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                    ))),
                                                child: const Text(
                                                  'Log in',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                )),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsetsDirectional.only(
                                              start: 30, bottom: 100),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Do You have an account ?',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pushNamed(context,
                                                        RegisterL.RouteName);
                                                  },
                                                  child: Text(
                                                    'Sign Up !',
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  )),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
