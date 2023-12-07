import 'package:json_annotation/json_annotation.dart';

part 'signup_otp_model.g.dart';

@JsonSerializable()
class SignupOtpModel {
  @JsonKey(name: 'phone')
  String? phone;

  SignupOtpModel({this.phone});

  factory SignupOtpModel.fromJson(Map<String, dynamic> json) {
    return _$SignupOtpModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SignupOtpModelToJson(this);
}
