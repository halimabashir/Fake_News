import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Front/Loginapp.dart';
import 'Front/RegisterL.dart';
import 'Front/login.dart';
import 'Front/splash.dart';
import 'helper/home_view.dart';
import 'model/them.dart';
import 'news/news_details.dart';
import 'news/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      key: UniqueKey(),
      title: 'Flutter Demo',
      theme: MyTheme.lighttheme,
      debugShowCheckedModeBanner: false,
      initialRoute: splash.routeName,
      routes: {
        login.RouteName: (context) => login(),
        RegisterL.RouteName: (context) => RegisterL(),
        splash.routeName: (context) => splash(),
        HomeView.routeName: (context) => HomeView(),
        NewsDetalis.routeName: (context) => NewsDetalis(),
        SearchScreen.routeName: (context) => SearchScreen(),
        ForgetPassword.RouteName: (context) => ForgetPassword(),
      },
    );
  }
}
