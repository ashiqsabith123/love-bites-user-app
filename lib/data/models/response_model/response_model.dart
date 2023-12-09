import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'response_model.g.dart';

@JsonSerializable()
class ResponseModel {
  int? status;
  String? message;
  String? error;
  Data? data;

  ResponseModel({this.status, this.message, this.error, this.data});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return _$ResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}
