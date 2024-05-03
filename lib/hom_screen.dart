import 'package:clothes_app/users/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var usertoken;
  var email;
getPrefs() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
 setState(() {
   usertoken = pref.getString("token");
   email = pref.getString("email");
 });

  print("success");
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
        actions: [
          TextButton(
              onPressed: (){
                prefs.clear();
           Get.off(LoginScreen());
    },
              child: Text("LogOut")),
        ],
      ),

      body: Center(
        child: Column(
          children: [
            Text("$usertoken"),
            TextButton(
                onPressed: () => getPrefs(),
                child: Text("token")),
            Text("$email"),

          ],
        ),
      ),
    );
  }
}