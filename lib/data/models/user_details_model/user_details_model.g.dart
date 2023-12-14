// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailsModel _$UserDetailsModelFromJson(Map<String, dynamic> json) =>
    UserDetailsModel(
      fullname: json['fullname'] as String?,
      email: json['email'] as String?,
      location: json['location'] as String?,
      dob: json['dob'] as String?,
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$UserDetailsModelToJson(UserDetailsModel instance) =>
    <String, dynamic>{
      'fullname': instance.fullname,
      'email': instance.email,
      'location': instance.location,
      'dob': instance.dob,
      'gender': instance.gender,
    };
