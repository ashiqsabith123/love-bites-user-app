// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonResponseModel _$CommonResponseModelFromJson(Map<String, dynamic> json) =>
    CommonResponseModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$CommonResponseModelToJson(
        CommonResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'error': instance.error,
    };
