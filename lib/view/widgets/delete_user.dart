import 'package:adminpanel/controller/user.dart';
import 'package:adminpanel/model/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class DeleteUser extends StatelessWidget {
  DeleteUser({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(
            Icons.delete,
            color: Colors.red.withOpacity(0.8),
            size: 20,
          ),
          const SizedBox(width: 5),
          const Text(
            'DELETE',
            style: TextStyle(
              color: Colors.red,
              fontSize: 15,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
      content: Text(
        '~ Are you sure to delete this user ${user.email}',
        style: const TextStyle(
          color: Color.fromARGB(255, 88, 87, 87),
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 1,
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Get.back(),
          child: const Text(
            'NO',
          ),
        ),
        TextButton(
          onPressed: () {
            if (userController.deleteUser(user)) {
              topSnackBar(context, "User deleted succefully!");
              Get.back();
            }
          },
          child: const Text(
            'YES',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }

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
