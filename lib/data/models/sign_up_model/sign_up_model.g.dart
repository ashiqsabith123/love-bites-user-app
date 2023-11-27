// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpModel _$SignUpModelFromJson(Map<String, dynamic> json) => SignUpModel(
      fullname: json['fullname'] as String?,
      phone: json['phone'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
    )..otp = json['otp'] as String?;

Map<String, dynamic> _$SignUpModelToJson(SignUpModel instance) =>
    <String, dynamic>{
      'fullname': instance.fullname,
      'phone': instance.phone,
      'username': instance.username,
      'password': instance.password,
      'otp': instance.otp,
    };
