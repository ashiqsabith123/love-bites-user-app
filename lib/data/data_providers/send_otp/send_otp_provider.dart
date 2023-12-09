import 'package:dio/dio.dart';
import 'package:love_bites_user_app/data/models/response_model/response_model.dart';
import 'package:love_bites_user_app/data/models/sign_up_otp_model/signup_otp_model.dart';
import 'package:love_bites_user_app/data/network/dio_network.dart';
import 'package:love_bites_user_app/util/api_end_points/api_end_points.dart';

class SendOtpDataProvider {
  final dio = getNetwork();

  Future<ResponseModel> sendOtp(OtpModel otpModel) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      final response =
          await dio.post(ApiEndPoints.sendOtp, data: otpModel.toJson());
      if (response.statusCode == 200) {
        return ResponseModel.fromJson(response.data);
      } else {
        //if any error
        return ResponseModel(status: 404, message: 'Something error1');
      }
    } on DioException catch (e) {
      if (e.response!.statusCode! >= 400) {
        return ResponseModel(
          status: e.response?.statusCode,
          message: e.response?.data['message'],
        );
      }
    } catch (e) {
      return ResponseModel(status: 404, message: 'Something error1 $e');
    }

    return ResponseModel();
  }
}
