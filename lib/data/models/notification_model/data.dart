import 'package:json_annotation/json_annotation.dart';

import 'notification.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<Notification>? notifications;

  Data({this.notifications});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
