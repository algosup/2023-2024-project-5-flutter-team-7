class LayoutModel {
  LayoutType layoutType;
  UserType userType;

  LayoutModel(this.layoutType, this.userType);
}

enum UserType {
  jobSeeker,
  company,
}

enum LayoutType {
  login,
  createProfile,
  editProfile,
  matchmaking,
  settings,
  ;

  bool showAppBar() {
    switch (this) {
      case LayoutType.login:
        return false;
      case LayoutType.createProfile:
        return false;
      case LayoutType.editProfile:
        return true;
      case LayoutType.matchmaking:
        return true;
      case LayoutType.settings:
        return true;
    }
  }
}
