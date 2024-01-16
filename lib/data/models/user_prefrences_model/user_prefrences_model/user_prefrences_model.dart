import 'package:json_annotation/json_annotation.dart';

part 'user_prefrences_model.g.dart';

@JsonSerializable()
class UserPrefrencesModel {
  @JsonKey(name: "height")
  String? height;

  @JsonKey(name: 'marital_status')
  String? maritalStatus;

  @JsonKey(name: "faith")
  String? faith;

  @JsonKey(name: 'mother_tongue')
  String? motherTongue;

  @JsonKey(name: 'smoke_status')
  String? smokeStatus;

  @JsonKey(name: 'alcohol_status')
  String? alcoholStatus;

  @JsonKey(name: 'settle_status')
  String? settleStatus;

  @JsonKey(name: "hobbies")
  String? hobbies;

  @JsonKey(name: 'tea_person')
  String? teaPerson;

  @JsonKey(name: 'love_language')
  String? loveLanguage;

  UserPrefrencesModel({
    this.height,
    this.maritalStatus,
    this.faith,
    this.motherTongue,
    this.smokeStatus,
    this.alcoholStatus,
    this.settleStatus,
    this.hobbies,
    this.teaPerson,
    this.loveLanguage,
  });

  factory UserPrefrencesModel.fromJson(Map<String, dynamic> json) {
    return _$UserPrefrencesModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserPrefrencesModelToJson(this);
}
