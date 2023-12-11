import 'package:json_annotation/json_annotation.dart';

part 'auth_otp_model.g.dart';

@JsonSerializable()
class AuthOtpModel {
  @JsonKey(name: 'phone')
  String? phone;

  AuthOtpModel({this.phone});

  factory AuthOtpModel.fromJson(Map<String, dynamic> json) {
    return _$AuthOtpModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuthOtpModelToJson(this);
}
