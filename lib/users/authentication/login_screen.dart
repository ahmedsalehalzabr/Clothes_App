

import 'package:clothes_app/users/authentication/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/login_controller.dart';
import '../../controllers/signup_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.put(LoginController());
  var formKey = GlobalKey<FormState>();

  var isObsecure = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: Colors.black,
         body: LayoutBuilder(
           builder: (context,cons)
           {
             return ConstrainedBox(
                 constraints:BoxConstraints(
                   minHeight: cons.maxHeight,
                 ) ,
               child: SingleChildScrollView(
                 child: Column(
                   children: [
                     SizedBox(
                       width: MediaQuery.of(context).size.width,
                       height: 285,
                       child: Image.asset(
                       "images/login.jpg"),
                     ),

                     Padding(
                       padding: const EdgeInsets.all(16.0),
                       child: Container(
                         decoration: const BoxDecoration(
                           color:Colors.white24,
                           borderRadius: BorderRadius.all(
                             Radius.circular(60),
                           ),
                           boxShadow: [
                             BoxShadow(
                               blurRadius: 8,
                               color: Colors.black26,
                               offset: Offset(0, -3),
                             ),
                           ],
                         ),
                         child: Padding(
                           padding: const EdgeInsets.fromLTRB(30, 30, 30, 8),
                           child: Column(
                             children: [
                               Form(
                                 key: formKey,
                                 child: Column(
                                   children: [

                                     TextFormField(
                                       controller: loginController.emailController,
                                       validator: (val) => val == "" ? "Please write email ": null,

                                       decoration: InputDecoration(
                                         prefixIcon: Icon(
                                           Icons.email,
                                           color: Colors.black,
                                         ),
                                         hintText: "email...",
                                         border: OutlineInputBorder(
                                           borderRadius: BorderRadius.circular(30),
                                           borderSide: BorderSide(
                                             color: Colors.white60,
                                           )
                                         ),
                                         enabledBorder: OutlineInputBorder(
                                             borderRadius: BorderRadius.circular(30),
                                             borderSide: BorderSide(
                                               color: Colors.white60,
                                             )
                                         ),
                                         focusedBorder: OutlineInputBorder(
                                             borderRadius: BorderRadius.circular(30),
                                             borderSide: BorderSide(
                                               color: Colors.white60,
                                             )
                                         ),
                                         disabledBorder: OutlineInputBorder(
                                             borderRadius: BorderRadius.circular(30),
                                             borderSide: BorderSide(
                                               color: Colors.white60,
                                             )
                                         ),
                                         contentPadding: const EdgeInsets.symmetric(horizontal: 14,vertical: 6,),
                                         fillColor: Colors.white,
                                         filled: true,
                                       ),
                                     ),
                                     const SizedBox(height: 18,),
                                    Obx(
                                        () =>  TextFormField(
                                          controller: loginController.passwordController,
                                          obscureText: isObsecure.value,
                                          validator: (val) => val == "" ? "Please write password ": null,
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.vpn_key_sharp,
                                              color: Colors.black,
                                            ),
                                            suffixIcon: Obx(
                                                    ()=> GestureDetector(
                                                  onTap: ()
                                                  {
                                                    isObsecure.value = !isObsecure.value;
                                                  },
                                                  child: Icon(
                                                    isObsecure.value ? Icons.visibility_off : Icons.visibility,
                                                    color: Colors.black,
                                                  ),
                                                )
                                            ),
                                            hintText: "password...",
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(30),
                                                borderSide: BorderSide(
                                                  color: Colors.white60,
                                                )
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(30),
                                                borderSide: BorderSide(
                                                  color: Colors.white60,
                                                )
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(30),
                                                borderSide: BorderSide(
                                                  color: Colors.white60,
                                                )
                                            ),
                                            disabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(30),
                                                borderSide: BorderSide(
                                                  color: Colors.white60,
                                                )
                                            ),
                                            contentPadding: const EdgeInsets.symmetric(horizontal: 14,vertical: 6,),
                                            fillColor: Colors.white,
                                            filled: true,
                                          ),
                                        ),
                                    ),
                                     const SizedBox(height: 18,),
                                     Material(
                                       color: Colors.black,
                                       borderRadius: BorderRadius.circular(30),
                                       child: InkWell(
                                         onTap: () {  if (formKey.currentState!.validate()) {

                                           loginController.loginWithEmail();
                                         }},

                                         borderRadius: BorderRadius.circular(30),
                                         child: const Padding(
                                           padding: EdgeInsets.symmetric(
                                             vertical: 10,
                                             horizontal: 28,
                                           ),
                                           child: Text(
                                             "Login",
                                             style: TextStyle(
                                               color: Colors.white,
                                               fontSize: 16,
                                             ),
                                           ),
                                         ),
                                       ),
                                     )
                                   ],
                                 ),

                               ),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Text(
                                     "Don't have an Account?"
                                   ),
                                   TextButton(
                                       onPressed: (){
                                         Get.to(SignUpScreen());
                                       },
                                       child: Text(
                                         "SignUp Here",
                                         style: TextStyle(
                                           color: Colors.purpleAccent,
                                         ),
                                       ))
                                 ],
                               ),
                             ],
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
             );

           },
         ),
    );
  }
}
