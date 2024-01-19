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
    );

Map<String, dynamic> _$MatchResponseModelToJson(MatchResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
