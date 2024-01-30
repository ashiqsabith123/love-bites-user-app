// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchResponseModel _$MatchResponseModelFromJson(Map<String, dynamic> json) =>
    MatchResponseModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$MatchResponseModelToJson(MatchResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'error': instance.error,
      'data': instance.data,
    };
