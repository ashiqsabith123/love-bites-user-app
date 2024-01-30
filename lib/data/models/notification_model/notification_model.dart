import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel {
  Data? data;

  NotificationModel({this.data});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return _$NotificationModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}
