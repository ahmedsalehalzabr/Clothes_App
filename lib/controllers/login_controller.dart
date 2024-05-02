import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../hom_screen.dart';
import '../utils/api_endpoints.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> loginWithEmail() async {
    var headers = {'Content-Type': 'application/json'};

      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.loginEmail);
      Map body = {
        'email': emailController.text.trim(),
        'password': passwordController.text
      };
      http.Response response =
      await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200)  {


          emailController.clear();
          passwordController.clear();
          Get.off(const HomeScreen());
        } else  {
        Get.snackbar(
          'خطأ',
          'حدث خطأ أثناء تسجيل الدخول',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
    }

    }
  }

  // Variables
  // var isObsecure = true.obs;
  //
  // // Login function
  // var formKey = GlobalKey<FormState>();
  //
  // @override
  // void dispose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.dispose();
  // }
  // void loginWithEmail() async {
  //   if (formKey.currentState!.validate()) {
  //     final url = "https://localhost:7289/api/Auth/login"; // استبدل YOUR_API_URL بعنوان URL الخاص بالمصدر الخاص بك
  //
  //     final response = await http.post(
  //       Uri.parse(url),
  //       body: {
  //         'email': emailController.text,
  //         'password': passwordController.text,
  //       },
  //     );
  //
  //     if (response.statusCode == 200) {
  //       // تم تسجيل الدخول بنجاح\
  //       Get.to(HomeScreen());
  //     } else {
  //       // حدث خطأ أثناء تسجيل الدخول
  //     }
  //   }
  // }

