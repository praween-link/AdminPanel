import 'dart:developer';
import 'package:adminpanel/controller/admin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'widgets/decoration.dart';
import 'home.dart';
import 'widgets/submit_buttom.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AdminController adminController = Get.put(AdminController());

  final _formKey = GlobalKey<FormState>();
  //
  final TextEditingController usernameEditingController =
      TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async => false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 60),
                Image.asset('assets/img/login.png'),
                // FORM
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // TITLE
                      const Text(
                        'ADMIN LOGIN',
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2,
                          wordSpacing: 3
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      // USERNAME TEXT FIELD
                      TextFormField(
                        decoration: MyDecoration.inputDecoration(
                            label: 'Username',
                            hint: 'Enter your username',
                            icon: Icons.email),
                        keyboardType: TextInputType.emailAddress,
                        enableSuggestions: false,
                        autocorrect: false,
                        controller: usernameEditingController,
                        validator: (value) {
                          if (value == '') {
                            return 'The username field should not be empty!';
                          }
                        },
                      ),
                      const SizedBox(height: 5.0),
                      // PASSWORD TEXT FIELD
                      TextFormField(
                        decoration: MyDecoration.inputDecoration(
                            label: 'Password',
                            hint: 'Enter your password',
                            icon: Icons.password),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
    
                        controller: passwordEditingController,
                        validator: (value) {
                          if (value == '') {
                            return 'The password field should not be empty!';
                          }
                        },
                      ),
                      const SizedBox(height: 15.0),
                      
                      // LOGIN BUTTON
                      StatefulBuilder(builder: (context, StateSetter setState) {
                        return GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              if (usernameEditingController.text ==
                                      adminController.username &&
                                  passwordEditingController.text ==
                                      adminController.password) {
                                log('Logined!');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ),
                                );
                              } else {
                                topSnackBar(
                                    context, "Username and Password are wrong!");
                              }
                            }
                          },
                          child: const SubmitButton(title: 'NEXT'),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  // TOP SNACK BAR
  void topSnackBar(BuildContext context, String mgs) {
    return showTopSnackBar(
      context,
      CustomSnackBar.error(
        message: mgs,
        backgroundColor: Colors.white.withOpacity(0.8),
        textStyle: const TextStyle(
            color: Color.fromARGB(255, 209, 7, 7),
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
