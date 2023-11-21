import 'package:dio/dio.dart';
import 'package:love_bites_user_app/data/models/sign_up_model/sign_up_model.dart';
import 'package:love_bites_user_app/data/models/sign_up_otp_model/signup_otp_model.dart';
import 'package:love_bites_user_app/data/models/sign_up_otp_response_model/sign_up_otp_response_model.dart';
import 'package:love_bites_user_app/data/network/dio_network.dart';
import 'package:love_bites_user_app/util/api_end_points/api_end_points.dart';

class SendOtpDataProvider {
  final dio = getNetwork();

  Future<SignUpOtpResponseModel> sendOtp(SignUpModel signUpModel) async {
    try {
      final response = await dio.post(ApiEndPoints.sendOtp);
    } on DioException catch (e) {
      print(e.error);
      print(e.response);
      print(e.toString());
    } catch (e) {
      print(e.toString());
    }

    return SignUpOtpResponseModel();
  }
}
