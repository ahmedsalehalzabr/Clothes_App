import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../hom_screen.dart';
import '../utils/api_endpoints.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginWithEmail() async {

    var headers = {'Content-Type': 'application/json'};
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.loginEmail);
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
          var email = json['email'];
          final SharedPreferences? prefs = await _prefs;
          await prefs?.setString('token', token);
          await prefs?.setString('email', email);
          print(token);
          emailController.clear();
          passwordController.clear();
          Get.off(const HomeScreen());
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
