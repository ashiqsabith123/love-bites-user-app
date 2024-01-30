class UserImage {
  String imageId;

  UserImage({required this.imageId});

  factory UserImage.fromJson(Map<String, dynamic> json) {
    return UserImage(
      imageId: json['imageId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageId': imageId,
    };
  }
}
