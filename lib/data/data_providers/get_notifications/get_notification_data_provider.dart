import 'package:dio/dio.dart';

import 'package:love_bites_user_app/data/models/notification_model/notification_model.dart';
import 'package:love_bites_user_app/data/network/dio_network.dart';
import 'package:love_bites_user_app/data/secure_data/secure_data.dart';
import 'package:love_bites_user_app/util/api_end_points/api_end_points.dart';

class GetNotificationProvider {
  final dio = getNetwork();
  Future<NotificationModel> getNotification(
      {String day = "", String type = ""}) async {
    final String start = '{ "query": "{ notifications';
    final String end =
        '{ CommonID, SenderID, Time, Image, Name, Type, Status} }"}';

    String query;

    if (day.isNotEmpty || type.isNotEmpty) {
      query = start + '(';
      if (day.isNotEmpty) {
        query += start + 'day: \"$day\"';
      }

      if (type.isNotEmpty) {
        query += ',type:\"$type\"';
      }

      query += ')' + end;
    } else {
      query = start + end;
    }

    print('queryyy $query');

    try {
      String? token = await tokenStorage.read(key: 'token');
      final response = await dio.post(
        ApiEndPoints.getNotification,
        data: query,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );

      if (response.statusCode == 200 &&
          response.data != null) {
        
        return NotificationModel.fromJson(response.data);
      } else {
        return NotificationModel();
      }
    } on DioException catch (e) {
      return NotificationModel();
    } catch (e) {
      return NotificationModel();
    }
  }
}
