// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matched_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchedUser _$MatchedUserFromJson(Map<String, dynamic> json) => MatchedUser(
      userId: json['userID'] as int?,
      name: json['name'] as String?,
      age: json['age'] as int?,
      place: json['place'] as String?,
      matchScore: json['matchScore'] as int?,
      userImages: (json['userImages'] as List<dynamic>?)
          ?.map((e) => UserImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MatchedUserToJson(MatchedUser instance) =>
    <String, dynamic>{
      'userID': instance.userId,
      'name': instance.name,
      'age': instance.age,
      'place': instance.place,
      'matchScore': instance.matchScore,
      'userImages': instance.userImages,
    };
