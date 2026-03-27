class CommentsModel {
  String userName;
  String comment;

  CommentsModel({ required this.comment, required this.userName});
}

class CommentsAddModel {
  String comment;

  CommentsAddModel({ required this.comment});
}