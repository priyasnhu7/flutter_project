class UserModel {
  String name;
  String userName;
  String? token;
  String id;
  String? imageUrl;

  UserModel({required this.name, this.token, required this.userName, required this.id, this.imageUrl});
}
