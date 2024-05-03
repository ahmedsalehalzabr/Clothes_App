import 'dart:io';

import 'package:clothes_app/hom_screen.dart';
import 'package:clothes_app/users/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'conf.dart';

late SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   prefs = await SharedPreferences.getInstance();

  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Clothes Store App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     initialRoute: prefs.getString("email") == null ? "login" : "home",
     routes: {
        "login":(context) => LoginScreen(),
        "home": (context) => HomeScreen()
     },

      // home: FutureBuilder(
      //   builder: (context, dataSnapShot)
      //   {
      //     return LoginScreen();
      //   }, future: null,
      // )
    );
  }
}

