import 'package:dio/dio.dart';
import 'package:love_bites_user_app/data/models/auth_otp_model/auth_otp_model.dart';
import 'package:love_bites_user_app/data/models/common_response_model/common_response_model.dart';
import 'package:love_bites_user_app/data/network/dio_network.dart';
import 'package:love_bites_user_app/util/api_end_points/api_end_points.dart';

class SendOtpDataProvider {
  final dio = getNetwork();

  Future<CommonResponseModel> sendOtp(AuthOtpModel authOtpModel) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      final response =
          await dio.post(ApiEndPoints.sendOtp, data: authOtpModel.toJson());
      if (response.statusCode == 200) {
        return CommonResponseModel.fromJson(response.data);
      } else {
        //if any error
        return CommonResponseModel(status: 404, message: 'Something error1');
      }
    } on DioException catch (e) {
      print(e.toString());
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
