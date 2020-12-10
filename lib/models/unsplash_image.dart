class UnsplashImage {

  UnsplashImage(map) {
    this.id = map["id"];
    this.images = ImagesUrls(map["urls"]);
    this.likes = map["likes"] ?? 0;
    this.description = map["alt_description"] ?? "";
    this.user = UserModel(map["user"]);
  }

  UserModel user;
  String id;
  ImagesUrls images;
  int likes;
  String description;
}

class ImagesUrls {

  ImagesUrls(map) {
    this.regular = map["regular"];
  }

  String regular;
}

class UserModel {
  UserModel(map) {
    this.id = map["id"];
    this.name = map["name"];
  }

  String name;
  String id;
}