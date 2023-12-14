import 'package:json_annotation/json_annotation.dart';

part 'user_details_model.g.dart';

@JsonSerializable()
class UserDetailsModel {
  @JsonKey(name: 'fullname')
  String? fullname;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'location')
  String? location;

  @JsonKey(name: 'dob')
  String? dob;

  @JsonKey(name: 'gender')
  String? gender;

  UserDetailsModel({
    this.fullname,
    this.email,
    this.location,
    this.dob,
    this.gender,
  });

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) {
    return _$UserDetailsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserDetailsModelToJson(this);
}
