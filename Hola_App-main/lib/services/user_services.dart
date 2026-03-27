import 'dart:convert';

import 'package:hola_app/constants/data_constants.dart';
import 'package:hola_app/models/profile_model.dart';
import 'package:hola_app/models/user_model.dart';
import 'package:http/http.dart';

class UserServices {
  Future<String> getAllUsers() async {
    try {
      Response response = await get(
        Uri.parse("https://snapverse-6nqx.onrender.com/home/suggested/users"),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        for (var item in data) {
          print(item.toString());
          allUsers.add(UserModel(
              name: item['name'],
              userName: item['userName'],
              id: item['_id'],
              imageUrl: item['profileImage']['url']));
        }
        print("all users length = " + allUsers.length.toString());
        return "Users Fetched";
      }
    } catch (e) {
      throw "Users not fetched";
    }
    throw "Users not fetched";
  }

  Future<String> getFollowers() async {
    try {
      Response response = await get(
          Uri.parse("https://snapverse-6nqx.onrender.com/api/follower/lists"),
          headers: Map<String, String>.from({"cookie": loggedInUser!.token}));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print("followers = " + response.body.toString());
        // for (var item in data) {
        //   print(item.toString());
        //   allUsers.add(UserModel(name: item['name'], userName: item['userName'], id: item['_id'],imageUrl: item['profileImage']['url']));
        // }
        // print("all users length = " + allUsers.length.toString());
        return "Users Fetched";
      }
    } catch (e) {
      throw "Users not fetched";
    }
    throw "Users not fetched";
  }

  Future<String> getFollowings() async {
    try {
      Response response = await get(
          Uri.parse("http://snapverse-6nqx.onrender.com/api/following/lists"),
          headers: Map<String, String>.from({"cookie": loggedInUser!.token}));
      print("status code" + response.statusCode.toString());
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print("followers = " + response.body.toString());
        // for (var item in data) {
        //   print(item.toString());
        //   allUsers.add(UserModel(name: item['name'], userName: item['userName'], id: item['_id'],imageUrl: item['profileImage']['url']));
        // }
        // print("all users length = " + allUsers.length.toString());
        return "Users Fetched";
      }
    } catch (e) {
      throw "Users not fetched";
    }
    throw "Users not fetched";
  }

  Future<ProfileModel> getUserData(String id) async {
    try {
      Response response = await get(
          Uri.parse("https://snapverse-6nqx.onrender.com/api/show/$id"));
      //print("^^^^^^^^^^" + response.statusCode.toString());
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print("data############" + response.body.toString());
        List<String> postsUrls = [];
        for (var item in data['posts']) {
          print(item.toString());
          if (item['image'] != null) {
            postsUrls.add(item['image']['url']);
          }
        }
        print("post length = " + postsUrls.length.toString());
        ProfileModel profileModel = ProfileModel(
            coverImage: data['user']['coverImage']['url'],
            followers: data['user']['followersCount'],
            followings: data['user']['followingCount'],
            name: data['user']['name'],
            postsUrls: postsUrls,
            profileImage: data['user']['profileImage']['url'],
            userName: data['user']['userName']);

        return profileModel;
      }
    } catch (e) {
      throw "Something went wrong";
    }
    throw "Something went wrong";
  }

  //   Future<String> getUserProfile(String id) async {
  //   try {
  //     Response response = await get(
  //       Uri.parse("https://snapverse-6nqx.onrender.com/api/show/$id"),
  //     );
  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body.toString());
  //       for (var item in data) {
  //         print(item.toString());
  //         allUsers.add(UserModel(name: item['name'], userName: item['userName'], id: item['_id'],imageUrl: item['profileImage']['url']));
  //       }
  //       print("all users length = " + allUsers.length.toString());
  //       return "Users Fetched";
  //     }
  //   } catch (e) {
  //     throw "Users not fetched";
  //   }
  //   throw "Users not fetched";
  // }
}
