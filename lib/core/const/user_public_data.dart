class UserPublicData {
  UserPublicData._privateCunstructor();

  static UserPublicData? _instence;
  static UserPublicData get instence {
    if (_instence == null) {
      _instence = UserPublicData._privateCunstructor();
    }
    return _instence!;
  }

  String userfName = "";
  String userlName = "";
  String userImage = "";
  String UserType = "";
  void insertUserData({
    required String fName,
    required String lName,
    required String image,
  }) {
    this.userImage = image;
    this.userfName = fName;
    this.userlName = lName;
  }
}
