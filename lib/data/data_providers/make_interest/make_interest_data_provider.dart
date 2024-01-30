import 'package:dio/dio.dart';
import 'package:love_bites_user_app/data/models/common_response_model/common_response_model.dart';

import 'package:love_bites_user_app/data/network/dio_network.dart';
import 'package:love_bites_user_app/util/api_end_points/api_end_points.dart';
import 'package:love_bites_user_app/data/secure_data/secure_data.dart';

class MakeInterstProvider {
  final dio = getNetwork();

  Future<CommonResponseModel> makeInterest(String recierverID) async {
    try {
      String? token = await tokenStorage.read(key: 'token');
      final response = await dio.post(
        ApiEndPoints.makeInterest + recierverID,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );
      if (response.statusCode == 200) {
        return CommonResponseModel.fromJson(response.data);
      } else {
        //if any error
        return CommonResponseModel(status: 404, message: 'Something error1');
      }
    } on DioException catch (e) {
      if (e.response!.statusCode! >= 400) {
        return CommonResponseModel(
          status: e.response?.statusCode,
          message: e.response?.data['message'],
        );
      }
    } catch (e) {
      return CommonResponseModel(status: 404, message: 'Something error1 $e');
    }

    return CommonResponseModel();
  }
}
