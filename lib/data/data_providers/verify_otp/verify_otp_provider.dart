import 'package:dio/dio.dart';
import 'package:love_bites_user_app/data/models/token_response_model/token_response_model.dart';
import 'package:love_bites_user_app/data/models/verify_otp_model/verify_otp_model.dart';
import 'package:love_bites_user_app/data/network/dio_network.dart';
import 'package:love_bites_user_app/util/api_end_points/api_end_points.dart';

class VerifyOtpDataProvider {
  final dio = getNetwork();
  Future<TokenResponseModel> verifyOtp(VerifyOtpModel verifyOtpModel) async {
    try {
      final response = await dio.post(ApiEndPoints.verifyOtpAndAuth,
          data: verifyOtpModel.toJson());

      if (response.statusCode == 200) {
        return TokenResponseModel.fromJson(response.data);
      } else {
        //if any error
        return TokenResponseModel(status: 404, message: 'Something error1');
      }
    } on DioException catch (e) {
      if (e.response!.statusCode! >= 400) {
        return TokenResponseModel(
            status: e.response?.statusCode,
            message: e.response?.data['message'],
            error: e.response?.data['error']);
      }
    } catch (e) {
      return TokenResponseModel(status: 404, message: 'Something error1 $e');
    }

    return TokenResponseModel();
  }
}
