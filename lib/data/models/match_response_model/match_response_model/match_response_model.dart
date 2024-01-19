import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'match_response_model.g.dart';

@JsonSerializable()
class MatchResponseModel {
  @JsonKey(name: 'status')
  int? status;

@JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'data')
  Data? data;

  MatchResponseModel({this.status, this.message, this.data});

  factory MatchResponseModel.fromJson(Map<String, dynamic> json) {
    return _$MatchResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MatchResponseModelToJson(this);
}
