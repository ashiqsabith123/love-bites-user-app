import 'package:json_annotation/json_annotation.dart';

import 'user_image.dart';

part 'matched_user.g.dart';

@JsonSerializable()
class MatchedUser {
  @JsonKey(name: 'userID')
  int? userId;
  String? name;
  int? age;
  String? place;
  int? matchScore;
  List<UserImage>? userImages;

  MatchedUser({
    this.userId,
    this.name,
    this.age,
    this.place,
    this.matchScore,
    this.userImages,
  });

  factory MatchedUser.fromJson(Map<String, dynamic> json) {
    return _$MatchedUserFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MatchedUserToJson(this);
}
