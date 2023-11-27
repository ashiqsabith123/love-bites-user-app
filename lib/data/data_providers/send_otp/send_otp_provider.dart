import 'package:dio/dio.dart';
import 'package:love_bites_user_app/data/models/sign_up_otp_model/signup_otp_model.dart';
import 'package:love_bites_user_app/data/models/sign_up_otp_response_model/sign_up_otp_response_model.dart';
import 'package:love_bites_user_app/data/network/dio_network.dart';
import 'package:love_bites_user_app/util/api_end_points/api_end_points.dart';

class SendOtpDataProvider {
  final dio = getNetwork();

  Future<SignUpOtpResponseModel> sendOtp(SignupOtpModel signUpOtpModel) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      
      final response =
          await dio.post(ApiEndPoints.sendOtp, data: signUpOtpModel.toJson());
      if (response.statusCode == 200) {
        return SignUpOtpResponseModel.fromJson(response.data);
      } else {
        //if any error
        return SignUpOtpResponseModel(status: 404, message: 'Something error1');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400 ||
          e.response?.statusCode == 500 ||
          e.response?.statusCode == 529) {
        return SignUpOtpResponseModel(
          status: e.response?.statusCode,
          message: e.response?.data['message'],
        );
      }
    } catch (e) {
      return SignUpOtpResponseModel(
          status: 404, message: 'Something error1 $e');
    }

    return SignUpOtpResponseModel();
  }
}
