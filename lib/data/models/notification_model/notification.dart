import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';

@JsonSerializable()
class Notification {
  @JsonKey(name: 'CommonID')
  int? commonId;
  @JsonKey(name: 'Image')
  String? image;
  @JsonKey(name: 'Name')
  String? name;
  @JsonKey(name: 'SenderID')
  int? senderId;
  @JsonKey(name: 'Status')
  String? status;
  @JsonKey(name: 'Time')
  String? time;
  @JsonKey(name: 'Type')
  String? type;

  Notification({
    this.commonId,
    this.image,
    this.name,
    this.senderId,
    this.status,
    this.time,
    this.type,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return _$NotificationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}
