import 'package:json_annotation/json_annotation.dart';

part 'common_response_model.g.dart';

@JsonSerializable()
class CommonResponseModel {
  int? status;
  String? message;
  String? error;

  CommonResponseModel({this.status, this.message, this.error});

  factory CommonResponseModel.fromJson(Map<String, dynamic> json) {
    return _$CommonResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CommonResponseModelToJson(this);
}
