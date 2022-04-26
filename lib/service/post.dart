import 'package:get/get.dart';

class Post extends GetConnect {
  Future<dynamic> posts(String url, dynamic body) async {
    final response = await post(url, body);
    if (response.statusCode == 201) {
      return response.body;
    } else {
      return null;
    }
  }
}
