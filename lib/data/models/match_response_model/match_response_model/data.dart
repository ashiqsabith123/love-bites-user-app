import 'package:json_annotation/json_annotation.dart';

import 'matched_user.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<MatchedUser>? matchedUsers;

  Data({this.matchedUsers});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
