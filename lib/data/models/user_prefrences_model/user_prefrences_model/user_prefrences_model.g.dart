// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_prefrences_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPrefrencesModel _$UserPrefrencesModelFromJson(Map<String, dynamic> json) =>
    UserPrefrencesModel(
      height: json['height'] as String?,
      maritalStatus: json['marital_status'] as String?,
      faith: json['faith'] as String?,
      motherTongue: json['mother_tongue'] as String?,
      smokeStatus: json['smoke_status'] as String?,
      alcoholStatus: json['alcohol_status'] as String?,
      settleStatus: json['settle_status'] as String?,
      hobbies: json['hobbies'] as String?,
      teaPerson: json['tea_person'] as String?,
      loveLanguage: json['love_language'] as String?,
    );

Map<String, dynamic> _$UserPrefrencesModelToJson(
        UserPrefrencesModel instance) =>
    <String, dynamic>{
      'height': instance.height,
      'marital_status': instance.maritalStatus,
      'faith': instance.faith,
      'mother_tongue': instance.motherTongue,
      'smoke_status': instance.smokeStatus,
      'alcohol_status': instance.alcoholStatus,
      'settle_status': instance.settleStatus,
      'hobbies': instance.hobbies,
      'tea_person': instance.teaPerson,
      'love_language': instance.loveLanguage,
    };
