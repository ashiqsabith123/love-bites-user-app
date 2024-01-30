// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      commonId: json['CommonID'] as int?,
      image: json['Image'] as String?,
      name: json['Name'] as String?,
      senderId: json['SenderID'] as int?,
      status: json['Status'] as String?,
      time: json['Time'] as String?,
      type: json['Type'] as String?,
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'CommonID': instance.commonId,
      'Image': instance.image,
      'Name': instance.name,
      'SenderID': instance.senderId,
      'Status': instance.status,
      'Time': instance.time,
      'Type': instance.type,
    };
