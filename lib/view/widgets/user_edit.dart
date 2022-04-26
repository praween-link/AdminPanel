import 'package:adminpanel/controller/user.dart';
import 'package:adminpanel/model/user.dart';
import 'package:adminpanel/view/widgets/decoration.dart';
import 'package:adminpanel/view/widgets/submit_buttom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class UserEdit extends StatefulWidget {
  const UserEdit({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<UserEdit> createState() => _UserEditState();
}

class _UserEditState extends State<UserEdit> {
  final UserController userController = Get.put(UserController());
  final _formKey = GlobalKey<FormState>();

  String firstname = '';
  String lastname = '';
  String email = '';

  initCall() {
    setState(() {
      firstname = widget.user.firstName!;
      lastname = widget.user.lastName!;
      email = widget.user.email!;
    });
  }

  @override
  void initState() {
    super.initState();
    initCall();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // HEADER
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text(
                    'Edit User Data',
                    style: TextStyle(
                      color: Color.fromARGB(255, 2, 34, 59),
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(child: Container()),
                  IconButton(
                      onPressed: () => Get.back(),
                      icon: (const Icon(Icons.close)))
                ],
              ),
            ),
            // FORM
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10.0),
                  // FIRST NAME TEXT FIELD
                  TextFormField(
                    decoration: MyDecoration.inputDecoration(
                        label: 'First name',
                        hint: 'Enter your first name',
                        icon: Icons.account_circle),
                    initialValue: firstname,
                    enableSuggestions: false,
                    autocorrect: false,
                    onChanged: (value) => setState(() => firstname = value),
                    validator: (value) {
                      if (value == '') {
                        return 'The first name field should not be empty!';
                      }
                    },
                  ),
                  const SizedBox(height: 5.0),
                  // LAST NAME TEXT FIELD
                  TextFormField(
                    decoration: MyDecoration.inputDecoration(
                        label: 'Last name',
                        hint: 'Enter your last name',
                        icon: Icons.account_circle),
                    initialValue: lastname,
                    enableSuggestions: false,
                    autocorrect: false,
                    onChanged: (value) => setState(() => lastname = value),
                    validator: (value) {
                      if (value == '') {
                        return 'The last name field should not be empty!';
                      }
                    },
                  ),
                  const SizedBox(height: 5.0),
                  // USER EMAIL
                  TextFormField(
                    decoration: MyDecoration.inputDecoration(
                        label: 'Email',
                        hint: 'Enter your email',
                        icon: Icons.email),
                    initialValue: email,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => setState(() => email = value),
                    // obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    validator: (value) {
                      if (value == '') {
                        return 'The email field should not be empty!';
                      }
                    },
                  ),
                  const SizedBox(height: 15.0),
                  //
                  // EDIT BUTTON
                  StatefulBuilder(
                    builder: (context, StateSetter setState) {
                      return GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            if (userController.searchUser(email) != null) {
                              topSnackBar(
                                  context,
                                  "User data changed succefully!",
                                  Colors.green);
                              Get.back();
                            } else {
                              topSnackBar(context, "User data not change!",
                                  Color.fromARGB(255, 209, 7, 7));
                            }
                          }
                        },
                        child: const SubmitButton(title: 'CHANGE USER DATA'),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
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
