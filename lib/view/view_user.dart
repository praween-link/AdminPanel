import 'package:adminpanel/model/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/delete_user.dart';
import 'widgets/user_edit.dart';

class UserView extends StatelessWidget {
  const UserView({Key? key, required this.user}) : super(key: key);

  final User user;

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
        title: const Text('View User'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          // USER PROFILE IMAGE
          Center(
            child: CircleAvatar(
              radius: 52,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user.avatar!),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // USER NAME
          Text(
            "${user.firstName!} ${user.lastName!}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 5),
          // USER EMAIL ID
          Text(
            user.email!,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
          
          const SizedBox(height: 10),
          // USER EDIT AND DELETE
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                child: IconButton(
                  onPressed: () {
                    Get.bottomSheet(
                      Container(
                        child: UserEdit(
                          user: user,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                      ),
                      barrierColor:
                          Color.fromARGB(255, 57, 56, 56).withOpacity(0.8),
                      isDismissible: false,
                    );
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              CircleAvatar(
                child: IconButton(
                  onPressed: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => DeleteUser(
                        user: user,
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
