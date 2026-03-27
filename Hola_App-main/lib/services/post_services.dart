import 'dart:convert';
import 'package:hola_app/models/comments_model.dart';
import 'package:hola_app/constants/data_constants.dart';
import 'package:hola_app/models/homepage_model.dart';
import 'package:http/http.dart';

class PostServices {
  Future<String> getHomePagePosts() async {
    try {
      Response response = await get(
          Uri.parse("https://snapverse-6nqx.onrender.com/posts"),
          headers: Map<String, String>.from({"cookie": loggedInUser!.token}));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        for (var item in data['posts']) {
          print(item.toString());
          if (item['image'] == null) {
          } else {
            homePagePosts.add(HomepageModel(
              id: item['_id'],
                image: item['image']['url'],
                userName: item['user']['name'],
                caption: item['caption'],
                imageUrl: item['user']['profileImage']['url'],
                likes: item['likesCount'],
                comments: item['commentsCount'],
                isliked: false));
          }
        }
        print("home Page posts length = " + homePagePosts.length.toString());
        return "Posts Fetched";
      }
    } catch (e) {
      throw "Posts not fetched";
    }
    throw "Posts not fetched";
  }


  Future<String> getExplorePagePosts() async {
    try {
      Response response = await get(
        
          Uri.parse("https://snapverse-6nqx.onrender.com/posts"),
          headers: Map<String, String>.from({"cookie": loggedInUser!.token}));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        for (var item in data['posts']) {
          print(item.toString());
          if (item['image'] == null) {
          } else {
            explorePagePosts.add(HomepageModel(
              id: item['_id'],
                image: item['image']['url'],
                userName: item['user']['name'],
                caption: item['caption'],
                imageUrl: item['user']['profileImage']['url'],
                likes: item['likesCount'],
                comments: item['commentsCount'],
                isliked: false));
          }
        }
        print("home Page posts length = " + homePagePosts.length.toString());
        return "Posts Fetched";
      }
    } catch (e) {
      throw "Posts not fetched";
    }
    throw "Posts not fetched";
  }



  Future<List<CommentsModel>> getCommentOfPost (String postId) async{
    print("post id = " + postId);
    try {
      Response response = await get(
          Uri.parse("https://snapverse-6nqx.onrender.com/posts/$postId/comments"),
          headers: Map<String, String>.from({"cookie": loggedInUser!.token}));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        List<CommentsModel> commentsModel = [];
        for (var item in data['comments']) {
          print(item.toString());
          commentsModel.add(CommentsModel(comment: item['text'], userName: item['user']['userName']));
        }
        return commentsModel;
      }
    } catch (e) {
      throw "Comments not fetched";
    }
    throw "Comments not fetched";
  }

  Future <List<CommentsAddModel>> postComment(String postId) async{
    print("post id = " + postId);
    try {
      Response response = await get(
          Uri.parse("https://snapverse-6nqx.onrender.com/posts/$postId/comments"),
          );
          if (response.statusCode == 201) {
        var data = jsonDecode(response.body.toString());
        List<CommentsAddModel> commentsAddModel = [];
        for (var item in data['newComment']) {
          print(item.toString());
          commentsAddModel.add(CommentsAddModel(comment: item['text']));
        }
        return commentsAddModel;
      }
          
        

    }
    catch(e){
      throw "Comments not fetched";

    }
    throw "Comments not fetched";
  }

  //   Future uploadFileImage(
  //     {String url = 'image/upload',
  //     required File image,
  //     bool useAuthHeaders = true}) async {
  //   final mimeTypeData =
  //       lookupMimeType(image.path, headerBytes: [0xFF, 0xD8])!.split('/');
  //   Map<String, String> headers = {'cookie' : loggedInUser!.token!};// ignore this headers if there is no authentication
  //   final imageUploadRequest =
  //       MultipartRequest('POST', Uri.parse("https://snapverse-6nqx.onrender.com/posts"));
  //   final file = await MultipartFile.fromPath('file', image.path,
  //       contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
  //   imageUploadRequest.fields['ext'] = mimeTypeData[1];
  //   imageUploadRequest.files.add(file);
  //   imageUploadRequest.headers.addAll(headers);

  //   final streamedResponse = await imageUploadRequest.send();
  //   final response = await Response.fromStream(streamedResponse);
  //   return _getResponse(response);
  // }

// Future<void> uploadImage(PostModel postModel) async {
//   try {
//     if (!postModel.image.existsSync()) {
//       throw Exception("File does not exist");
//     }

//     // Create a MultipartRequest
//     final request = MultipartRequest('POST', Uri.parse("https://snapverse-6nqx.onrender.com/posts"));

//     // Get the MIME type of the file (e.g., image/jpeg, image/png)
//     final mimeType = lookupMimeType(postModel.image.path) ?? 'application/octet-stream';

//     // Add the file to the request
//     final multipartFile = await MultipartFile.fromPath(
//       'file', // Field name in the API
//       postModel.image.path,
//       contentType: MediaType(mimeType.split('/')[0], mimeType.split('/')[1]),
//     );

//     request.files.add(multipartFile);
//     request.headers.addAll({"cookie": loggedInUser!.token!});
//     request.fields.addAll({"caption": postModel.caption,
//     "username": loggedInUser!.userName!,
//     "image": {
//         "url": ,
//         "filename": "sunset.jpg"
//     }});



//     // Send the request
//     final response = await request.send();

//     // Check the response
//     if (response.statusCode == 200) {
//       print('Image uploaded successfully!');
//     } else {
//       print('Image upload failed with status: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Error uploading image: $e');
//   }
}


