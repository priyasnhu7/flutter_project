import 'dart:convert';

import 'package:hola_app/constants/data_constants.dart';
import 'package:http/http.dart';

class FollowServices {
  Future<String> sendFollowRequest(String id) async {
    try {
      Response response = await post(
          Uri.parse("https://snapverse-6nqx.onrender.com/api/follow/$id"),
          headers: Map<String, String>.from({
            "cookie": loggedInUser!.token
          }));
      if (response.statusCode == 201) {
        var data = jsonDecode(response.body.toString());
        
        return data["message"];
      }
    } catch (e) {
      throw "Something went wrong";
    }
    throw "Something went wrong";
  }
}
