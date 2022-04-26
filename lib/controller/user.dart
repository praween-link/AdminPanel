import 'dart:io';

import 'package:adminpanel/model/user.dart';
import 'package:adminpanel/service/post.dart';
import 'package:adminpanel/service/urls.dart';
import 'package:adminpanel/service/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var users = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
    getUsers();
  }
  // FETCH ALL USERS
  void getUsers() async {
    var d = await UserService.getUsers();
    if (d != null) {
      users.value = d;
    }
  }

  // CHECK USER IN USER LIST
  dynamic searchUser(String email) {
    for (var u in users) {
      if (u.email == email) {
        return u;
      }
    }
    return null;
  }
  // DELETE USER
  bool deleteUser(User user) {
    users.remove(user);
    return true;
  }

  // ADD NEW USER
  Future<Map<String, dynamic>?> add(
      {required String firstname,
      required String lastname,
      required String email,
      required File file}) async {
    final body = FormData({
      'first_name': firstname,
      'last_name': lastname,
      'email': email,
      // "avatar": MultipartFile(file, filename: '$email.jpg'),
      'avatar': null,
    });

    var res = Post().posts(url, body);
    res.then((value) {
      // users.add(
      //   User(
      //     id: value['id'],
      //     firstName: firstname,
      //     lastName: lastname,
      //     email: email,
      //     avatar: null,
      //   ),
      // );
    });
    return res.then((value) => value);
  }
}
