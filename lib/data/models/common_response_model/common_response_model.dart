import 'package:json_annotation/json_annotation.dart';

part 'common_response_model.g.dart';

@JsonSerializable()
class CommonResponseModel {
  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'error')
  String? error;

  CommonResponseModel({this.status, this.message, this.error});

  factory CommonResponseModel.fromJson(Map<String, dynamic> json) {
    return _$CommonResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CommonResponseModelToJson(this);
}
