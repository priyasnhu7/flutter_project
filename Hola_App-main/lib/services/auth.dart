// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print

import 'dart:convert';

import 'package:hola_app/constants/data_constants.dart';
import 'package:hola_app/models/user_model.dart';
import 'package:http/http.dart';

class AuthAPI {
  Future<String> signup(
      {required String name,
      required String email,
      required String password}) async {
    try {
      Response response = await post(
          Uri.parse("https://snapverse-6nqx.onrender.com/api/auth/signup"),
          body: {
            'name': name,
            'email': email,
            'password': password,
            'userName': name
          });
      print("sign up status code " + response.statusCode.toString());
      print("sign up response = " + response.body.toString());

      if (response.statusCode == 201) {
        var data = jsonDecode(response.body.toString());
        print(
            "sign up verification token " + data['user']['verificationToken']);

        print(
            'Cookies from response:${response.headers['set-cookie']?.substring(0, response.headers['set-cookie']?.indexOf(';'))}');
            loggedInUser = UserModel(name: name, token: response.headers['set-cookie']!
            .substring(0, response.headers['set-cookie']?.indexOf(';')), userName: name,id: data['user']['_id']);

        return data['user']['verificationToken'];
      }
    } catch (e) {
      throw "Signup Failed";
    }

    throw "SignUp Failed";
  }

  Future<String> verifyEmail(String code) async {
    try {
      Response responseEmail = await post(
          Uri.parse(
              "https://snapverse-6nqx.onrender.com/api/auth/verify-email"),
          body: {'code': code});
      if (responseEmail.statusCode == 200) {
        return "Email Verified";
      }
    } catch (e) {
      throw "Email Verification Failed";
    }
    throw "Email Verification Failed";
  }

  Future<String> signIn(
      {required String email, required String password}) async {
    try {
      Response response = await post(
          Uri.parse('https://snapverse-6nqx.onrender.com/api/auth/login'),
          body: {
            'email': email,
            'password': password,
          });

      print("login status code = " + response.statusCode.toString());
      print("login response = " + response.body.toString());

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(
            'Cookies from response:${response.headers['set-cookie']?.substring(0, response.headers['set-cookie']?.indexOf(';'))}');
            loggedInUser = UserModel(name: data['user']['name'], token: response.headers['set-cookie']!
            .substring(0, response.headers['set-cookie']?.indexOf(';')), userName: data['user']['userName'],id: data['user']['_id']);
            print("token = " + loggedInUser!.token!);
        return "Logged in Sucessfully";
      }
    } catch (e) {
      throw "Login Failed";
    }
    throw "Login Failed";
  }
}
