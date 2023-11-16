import 'package:json_annotation/json_annotation.dart';

part 'sign_up_model.g.dart';

@JsonSerializable()
class SignUpModel {
  @JsonKey(name: 'fullname')
  String? fullname;

  @JsonKey(name: 'phone')
  int? phone;

  @JsonKey(name: 'username')
  String? username;

  @JsonKey(name: 'password')
  String? password;

  SignUpModel({this.fullname, this.phone, this.username, this.password});

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return _$SignUpModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SignUpModelToJson(this);
}
