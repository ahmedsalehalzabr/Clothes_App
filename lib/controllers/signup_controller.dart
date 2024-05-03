import 'dart:convert';
import 'package:clothes_app/hom_screen.dart';
import 'package:clothes_app/users/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/api_endpoints.dart';

class RegisterationController extends GetxController {
  // TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


  Future<void> registerWithEmail() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.registerEmail);
      Map body = {

        'email': emailController.text.trim(),
        'password': passwordController.text
      };

      http.Response response =
      await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {

        final json = jsonDecode(response.body);
        if (json['email'] != null) {
          var token = json['token'];
          final SharedPreferences? prefs = await _prefs;
          await prefs?.setString('token', token);
          print(token);
          emailController.clear();
          passwordController.clear();
          Get.off(LoginScreen());
        } else if (json['email'] == null) {

          throw jsonDecode(response.body)['message'];
        }
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (error) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(error.toString())],
            );
          });
    }
  }
}
