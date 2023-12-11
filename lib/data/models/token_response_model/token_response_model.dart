import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'token_response_model.g.dart';

@JsonSerializable()
class TokenResponseModel {
  int? status;
  String? message;
  String? error;
  Data? data;

  TokenResponseModel({this.status, this.message, this.error, this.data});

  factory TokenResponseModel.fromJson(Map<String, dynamic> json) {
    return _$TokenResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TokenResponseModelToJson(this);
}
