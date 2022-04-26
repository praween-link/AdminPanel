import 'dart:io';
import 'package:adminpanel/controller/user.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'widgets/decoration.dart';
import 'widgets/submit_buttom.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  UserController userController = Get.put(UserController());

  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstnameEditingController =
      TextEditingController();
  final TextEditingController lastnameEditingController =
      TextEditingController();
  final TextEditingController emailEditingController = TextEditingController();
  // IMAGE PICKER METHOD
  File? pickedFile;
  final ImagePicker _picker = ImagePicker();
  Future pickImage(ImageSource source) async {
    var pickedImage = await _picker.pickImage(source: source);
    setState(() {
      pickedFile = File(pickedImage!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 26,
          ),
        ),
        title: const Text('Add New User'),
      ),
      body: SingleChildScrollView(
        // FORM
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 25.0),
                // FIRST NAME TEXT FIELD
                TextFormField(
                  decoration: MyDecoration.inputDecoration(
                      label: 'First name',
                      hint: 'Enter your first name',
                      icon: Icons.account_circle),
                  enableSuggestions: false,
                  autocorrect: false,
                  controller: firstnameEditingController,
                  validator: (value) {
                    if (value == '') {
                      return 'The first name field should not be empty!';
                    }
                  },
                ),
                const SizedBox(height: 5.0),
                // LIST NAME TEXT FIELD
                TextFormField(
                  decoration: MyDecoration.inputDecoration(
                      label: 'Last name',
                      hint: 'Enter your last name',
                      icon: Icons.account_circle),
                  enableSuggestions: false,
                  autocorrect: false,
                  controller: lastnameEditingController,
                  validator: (value) {
                    if (value == '') {
                      return 'The last name field should not be empty!';
                    }
                  },
                ),
                const SizedBox(height: 5.0),
                // EMAIL TEXT FIELD
                TextFormField(
                  decoration: MyDecoration.inputDecoration(
                      label: 'Email',
                      hint: 'Enter your email',
                      icon: Icons.email),
                  keyboardType: TextInputType.emailAddress,
                  controller: emailEditingController,
                  enableSuggestions: false,
                  autocorrect: false,
                  validator: (value) {
                    if (value == '') {
                      return 'The email field should not be empty!';
                    }
                  },
                ),
                const SizedBox(height: 10),
                // IMAGE PICKER BUTTON
                pickedFile != null
                    ? GestureDetector(
                        onTap: () {
                          pickImage(ImageSource.gallery);
                        },
                        child: CircleAvatar(
                          radius: 32.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(58.0),
                            child: (Image.file(
                              pickedFile!,
                              height: 58,
                              width: 58,
                              fit: BoxFit.cover,
                            )),
                          ),
                        ),
                      )
                    : CircleAvatar(
                        radius: 32,
                        child: IconButton(
                          onPressed: () {
                            pickImage(ImageSource.gallery);
                          },
                          icon: const Icon(
                            Icons.photo_camera_back_rounded,
                            size: 28,
                          ),
                        ),
                      ),

                pickedFile == null
                    ? const Text(
                        'No Image Selected',
                        style: TextStyle(color: Colors.red),
                      )
                    : const Text(
                        'Image Selected',
                        style: TextStyle(color: Colors.blue),
                      ),
                const SizedBox(height: 15.0),
                //
                // USER ADD BUTTON
                StatefulBuilder(
                  builder: (context, StateSetter setState) {
                    return GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          if (pickedFile != null) {
                            var res = userController.add(
                              firstname: firstnameEditingController.text,
                              lastname: lastnameEditingController.text,
                              email: emailEditingController.text,
                              file: pickedFile!,
                            );
                            if (res != null) {
                              topSnackBar(context, "User add succefully!",
                                  Colors.green);
                            } else {
                              topSnackBar(context, "User not add try again!",
                                  Color.fromARGB(255, 209, 7, 7));
                            }
                          } else {
                            topSnackBar(
                                context,
                                "Please, select image for profile!",
                                Color.fromARGB(255, 209, 7, 7));
                          }
                        }
                      },
                      child: const SubmitButton(title: 'ADD NEW USER'),
                    );
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void topSnackBar(BuildContext context, String mgs, Color clr) {
    return showTopSnackBar(
      context,
      CustomSnackBar.error(
        message: mgs,
        backgroundColor: Colors.white.withOpacity(0.8),
        textStyle:
            TextStyle(color: clr, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
