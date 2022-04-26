import 'dart:convert';
import 'dart:developer';
import 'package:adminpanel/model/user.dart';
import 'package:adminpanel/service/urls.dart';
import 'package:http/http.dart' as http;

class UserService {
  static var client = http.Client();

  static Future<List<User>?> getUsers() async {
    var urlu = Uri.parse(url);
    var response = await client.get(urlu);
    if (response.statusCode == 200) {
      var jsonString = json.encode(json.decode(response.body)['data']);
      return userFromJson(jsonString);
    } else {
      // Error
      return null;
    }
  }

  static Future<User?> addUser(User user) async {
    var urlu = Uri.parse(url);
    //
    var h = <String, String>{'Content-Type': 'application/json; charset=UTF-8'};
    var b = jsonEncode(<String, String>{
      'first_name': user.firstName!,
      'last_name': user.lastName!,
      'email': user.email!,
      'avatar': user.avatar!,
    });
    //
    var response = await client.post(urlu, body: b, headers: h);
    if (response.statusCode == 201) {
      var u = response.body;
      log(u.toString());
      return User();
    } else {
      // Error
      return null;
    }
  }
}
