import 'package:adminpanel/controller/user.dart';
import 'package:adminpanel/model/user.dart';
import 'package:adminpanel/view/widgets/decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'delete_user.dart';
import 'user_edit.dart';

class UserTile extends StatelessWidget {
  UserTile({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              // PROFILE IMAGE
              CircleAvatar(
                radius: 36,
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(user.avatar == null
                      ? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
                      : user.avatar!),
                ),
              ),
              const SizedBox(width: 10),
              // CONTENTS
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${user.firstName!} ${user.lastName!}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      user.email!,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              // DELETE AND EDIT BUTTONS
              Container(
                height: 35,
                child: Row(
                  children: [
                    IconButton(
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
                      icon: Icon(
                        Icons.edit,
                        color:
                            Color.fromARGB(255, 17, 82, 135).withOpacity(0.5),
                        size: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => DeleteUser(
                            user: user,
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red.withOpacity(0.5),
                        size: 22,
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1,
                      blurStyle: BlurStyle.normal,
                      color: Color.fromARGB(255, 1, 94, 85).withOpacity(0.1),
                      offset: const Offset(1,1),
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      blurRadius: 0,
                      blurStyle: BlurStyle.normal,
                      color: const Color.fromARGB(255, 1, 94, 85).withOpacity(0.1),
                      offset: const Offset(0, 0),
                      spreadRadius: 0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        decoration: MyDecoration.userTileBoxDecoration,
      ),
    );
  }
}
