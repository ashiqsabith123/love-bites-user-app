import 'package:json_annotation/json_annotation.dart';

part 'signup_otp_model.g.dart';

@JsonSerializable()
class OtpModel {
  @JsonKey(name: 'phone')
  String? phone;

  OtpModel({this.phone});

  factory OtpModel.fromJson(Map<String, dynamic> json) {
    return _$OtpModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OtpModelToJson(this);
}
