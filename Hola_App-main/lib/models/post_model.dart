import 'dart:io';

class PostModel {
  late File image;
  late String text;
  late String caption;
  int likes;
  int comments;
  bool isliked;
  PostModel(
      {required this.image,
      required this.text,
      required this.caption,
      required this.likes,
      required this.comments,
      required this.isliked});
}
