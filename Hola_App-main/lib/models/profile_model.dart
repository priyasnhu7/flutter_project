
class ProfileModel {
  String coverImage;
  String profileImage;
  String name;
  String userName;
  int followers;
  int followings;
  List<String> postsUrls;

  ProfileModel({
    required this.coverImage,
    required this.followers,
    required this.followings,
    required this.name,
    required this.postsUrls,
    required this.profileImage,
    required this.userName
  });


}